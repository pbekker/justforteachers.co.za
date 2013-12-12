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
    public class ResourcesController : ApiController
    {
        // GET api/resources
        [HttpGet]
        [AllowAnonymous]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/resources/5
        [HttpGet]
        [AllowAnonymous]
        public ResourceList Get(int id)
        {
            //this is to get a resource
            ResourceList tmpResource = new ResourceList();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdResources
                         join l in dc.bhdResourceLanguages on d.languageId equals l.id
                         join top in dc.bhdResourceTopics on d.topicId equals top.id
                         join typ in dc.bhdResourceTypes on d.typeId equals typ.id
                         where d.id == id
                         select new { ResourceName = d.name, ResourceDescription = d.description, ResourceUpload = d.uploadDate, ResourceId = d.id, ResourceLanguage = l.name, ResourceTopic = top.name, ResourceType = typ.name }).FirstOrDefault();
                if (r != null)
                {
                    tmpResource.ResourceName = r.ResourceName;
                    tmpResource.ResourceDescription = r.ResourceDescription;
                    tmpResource.ResourceUploadDate = r.ResourceUpload.ToShortDateString();
                    tmpResource.ResourceId = r.ResourceId;
                    tmpResource.ResourceLanguage = r.ResourceLanguage;
                    tmpResource.ResourceTopic = r.ResourceTopic;
                    tmpResource.ResourceType = r.ResourceType;
                }
            }
            return tmpResource;
        }

        // POST api/resources
        [HttpPost]
        [AllowAnonymous]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/resources/5
        [HttpPut]
        [AllowAnonymous]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/resources/5
        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id)
        {
        }
    }
}
