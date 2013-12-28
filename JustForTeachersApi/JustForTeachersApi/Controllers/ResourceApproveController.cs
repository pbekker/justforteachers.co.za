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
                         select new { d.name, d.description, d.uploadDate, d.id, language = l.name , topic = top.name, type = typ.name }).Take(20);
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
                    payload.resourceList.Add(tmpPayload);
                }
            }
            return payload;
        }

        // GET api/resourceapprove/5
        [HttpGet]
        [AllowAnonymous]
        public ResourceApprovePayload Get(int id)
        {
            //id is page num
            int skip = id * 20;
            ResourceApprovePayload payload = new ResourceApprovePayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdResources
                         join l in dc.bhdResourceLanguages on d.languageId equals l.id
                         join top in dc.bhdResourceTopics on d.topicId equals top.id
                         join typ in dc.bhdResourceTypes on d.typeId equals typ.id
                         where !d.isActive && !d.approvalDate.HasValue && !d.approvalUser.HasValue
                         select new { d.name, d.description, d.uploadDate, d.id, language = l.name, topic = top.name, type = typ.name }).Skip(skip).Take(20);
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
                    payload.resourceList.Add(tmpPayload);
                }
            }
            return payload;
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
        public void Put(int id, [FromBody]string value)
        {
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
