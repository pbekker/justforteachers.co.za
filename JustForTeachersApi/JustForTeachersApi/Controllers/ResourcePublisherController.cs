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
    public class ResourcePublisherController : ApiController
    {
        // GET api/resourcepublisher
        [HttpGet]
        [AllowAnonymous]
        public List<GenDropList> Get()
        {
            List<GenDropList> tmpList = new List<GenDropList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                List<GenDropList> r = (from d in dc.bhdPublishers
                                       where d.isActive
                                       select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                tmpList = r;
            }
            return tmpList;
        }

        // POST api/resourcepublisher
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            // serialize that shit
            PublisherData uploadModel;
            try
            {
                uploadModel = JsonConvert.DeserializeObject<PublisherData>(jsonstring);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }

            List<GenDropList> repsonse = new List<GenDropList>();
            try
            {
                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    bhdPublisher newPub = new bhdPublisher();
                    newPub.name = uploadModel.PublisherName;
                    newPub.surname = uploadModel.PublisherSurname;
                    newPub.isActive = true;
                    dc.bhdPublishers.InsertOnSubmit(newPub);
                    dc.SubmitChanges();

                    repsonse = (from d in dc.bhdPublishers
                                where d.isActive == true
                                select new GenDropList() { ListId = d.id, ListValue = d.name + " " + d.surname }).ToList();
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }

            return Request.CreateResponse(HttpStatusCode.OK, repsonse);
        }
    }
}
