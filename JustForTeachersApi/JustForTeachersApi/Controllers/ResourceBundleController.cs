using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using JustForTeachersApi.Models;
using System.Web.Http.Cors;
using ResourceData;
using System.Net.Http;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using Newtonsoft.Json;

namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ResourceBundleController : ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        public List<ResourceBundle> Get(int id)
        {
            List<ResourceBundle> bundles = new List<ResourceBundle>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                foreach (var item in dc.sps_getResourceBundleByUserId(id).ToList())
               {
                   ResourceBundle rb = new ResourceBundle();
                   rb.bundleId = item.bundleId;
                   rb.description = item.description;
                   rb.fileExtension = item.fileExtension;
                   rb.fileId = item.fileid;
                   rb.fileName = item.fileName;
                   rb.fileSize = item.fileSize;
                   rb.fileType = item.fileType;
                   rb.isActive = item.isActive;
                   rb.name = item.name;
                   bundles.Add(rb);
               }
            }
            return bundles;
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post(int userId)
        {
            int returnId = 0;
            try
            {                
                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    Stream streamIn = await Request.Content.ReadAsStreamAsync();
                    StreamReader streamReader = new StreamReader(streamIn);
                    string jsonstring = streamReader.ReadToEnd();
                    ResourceBundle newBundle = JsonConvert.DeserializeObject<ResourceBundle>(jsonstring);
                    bhdResourceBundle rb = new bhdResourceBundle();
                    rb.name = newBundle.name;
                    rb.description = newBundle.description;
                    rb.userId = userId;
                    rb.isActive = true;
                    dc.bhdResourceBundles.InsertOnSubmit(rb);
                    dc.SubmitChanges();
                    returnId = rb.bundleId;
                }
            }
            catch (Exception ex) 
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }
            return Request.CreateResponse(HttpStatusCode.OK, returnId);
        }

        [HttpPut]
        [AllowAnonymous]
        public void Put(int id, [FromBody]string value)
        {
            //TODO: this is the tricky one. How do we know if it is just adding a file or changing the bundle info?
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {

            }
        }

        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id)
        {
            // how do I know if I need to remove a file or a whole bundle.
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var rb = dc.bhdResourceBundles.Single((x) => x.bundleId == id);
                if (rb != null)
                {
                    rb.isActive = false;
                    dc.SubmitChanges();
                }
            }
        }

        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id, int fileid)
        {
            // how do I know if I need to remove a file or a whole bundle.
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var rb = dc.bhdResourceBundles.Single((x) => x.bundleId == id);
                if (rb != null)
                {
                    rb.isActive = false;
                    dc.SubmitChanges();
                }
            }
        }
    }
}
