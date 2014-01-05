using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JustForTeachersApi.Models;
using ResourceData;
using System.Net.Http;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace JustForTeachersApi
{
    public class ResourceUploadHelper
    {
        public static int UploadResourceData(UploadData data)
        {
            int retId = 0;
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {

                bhdResource r = new bhdResource();
                r.name = data.ResourceName;
                r.description = data.ResourceDescription;
                r.languageId = data.ResourceLanguageId;
                r.typeId = data.ResourceTypeId;
                r.topicId = data.ResourceTopicId;
                r.uploadDate = DateTime.Now;
                dc.bhdResources.InsertOnSubmit(r);
                dc.SubmitChanges();
                retId = r.id;

                bhdResourceRating rr = new bhdResourceRating();
                rr.resourceId = r.id;
                rr.rating = 1;
                rr.userId = 1; // TODO: Update when the user is passed through.
                dc.bhdResourceRatings.InsertOnSubmit(rr);
                dc.SubmitChanges();
            }
            return retId;
        }

        public static List<ResourceFile> UploadResourceFile(List<FileData> files, int resourceId)
        {
            List<ResourceFile> resFileRet = new List<ResourceFile>();
            //we get the information
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                foreach (FileData item in files)
                {


                    bhdFile f = new bhdFile();
                    f.size = item.fileSize;
                    f.name = item.fileName;
                    f.isActive = true;
                    f.fileTypeId = 1;
                    dc.bhdFiles.InsertOnSubmit(f);
                    dc.SubmitChanges();

                    bhdFileData fd = new bhdFileData();
                    fd.fileId = f.id;
                    fd.data = item.fileData;
                    dc.bhdFileDatas.InsertOnSubmit(fd);
                    dc.SubmitChanges();

                    bhdResourceFile rf = new bhdResourceFile();
                    rf.resourceId = resourceId;
                    rf.fileId = f.id;
                    dc.bhdResourceFiles.InsertOnSubmit(rf);
                    dc.SubmitChanges();

                }
                var r = (from d in dc.bhdResourceFiles
                         where d.resourceId == resourceId
                         select d);
                foreach (var resfile in r)
                {
                    ResourceFile tmpFileRes = new ResourceFile();
                    tmpFileRes.fileid = resfile.fileId;
                    tmpFileRes.filename = resfile.bhdFile.name;
                    resFileRet.Add(tmpFileRes);
                }
            }
            return resFileRet;
        }

        public static void GenerateFilePreview(string filePath)
        {
            try
            {
                Image tempImage = null;
                using (FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read))
                {
                    tempImage = Image.FromStream(fs);
                }
                string outputFileName = "C:\\myTests\\mynewimage.png";
                using (MemoryStream memory = new MemoryStream())
                {
                    using (FileStream fs = new FileStream(outputFileName, FileMode.Create, FileAccess.ReadWrite))
                    {
                        tempImage.Save(memory, ImageFormat.Png);
                        byte[] bytes = memory.ToArray();
                        fs.Write(bytes, 0, bytes.Length);
                    }
                }
            }
            catch
            {
                //shit went wrong
            }
        }

    }
}