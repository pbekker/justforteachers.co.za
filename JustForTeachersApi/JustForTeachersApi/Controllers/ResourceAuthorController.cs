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
    public class ResourceAuthorController : ApiController
    {
        // GET api/resourceauthor
        [HttpGet]
        [AllowAnonymous]
        public List<GenDropList> Get()
        {
            List<GenDropList> tmpList = new List<GenDropList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                List<GenDropList> r = (from d in dc.bhdAuthors
                                       where d.isActive
                                       select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                tmpList = r;
            }
            return tmpList;
        }

        // POST api/resourceauthor
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            // serialize that shit
            AuthorData uploadModel;
            try
            {
                uploadModel = JsonConvert.DeserializeObject<AuthorData>(jsonstring);
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
                    bhdAuthor newAuth = new bhdAuthor();
                    newAuth.name = uploadModel.AuthorName;
                    newAuth.surname = uploadModel.AuthorSurname;
                    newAuth.isActive = true;
                    dc.bhdAuthors.InsertOnSubmit(newAuth);
                    dc.SubmitChanges();

                    repsonse = (from d in dc.bhdAuthors
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
