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
using System.IO.Compression;
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
        public ResourceViewPayload Get(int id)
        {
            //this is to get a resource
            ResourceViewPayload tmpResource = new ResourceViewPayload();
            ResourceList tmpList = new ResourceList();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdResources
                         join l in dc.bhdResourceLanguages on d.languageId equals l.id
                         join top in dc.bhdResourceTopics on d.topicId equals top.id
                         join typ in dc.bhdResourceTypes on d.typeId equals typ.id
                         join rf in dc.bhdResourceFormats on d.id equals rf.resourceId
                         where d.id == id
                         select new { ResourceName = d.name, ResourceDescription = d.description, ResourceUpload = d.uploadDate, ResourceId = d.id, ResourceLanguage = l.name, ResourceTopic = top.name, ResourceType = typ.name, ResourceFormat = rf.bhdFormat.name, ResourceTopicId = top.id, PreviewFileId = d.previewFileId}).FirstOrDefault();
                if (r != null)
                {
                    tmpList.ResourceName = r.ResourceName;
                    tmpList.ResourceDescription = r.ResourceDescription;
                    tmpList.ResourceUploadDate = r.ResourceUpload.ToShortDateString();
                    tmpList.ResourceId = r.ResourceId;
                    tmpList.ResourceLanguage = r.ResourceLanguage;
                    tmpList.ResourceType = r.ResourceType;
                    tmpList.ResourceFormat = r.ResourceFormat;
                    
                }
                if (r.PreviewFileId != null)
                    tmpList.PreviewFileId = (int)r.PreviewFileId;
                
                // resource comments
                List<Comment> resourceComments = dc.bhdResourceComments.Where((x) => x.resourceId == id && x.isActive.Value).Select(x => new Comment { userId = x.userId, resourceId = x.resourceId, commentDate = x.commentDate.Value, comment = x.comment, commentId = x.id, active = x.isActive.Value }).ToList();
                tmpResource.comments = resourceComments;
                tmpResource.resourceInfo = tmpList;
                //fix for the topic
                var rtopic = dc.sps_getResourceTopicListById(r.ResourceTopicId, true);
                foreach (var item in rtopic)
                {
                    if (tmpList.ResourceTopic != null)
                    {
                        tmpList.ResourceTopic = tmpList.ResourceTopic + " > " + item.name;
                    }
                    else
                    {
                        tmpList.ResourceTopic = item.name;
                    }
                }

                List<FileViewInfo> files = (from f in dc.bhdResourceFiles
                                            where f.resourceId == r.ResourceId
                                            select new FileViewInfo() { FileName = f.bhdFile.name, FileSize = f.bhdFile.size, FileContentType = f.bhdFile.bhdFileType.extension, FileId = f.bhdFile.id }).ToList();
                foreach (var item in files)
                {
                    if (item.FileSize != null && item.FileSize != 0)
                    {
                        item.FileSize = item.FileSize / 1000;
                    }
                    string fileContentType = item.FileContentType;
                    if (fileContentType != null && fileContentType != "")
                    {
                        fileContentType = fileContentType.Substring((fileContentType.IndexOf('/') + 1), fileContentType.Length - (fileContentType.IndexOf('/') + 1));
                    }
                    item.FileContentType = fileContentType;
                }
                tmpResource.fileInfo = files;

                List<LinkViewInfo> urls = (from u in dc.bhdResourceLinks
                                           where u.resourceId == r.ResourceId
                            select new LinkViewInfo() { resourceURL = u.bhdLink.url }).ToList();
                tmpResource.urlInfo = urls;
                string tagRet = "";
                var tags = (from t in dc.bhdResourceKeywords
                            join k in dc.bhdKeywords on t.KeywordId equals k.id
                            where k.isActive
                            && t.Resourceid == id
                            select k.value).ToList();
                foreach (var item in tags)
                {
                    tagRet = tagRet + item + ",";
                }
                if (tagRet.Length > 0)
                    tagRet = tagRet.Remove(tagRet.Length - 1, 1);
                tmpResource.resourceInfo.ResourceTags = tagRet;
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
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                bhdResource currentResource = dc.bhdResources.Single((x) => x.id == id);
                currentResource.isActive = false;
                dc.SubmitChanges();
            }
        }
    }
}
