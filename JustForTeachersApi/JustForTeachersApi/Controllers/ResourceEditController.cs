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
                                                join a in dc.bhdPublishInformations on r.ResourceId equals a.resourceId 
                                                where f.resourceId == r.ResourceId
                                                && f.fileId == a.fileId
                                                select new FileViewInfo() { FileName = f.bhdFile.name, FileSize = f.bhdFile.size, FileContentType = f.bhdFile.bhdFileType.contentType, FileId = f.bhdFile.id, authorId = a.authorId, publisherId = a.publisherId, year = a.publishYear }).ToList();
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
                // serialize that shit
                ResourceEditSend uploadModel;
                try
                {
                    uploadModel = JsonConvert.DeserializeObject<ResourceEditSend>(jsonstring);
                }
                catch (Exception ex)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
                }

                //update the information
                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    bhdResource tmpResource = dc.bhdResources.Single((x) => x.id == id);
                    tmpResource.name = uploadModel.resourceInfo.ResourceName;
                    tmpResource.description = uploadModel.resourceInfo.ResourceDescription;
                    tmpResource.topicId = uploadModel.resourceInfo.ResourceTopicId;
                    tmpResource.languageId = uploadModel.resourceInfo.ResourceLanguageId;
                    dc.SubmitChanges();

                    if (uploadModel.URL != "")
                    {
                    }

                   dc.bhdResourceKeywords.DeleteAllOnSubmit<bhdResourceKeyword>(dc.bhdResourceKeywords.Where((r)=>r.Resourceid == id));
                   

                    foreach (var item in uploadModel.tagsInfo.tags)
                    {
                        var r = (from d in dc.bhdKeywords
                                 where d.isActive && d.value == item
                                 select d).FirstOrDefault();
                        if (r != null)
                        {
                            bhdResourceKeyword tmpResourceKeyword = new bhdResourceKeyword();
                            tmpResourceKeyword.KeywordId = r.id;
                            tmpResourceKeyword.Resourceid = tmpResource.id;
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
                            tmpResourceKeyword.Resourceid = tmpResource.id;
                            dc.bhdResourceKeywords.InsertOnSubmit(tmpResourceKeyword);
                            dc.SubmitChanges();
                        }
                    }

                }

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Success");
        }
    }
}
