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
            }
            return retId;
        }

        public static void UploadResourceFile(MultipartFileData file)
        {
            //so we need to check the filetype
            var filetype = file.Headers.ContentType;
            var filePath = file.LocalFileName;
            int fileId = 0;
            if (File.Exists(filePath))
            {
                byte[] bytes = File.ReadAllBytes(filePath);
                var length = bytes.Length;
                using (ResourcesDataContext dc = new ResourcesDataContext())
                {
                    bhdFile f = new bhdFile();
                    f.data = bytes;
                    f.size = bytes.Length;
                    f.name = file.Headers.ContentDisposition.FileName;
                    f.isActive = true;
                    f.fileTypeId = 1;
                    dc.bhdFiles.InsertOnSubmit(f);
                    dc.SubmitChanges();
                    fileId = f.id;
                }
            }

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