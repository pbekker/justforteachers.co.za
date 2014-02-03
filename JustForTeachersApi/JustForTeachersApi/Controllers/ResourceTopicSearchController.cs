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
    public class ResourceTopicSearchController : ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        public List<GenDropList> Get()
        {
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                Dictionary<int, string> tmpParents = new Dictionary<int, string>();
                List<GenDropList> tmpList = new List<GenDropList>();
                var r = db.sps_getResourceTopic(null);
                foreach (var item in r)
                {
                    if (item.parentId.HasValue)
                    {
                        string tmp;
                        tmpParents.TryGetValue((int)item.parentId, out tmp);
                        tmpParents.Add(item.id, tmp + " > " + item.name);
                        GenDropList mtp = new GenDropList();
                        mtp.ListId = item.id;
                        mtp.ListValue = tmp + " > " + item.name;
                        if (item.linkedResources != null)
                            mtp.ListValue = mtp.ListValue + "(" + item.linkedResources.ToString() + ")";
                        tmpList.Add(mtp);
                    }
                    else
                    {
                        tmpParents.Add(item.id, item.name);
                        GenDropList mtp = new GenDropList();
                        mtp.ListId = item.id;
                        mtp.ListValue = item.name;
                        if (item.linkedResources != null)
                            mtp.ListValue = mtp.ListValue + "(" + item.linkedResources.ToString() + ")";
                        tmpList.Add(mtp);
                    }
                }

                return tmpList;
            }
        }

        public ResourceListPayload Get(int id, string topic)
        {
            int topicId = int.Parse(topic);
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = dc.sps_getResourceListByTopic(topicId, true, id + 1, 20, null, null); 
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
                    if (item.previewFileId.HasValue)
                    {
                        tmpPayload.PreviewFileId = (int)item.previewFileId;
                    }
                }
            }
            return payload;
        }

        [HttpGet]
        [AllowAnonymous]
        public ResourceListPayload Get(int id, string topic, string orderby, string order)
        {
            int topicId = int.Parse(topic);
            ResourceListPayload payload = new ResourceListPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                //var r = dc.sps_getResourceList(false, id + 1, 20, search); //name, rating or topic
                var r = dc.sps_getResourceListByTopic(topicId, true, id + 1, 20, orderby, order);
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
                    if (item.previewFileId.HasValue)
                    {
                        tmpPayload.PreviewFileId = (int)item.previewFileId;
                    }
                }
            }
            return payload;
        }

    }
}
