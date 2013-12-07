using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ResourceData;
using JustForTeachersApi.Models;
using System.Threading.Tasks;
using System.Web;
using System.IO;
using System.Web.Http.Cors;
using Newtonsoft.Json;


namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ResourceUploadController : ApiController
    {
        // GET api/resourceupload
        [HttpGet]
        [AllowAnonymous]
        public ResourcePayload Get()
        {
            ResourcePayload payload = new ResourcePayload();
            GenDropList tmpList = new GenDropList();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                List<GenDropList> r = (from d in dc.bhdResourceTypes
                                       where d.isActive
                                       select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.types = r;
                r = (from d in dc.bhdResourceTopics
                     where d.isActive
                     select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.topics = r;
                r = (from d in dc.bhdResourceLanguages
                     where d.isActive
                     select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.languages = r;

            }
            return payload;
        }

        // GET api/resourceupload/5
        [HttpGet]
        [AllowAnonymous]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/resourceupload
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            try
            {
                if (!Request.Content.IsMimeMultipartContent())
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Unable to turn the data into a valid resource, check if you sent eveything through. 400-1");
                }

                var root = HttpContext.Current.Server.MapPath("~/Uploads/Tmp");
                Directory.CreateDirectory(root);
                var provider = new MultipartFormDataStreamProvider(root);
                var result = await Request.Content.ReadAsMultipartAsync(provider);
                if (result.FormData["model"] == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Unable to turn the data into a valid resource, check if you sent eveything through. 400-2");
                }

                // serialize that shit
                string model = result.FormData["model"];
                UploadData uploadModel;
                try
                {
                    uploadModel = JsonConvert.DeserializeObject<UploadData>(model);
                }
                catch (Exception ex)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
                }

                //send the object to the resource maker stuff
                int ResourceId = ResourceUploadHelper.UploadResourceData(uploadModel);
                
                //get the files
                foreach (MultipartFileData file in result.FileData) {
                    ResourceUploadHelper.UploadResourceFile(file);
                    //generate a preview for the image
                    ResourceUploadHelper.GenerateFilePreview(file.LocalFileName);
                }



            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + " 400-3");
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Success");

        }

        // PUT api/resourceupload/5
        [HttpPut]
        [AllowAnonymous]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/resourceupload/5
        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id)
        {
        }

    }
}
