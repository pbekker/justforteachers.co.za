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
    public class ResourceFileController : ApiController
    {
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            // serialize that shit
            List<FileInfoData> uploadModel;
            try
            {
                uploadModel = JsonConvert.DeserializeObject<List<FileInfoData>>(jsonstring);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
            try
            {
                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    foreach (FileInfoData item in uploadModel)
                    {
                        bhdResourceAuthor authData = new bhdResourceAuthor();
                        authData.authorId = item.authorid;
                        authData.fileId = item.fileid;
                        dc.bhdResourceAuthors.InsertOnSubmit(authData);
                        dc.SubmitChanges();

                        bhdPublishInformation pubData = new bhdPublishInformation();
                        pubData.authorId = item.authorid;
                        pubData.isActive = true;
                        pubData.publisherId = item.publisherid;
                        pubData.publishYear = item.publishYear;
                        dc.bhdPublishInformations.InsertOnSubmit(pubData);
                        dc.SubmitChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Sucess");
        }

    }
}
