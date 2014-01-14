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
    public class ResourceEditController : ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        public ResourceEditPayload Get(int id)
        {
            //this is to get a resource
            ResourceEditPayload tmpResource = new ResourceEditPayload();
            ResourceEditList tmpList = new ResourceEditList();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdResources
                         join l in dc.bhdResourceLanguages on d.languageId equals l.id
                         join top in dc.bhdResourceTopics on d.topicId equals top.id
                         join typ in dc.bhdResourceTypes on d.typeId equals typ.id
                         where d.id == id
                         select new { ResourceName = d.name, ResourceDescription = d.description, ResourceUpload = d.uploadDate, ResourceId = d.id, ResourceLanguageId = l.id, ResourceLanguage = l.name, ResourceTopicId = top.id, ResourceTopic = top.name, ResourceTypeId = typ.id, ResourceType = typ.name }).FirstOrDefault();
                if (r != null)
                {
                    tmpList.ResourceName = r.ResourceName;
                    tmpList.ResourceDescription = r.ResourceDescription;
                    tmpList.ResourceUploadDate = r.ResourceUpload.ToShortDateString();
                    tmpList.ResourceId = r.ResourceId;
                    tmpList.ResourceLanguage = r.ResourceLanguage;
                    tmpList.ResourceTopic = r.ResourceTopic;
                    tmpList.ResourceType = r.ResourceType;
                    tmpList.ResourceLanguageId = r.ResourceLanguageId;
                    tmpList.ResourceTopicId = r.ResourceTopicId;
                    tmpList.ResourceTypeId = r.ResourceTypeId;
                }
                tmpResource.resourceInfo = tmpList;

                if (r.ResourceTypeId == 1)
                {
                    List<FileViewInfo> files = (from f in dc.bhdResourceFiles
                                                where f.resourceId == r.ResourceId
                                                select new FileViewInfo() { FileName = f.bhdFile.name, FileSize = f.bhdFile.size, FileContentType = f.bhdFile.bhdFileType.contentType, FileId = f.bhdFile.id }).ToList();
                    tmpResource.fileInfo = files;
                }
                if (r.ResourceTypeId == 2)
                {
                    List<LinkViewInfo> urls = (from u in dc.bhdResourceLinks
                                               where u.resourceId == r.ResourceId
                                               select new LinkViewInfo() { resourceURL = u.bhdLink.url }).ToList();
                    tmpResource.urlInfo = urls;
                }
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

    }
}
