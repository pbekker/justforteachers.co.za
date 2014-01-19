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
                    tmpPayload.PreviewFileId = item.id;
                    payload.count = (int)item.total;
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
                    payload.count = (int)item.total;
                    payload.resourceList.Add(tmpPayload);
                }
            }
            return payload;
        }

        // GET api/ResourceList/5/orderby
        [HttpGet]
        [AllowAnonymous]
        public ResourceListPayload Get(int id, string search)
        {
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                //var r = dc.sps_getResourceList(false, id + 1, 20, search); //name, rating or topic
                var r = dc.sps_getResourceListByKeywordList(search, false, id + 1, 20, null, null);
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
                    payload.count = (int)item.total;
                    payload.resourceList.Add(tmpPayload);
                }
            }
            return payload;
        }

        [HttpGet]
        [AllowAnonymous]
        public ResourceListPayload Get(int id, string search, string orderby, string order)
        {
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                //var r = dc.sps_getResourceList(false, id + 1, 20, search); //name, rating or topic
                var r = dc.sps_getResourceListByKeywordList(search, false, id + 1, 20, orderby, order);
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
                    payload.count = (int)item.total;
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
                    payload.count = (int)item.total;
                    payload.resourceList.Add(tmpPayload);
                }
            }
            return payload;
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post(int id)
        {
            try
            {
                var result = Request.Content.ReadAsFormDataAsync();
                Stream streamIn = await Request.Content.ReadAsStreamAsync();
                StreamReader streamReader = new StreamReader(streamIn);
                string jsonstring = streamReader.ReadToEnd();

                var temp = JsonConvert.DeserializeObject<TagsInfo>(jsonstring);

                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    foreach (var item in temp.tags)
                	{
                        var r = (from d in dc.bhdKeywords
                                 where d.isActive && d.value == item
                                 select d).FirstOrDefault();
                        if (r != null)
                        {
                            bhdResourceKeyword tmpResourceKeyword = new bhdResourceKeyword();
                            tmpResourceKeyword.KeywordId = r.id;
                            tmpResourceKeyword.Resourceid = temp.ResourceId;
                            dc.bhdResourceKeywords.InsertOnSubmit(tmpResourceKeyword);
                            dc.SubmitChanges();
                        }
                        else
                        {
                            bhdKeyword tmpkeyword = new bhdKeyword();
                            tmpkeyword.value = item;
                            tmpkeyword.isActive = true;
                            dc.bhdKeywords.InsertOnSubmit(tmpkeyword);
                            dc.SubmitChanges();

                            bhdResourceKeyword tmpResourceKeyword = new bhdResourceKeyword();
                            tmpResourceKeyword.KeywordId = tmpkeyword.id;
                            tmpResourceKeyword.Resourceid = temp.ResourceId;
                            dc.bhdResourceKeywords.InsertOnSubmit(tmpResourceKeyword);
                            dc.SubmitChanges();
                        }
                    }
                }

                return Request.CreateResponse(HttpStatusCode.OK, "Success");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. 400-1");
            }

        }
    }
}
