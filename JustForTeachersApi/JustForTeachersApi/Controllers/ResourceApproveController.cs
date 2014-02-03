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
    public class ResourceApproveController : ApiController
    {
        // GET api/resourceapprove
        [HttpGet]
        [AllowAnonymous]
        public ResourceApprovePayload Get()
        {
            ResourceApprovePayload payload = new ResourceApprovePayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdResources
                         join l in dc.bhdResourceLanguages on d.languageId equals l.id
                         join top in dc.bhdResourceTopics on d.topicId equals top.id
                         join typ in dc.bhdResourceTypes on d.typeId equals typ.id
                         where !d.isActive && !d.approvalDate.HasValue && !d.approvalUser.HasValue
                         select new { d.name, d.description, d.uploadDate, d.id, language = l.name , topic = top.name, type = typ.name, d.isActive }).Take(20);
                foreach (var item in r)
                {
                    ResourceList tmpPayload = new ResourceList();
                    tmpPayload.ResourceName = item.name;
                    tmpPayload.ResourceDescription = item.description;
                    tmpPayload.ResourceLanguage = item.language;
                    tmpPayload.ResourceTopic = item.topic;
                    tmpPayload.ResourceUploadDate = item.uploadDate.ToShortDateString();
                    tmpPayload.ResourceId = item.id;
                    tmpPayload.ResourceType = item.type;
                    tmpPayload.isActive = item.isActive;
                    payload.resourceList.Add(tmpPayload);
                }
            }
            return payload;
        }

        // GET api/resourceapprove/5
        [HttpGet]
        [AllowAnonymous]
        public ResourceList Get(int id)
        {
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdResources
                         join l in dc.bhdResourceLanguages on d.languageId equals l.id
                         join top in dc.bhdResourceTopics on d.topicId equals top.id
                         join typ in dc.bhdResourceTypes on d.typeId equals typ.id
                         where !d.isActive && !d.approvalDate.HasValue && !d.approvalUser.HasValue && d.id == id
                         select new { d.name, d.description, d.uploadDate, d.id, language = l.name, topic = top.name, type = typ.name, d.isActive }).FirstOrDefault();

                ResourceList resource = new ResourceList();
                resource.ResourceName = r.name;
                resource.ResourceDescription = r.description;
                resource.ResourceLanguage = r.language;
                resource.ResourceTopic = r.topic;
                resource.ResourceUploadDate = r.uploadDate.ToShortDateString();
                resource.ResourceId = r.id;
                resource.ResourceType = r.type;
                resource.isActive = r.isActive;

                return resource;
            }
        }

        // GET api/resourceapprove/5/orderby
        [HttpGet]
        [AllowAnonymous]
        public string Get(int id, string orderby)
        {
            return "ordered";
        }
        
        // POST api/resourceapprove
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            return Request.CreateResponse(HttpStatusCode.BadRequest, "I do not know what you are trying to do, you can not post an approve with no id. (POST) not supported here. 400-1");
        }

        // PUT api/resourceapprove/5
        [HttpPut]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Put(int id)
        {
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            ResourceList currentResource;
            try
            {
                currentResource = JsonConvert.DeserializeObject<ResourceList>(jsonstring);
            }
            catch (Exception ex)
            {
                
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
            try
            {
                using (ResourcesDataContext db = new ResourcesDataContext())
                {
                    bhdResource approvalResource = db.bhdResources.Single((x) => x.id == currentResource.ResourceId);
                    approvalResource.isActive = currentResource.isActive;
                    approvalResource.approvalDate = DateTime.Now;
                    approvalResource.approvalUser = id;
                    db.SubmitChanges();
                }
                if (currentResource.isActive)
                    return Request.CreateResponse(HttpStatusCode.OK, "Resource approved!");
                else
                    return Request.CreateResponse(HttpStatusCode.OK, "Resource declined.");
            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        // DELETE api/resourceapprove/5
        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id)
        {
            //this is where we deactivate resources
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdResources
                         join l in dc.bhdResourceLanguages on d.languageId equals l.id
                         join top in dc.bhdResourceTopics on d.topicId equals top.id
                         join typ in dc.bhdResourceTypes on d.typeId equals typ.id
                         where d.id == id
                         select d).FirstOrDefault();
                if (r != null)
                {
                    r.isActive = false;
                    dc.SubmitChanges();
                }
            }
        }

    }
}
