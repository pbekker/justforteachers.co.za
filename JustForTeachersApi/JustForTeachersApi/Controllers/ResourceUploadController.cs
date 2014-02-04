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
using System.Data;


namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ResourceUploadController : ApiController
    {
        // GET api/resourceupload
        [HttpGet]
        [AllowAnonymous]
        public ResourcePayload Get()
        {
            ResourcePayload payload = new ResourcePayload();
            GenDropList tmpList = new GenDropList();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                List<GenDropList> r = (from d in dc.bhdResourceTypes
                                       where d.isActive
                                       select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.types = r;
                
                r = (from d in dc.bhdFormats
                     where (bool)d.isActive
                     select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.formats = r;

                r = (from d in dc.bhdResourceLanguages
                     where d.isActive
                     select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.languages = r;
                DataTable tmpDT = new DataTable();
                tmpDT.TableName = "Topics";
                DataColumn workCol = tmpDT.Columns.Add("id", typeof(Int32));
                workCol.AllowDBNull = false;
                workCol.Unique = true;

                tmpDT.Columns.Add("parentid", typeof(Int32));
                tmpDT.Columns.Add("name", typeof(String));

                var tr = (from d in dc.bhdResourceTopics
                          where d.isActive
                          select new { d.id, d.parentId, d.name }).ToList();
                foreach (var item in tr)
                {
                    
                    DataRow workRow = tmpDT.NewRow();
                    workRow["id"] = item.id;
                    if (item.parentId == null)
                        workRow["parentid"] = 0;
                    else
                        workRow["parentid"] = item.parentId;
                    workRow["name"] = item.name;
                    tmpDT.Rows.Add(workRow);
                }
                payload.topics = tmpDT;
            }
            return payload;
        }

        // POST api/resourceupload
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            int ResourceId;
            try
            {
                var result = Request.Content.ReadAsFormDataAsync();
                Stream streamIn = await Request.Content.ReadAsStreamAsync();
                StreamReader streamReader = new StreamReader(streamIn);
                string jsonstring = streamReader.ReadToEnd();
                // serialize that shit
                UploadData uploadModel;
                try
                {
                    uploadModel = JsonConvert.DeserializeObject<UploadData>(jsonstring);
                }
                catch (Exception ex)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
                }

                //send the object to the resource maker stuff
                ResourceId = ResourceUploadHelper.UploadResourceData(uploadModel);

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }

            return Request.CreateResponse(HttpStatusCode.OK, ResourceId);

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

                var temp = JsonConvert.DeserializeObject<FileData>(jsonstring);

                ResourceFile tmpReturn = ResourceUploadHelper.UploadResourceFile(temp, id);

                return Request.CreateResponse(HttpStatusCode.OK, tmpReturn);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. 400-1");
            }

        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post(int id, string type)
        {
            if (type != "website")
            {
                try
                {
                    var result = Request.Content.ReadAsFormDataAsync();
                    Stream streamIn = await Request.Content.ReadAsStreamAsync();
                    StreamReader streamReader = new StreamReader(streamIn);
                    string jsonstring = streamReader.ReadToEnd();
                    ResourceFile resFileRet;

                    var temp = JsonConvert.DeserializeObject<FileData>(jsonstring);
                    using (ResourcesDataContext dc = new ResourcesDataContext())
                    {

                        //check if we have the file type
                        int typeid = 0;
                        var temptype = (from d in dc.bhdFileTypes
                                    where d.contentType == temp.fileType
                                    && d.isActive
                                    select d).FirstOrDefault();
                        if (temptype == null)
                        {
                            bhdFileType ft = new bhdFileType();
                            ft.contentType = temp.fileType;
                            string extension = temp.fileName;
                            int pos = extension.LastIndexOf('.');
                            ft.extension = extension.Substring(pos + 1, extension.Length - (pos + 1));
                            ft.isActive = true;
                            dc.bhdFileTypes.InsertOnSubmit(ft);
                            dc.SubmitChanges();
                            typeid = ft.id;
                        }
                        else
                        {
                            typeid = temptype.id;
                        }
                        bhdFile f = new bhdFile();
                        f.size = temp.fileSize;
                        f.name = temp.fileName;
                        f.isActive = true;
                        f.fileTypeId = typeid;
                        dc.bhdFiles.InsertOnSubmit(f);
                        dc.SubmitChanges();

                        bhdFileData fd = new bhdFileData();
                        fd.fileId = f.id;
                        fd.data = temp.fileData;
                        dc.bhdFileDatas.InsertOnSubmit(fd);
                        dc.SubmitChanges();

                        bhdResource res = (from d in dc.bhdResources
                                           where d.id == id
                                           select d).FirstOrDefault();
                        res.previewFileId = f.id;
                        dc.SubmitChanges();
                    }
                    return Request.CreateResponse(HttpStatusCode.OK, "success");
                }
                catch (Exception)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. 400-1");
                }
            }
            else
            {
                try
                {
                    //this is for a website
                    string websiteUrl = "";
                    var result = Request.Content.ReadAsFormDataAsync();
                    Stream streamIn = await Request.Content.ReadAsStreamAsync();
                    StreamReader streamReader = new StreamReader(streamIn);
                    string jsonstring = streamReader.ReadToEnd();

                    var temp = JsonConvert.DeserializeObject<string>(jsonstring);
                    websiteUrl = temp;
                    using (ResourcesDataContext dc = new ResourcesDataContext())
                    {
                        bhdLink l = new bhdLink();
                        l.url = websiteUrl;
                        dc.bhdLinks.InsertOnSubmit(l);
                        dc.SubmitChanges();

                        bhdResourceLink rl = new bhdResourceLink();
                        rl.linkId = l.linkId;
                        rl.resourceId = id;
                        dc.bhdResourceLinks.InsertOnSubmit(rl);
                        dc.SubmitChanges();
                    }

                    return Request.CreateResponse(HttpStatusCode.OK, "Success");
                }
                catch (Exception)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. 400-9");
                    throw;
                }
            }
        }
        
        // PUT api/resourceupload/5
        [HttpPut]
        [AllowAnonymous]
        public void Put(int id, [FromBody]string value)
        {
            //this is where you edit the resource

        }

        // DELETE api/resourceupload/5
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
