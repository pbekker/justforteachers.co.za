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
using Ionic.Zip;
using System.Web.Mvc;

namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ResourceFileController : ApiController
    {
        [System.Web.Http.HttpGet]
        [System.Web.Http.AllowAnonymous]
        public FileResult Get(int id)
        {
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                if (id == 0)
                    id = 1;
                var fileInfo = db.bhdFiles.Where((x) => x.id == id).FirstOrDefault();
                if (fileInfo != null)
                    return new FileContentResult(fileInfo.bhdFileData.data.ToArray(), fileInfo.bhdFileType.contentType);
                else
                    return null;
             }
        }

        [System.Web.Http.HttpPost]
        [System.Web.Http.AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            // serialize that shit
            FileInfoData uploadModel;
            try
            {
                uploadModel = JsonConvert.DeserializeObject<FileInfoData>(jsonstring);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
            try
            {
                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    if (uploadModel.publisherid != 0 && uploadModel.authorid != 0)
                    {
                        bhdPublishInformation pubData = new bhdPublishInformation();
                        pubData.resourceId = uploadModel.resourceid;
                        pubData.authorId = uploadModel.authorid;
                        pubData.fileId = uploadModel.fileid;
                        pubData.isActive = true;
                        pubData.publisherId = uploadModel.publisherid;
                        pubData.publishYear = uploadModel.publishYear;
                        dc.bhdPublishInformations.InsertOnSubmit(pubData);
                        dc.SubmitChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Sucess");
        }

        [System.Web.Http.HttpPut]
        [System.Web.Http.AllowAnonymous]
        public async Task<HttpResponseMessage> Put()
        {
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            // serialize that shit
            List<int> id;
            try
            {
                id = JsonConvert.DeserializeObject<List<int>>(jsonstring);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
            if (id.Count() == 0)
                return Request.CreateResponse(HttpStatusCode.BadRequest, "No file id sent through.");
            try
            {
                using (ResourcesDataContext db = new ResourcesDataContext())
                {
                    FileDownloadData tmpDownloadData = new FileDownloadData();
                    if (id.Count() == 1)
                    {
                        bhdFileData fileData = db.bhdFileDatas.Single((x) => x.fileId == id.First());
                        tmpDownloadData.FileData = fileData.data.ToArray();
                        tmpDownloadData.ContentDisposition = "attachment";
                        tmpDownloadData.ContentDispositionFileName = fileData.bhdFile.name;
                        return Request.CreateResponse(HttpStatusCode.OK, tmpDownloadData);
                    }
                    else
                    {

                        HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
                        string archiveName = String.Format("justforteachers-{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                        response.Content.Headers.ContentDisposition.FileName = archiveName;
                        response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
                        MemoryStream fs = new MemoryStream();
                        using (ZipFile zf = new ZipFile())
                        {
                            foreach (int fileId in id)
                            {
                                bhdFileData fileData = db.bhdFileDatas.Single((x) => x.fileId == id.First());
                                zf.AddEntry(fileData.bhdFile.name + fileData.bhdFile.bhdFileType.extension, fileData.data.ToArray());
                            }
                            zf.Save(fs);
                        }
                        BinaryReader br = new BinaryReader(fs);
                        response.Content = new ByteArrayContent(br.ReadBytes(int.Parse(fs.Length.ToString())));
                        return response;
                    }
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, string.Format("No File(s) found. /r/n {0}", ex.Message));
            }
        }
    }
}
