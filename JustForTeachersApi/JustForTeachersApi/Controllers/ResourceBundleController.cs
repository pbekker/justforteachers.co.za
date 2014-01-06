using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using JustForTeachersApi.Models;
using System.Web.Http.Cors;
using ResourceData;
using System.Net.Http;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using Newtonsoft.Json;

namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ResourceBundleController : ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        public List<ResourceBundle> Get(int id)
        {
            List<ResourceBundle> bundles = new List<ResourceBundle>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                foreach (var item in dc.sps_getResourceBundleByUserId(id).ToList())
               {
                   ResourceBundle rb = new ResourceBundle();
                   rb.bundleId = item.bundleId;
                   rb.description = item.description;
                   rb.fileExtension = item.fileExtension;
                   rb.fileId = item.fileid;
                   rb.fileName = item.fileName;
                   rb.fileSize = item.fileSize;
                   rb.fileType = item.fileType;
                   rb.isActive = item.isActive;
                   rb.name = item.name;
                   bundles.Add(rb);
               }
            }
            return bundles;
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post(int userId)
        {
            int returnId = 0;
            try
            {                
                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    Stream streamIn = await Request.Content.ReadAsStreamAsync();
                    StreamReader streamReader = new StreamReader(streamIn);
                    string jsonstring = streamReader.ReadToEnd();
                    ResourceBundle newBundle = JsonConvert.DeserializeObject<ResourceBundle>(jsonstring);
                    bhdResourceBundle rb = new bhdResourceBundle();
                    rb.name = newBundle.name;
                    rb.description = newBundle.description;
                    rb.userId = userId;
                    rb.isActive = true;
                    dc.bhdResourceBundles.InsertOnSubmit(rb);
                    dc.SubmitChanges();
                    returnId = rb.bundleId;

                    bhdResourceBundleFile rbf = new bhdResourceBundleFile();
                    rbf.resourceFileId = newBundle.fileId;
                    rbf.bundleId = returnId;
                    dc.bhdResourceBundleFiles.InsertOnSubmit(rbf);
                    dc.SubmitChanges();
                }
            }
            catch (Exception ex) 
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }
            return Request.CreateResponse(HttpStatusCode.OK, returnId);
        }

        [HttpPut]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Put(int id)
        {
            try
            {
                Stream streamIn = await Request.Content.ReadAsStreamAsync();
                StreamReader streamReader = new StreamReader(streamIn);
                string jsonstring = streamReader.ReadToEnd();
                List<ResourceBundle> newBundles = JsonConvert.DeserializeObject<List<ResourceBundle>>(jsonstring);

                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    bhdResourceBundle currentBundle = dc.bhdResourceBundles.Single((x) => x.bundleId == id);
                    List<bhdResourceBundleFile> bundleFiles = dc.bhdResourceBundleFiles.Where((x) => x.bundleId == id).ToList();

                    if ((newBundles.Count() == 0 && id != 0) || (currentBundle.isActive != newBundles.First().isActive))
                    {
                        currentBundle.isActive = false;
                        dc.SubmitChanges();
                        return Request.CreateResponse(HttpStatusCode.OK, string.Format("Bundle {0} successfully removed.", currentBundle.name));
                    }
                    else if (newBundles.Count() > 0 && id != 0)
                    {
                        foreach (ResourceBundle rb in newBundles)
                        {
                            if (!bundleFiles.Any((x) => x.resourceFileId == rb.fileId))
                            {
                                bhdResourceBundleFile newFile = new bhdResourceBundleFile();
                                newFile.resourceFileId = rb.fileId;
                                newFile.bundleId = id;
                                //TODO: uncomment when dbml is redone.
                                //newFile.isFavourite = rb.isFavourite;
                                dc.bhdResourceBundleFiles.InsertOnSubmit(newFile);
                                dc.SubmitChanges();
                            }
                            else
                            {
                                bhdResourceBundleFile currentfile = bundleFiles.Single((x) => x.resourceFileId == rb.fileId);
                                currentfile.resourceFileId = rb.fileId;
                                currentfile.bundleId = rb.bundleId;
                                //TODO: uncomment when dbml is redone.
                                //newFile.isFavourite = rb.isFavourite;
                                dc.SubmitChanges();
                            }
                        }

                        bundleFiles = dc.bhdResourceBundleFiles.Where((x) => x.bundleId == id).ToList();
                        foreach (bhdResourceBundleFile bf in bundleFiles)
                        {
                            if (!newBundles.Any((x) => x.fileId == bf.resourceFileId))
                            {
                                dc.bhdResourceBundleFiles.DeleteOnSubmit(bf);
                                dc.SubmitChanges();
                            }
                        }
                    }
                    return Request.CreateResponse(HttpStatusCode.OK, string.Format("Bundle files sucessfully for {0}", currentBundle.name));
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Something Broke. " + ex.Message + ". 400-3");
            }
            
        }

        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id)
        {
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var rb = dc.bhdResourceBundles.Single((x) => x.bundleId == id);
                if (rb != null)
                {
                    rb.isActive = false;
                    dc.SubmitChanges();
                }
            }
        }

        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id, int fileid)
        {
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var rb = dc.bhdResourceBundleFiles.Single((x) => x.bundleId == id && x.resourceFileId == fileid);
                if (rb != null)
                {
                    dc.bhdResourceBundleFiles.DeleteOnSubmit(rb);
                    dc.SubmitChanges();
                }
            }
        }
    }
}
