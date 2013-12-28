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
    public class ResourceListController : ApiController
    {
        // GET api/ResourceList
        [HttpGet]
        [AllowAnonymous]
        public ResourceListPayload Get()
        {
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = dc.sps_getResourceList(false, 1, 20, null, null);
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

        // GET api/ResourceList/5
        [HttpGet]
        [AllowAnonymous]
        public ResourceListPayload Get(int id)
        {
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = dc.sps_getResourceList(false, id + 1, 20, null, null); 
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

        // GET api/ResourceList/5/orderby
        [HttpGet]
        [AllowAnonymous]
        public ResourceListPayload Get(int id, string orderby)
        {
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = dc.sps_getResourceList(false, id + 1, 20, orderby, "ASC"); //name, rating or topic
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

        // GET api/ResourceList/5/orderby/direction
        [HttpGet]
        [AllowAnonymous]
        public ResourceListPayload Get(int id, string orderby, string order)
        {
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = dc.sps_getResourceList(false, id + 1, 20, orderby, order); //name, rating or topic
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

        // POST api/ResourceList
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            return Request.CreateResponse(HttpStatusCode.BadRequest, "Resource List does not support the method (POST). 400-1");
        }

        // PUT api/ResourceList/5
        [HttpPut]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Put(int id, [FromBody]string value)
        {
            return Request.CreateResponse(HttpStatusCode.BadRequest, "Resource List does not support the method (PUT). 400-2");
        }

        // DELETE api/ResourceList/5
        [HttpDelete]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Delete(int id)
        {
            return Request.CreateResponse(HttpStatusCode.BadRequest, "Resource List does not support the method (PUT). 400-3");
        }
    }
}
