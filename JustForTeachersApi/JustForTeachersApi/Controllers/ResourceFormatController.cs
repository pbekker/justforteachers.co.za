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
    public class ResourceFormatController : ApiController
    {
        public class ResourceFormat
        {
            public int formatId { get; set; }
            public string name { get; set; }
            public bool? active { get; set; }
        }

        [HttpGet]
        [AllowAnonymous]
        public List<ResourceFormat> Get()
        {
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                List<ResourceFormat> formats = db.bhdFormats.Select(x => new ResourceFormat { formatId = x.id, name = x.name, active = x.isActive}).ToList();
                return formats;
            }
        }

        [HttpGet]
        [AllowAnonymous]
        public ResourceFormat Get(int id)
        {
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                bhdFormat dbFormat = db.bhdFormats.Single(x => x.id == id);
                return new ResourceFormat { formatId = dbFormat.id, name = dbFormat.name, active = dbFormat.isActive };
            }
        }

        [HttpPost]
        [AllowAnonymous]
        public void Post()
        {
        }

        [HttpPut]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Put()
        {
            HttpResponseMessage response = new HttpResponseMessage();
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            ResourceFormat currentFormat;
            try
            {
                currentFormat = JsonConvert.DeserializeObject<ResourceFormat>(jsonstring);
            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }

            try
            {
                using (ResourcesDataContext db = new ResourcesDataContext())
                {
                    if (currentFormat.formatId == 0)
                    {
                        bhdFormat newFormat = new bhdFormat();
                        newFormat.name = currentFormat.name;
                        newFormat.isActive = currentFormat.active;
                        db.bhdFormats.InsertOnSubmit(newFormat);
                        db.SubmitChanges();
                        response = Request.CreateResponse(HttpStatusCode.OK, "New Format sucessfully added.");
                    }
                    else
                    {
                        bhdFormat editformat = db.bhdFormats.Single((x) => x.id == currentFormat.formatId);
                        editformat.isActive = currentFormat.active.Value;
                        editformat.name = currentFormat.name;
                        db.SubmitChanges();
                        response = Request.CreateResponse(HttpStatusCode.OK, "Format sucessfully edited.");
                    }
                }
            }
            catch (Exception ex)
            {
                Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }

            return response;
        }

        [HttpDelete]
        [AllowAnonymous]
        public HttpResponseMessage Delete(int id)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                try
                {
                    db.bhdFormats.DeleteOnSubmit(db.bhdFormats.Single((x) => x.id == id));
                    db.SubmitChanges();
                }
                catch (Exception ex)
                {
                    Request.CreateResponse(HttpStatusCode.PreconditionFailed, "Could not Remove the Format. \r\n" + ex.ToString());
                }
            }
            return response;
        }
    }
}