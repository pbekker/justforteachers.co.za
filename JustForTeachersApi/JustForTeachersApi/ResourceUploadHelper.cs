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

        public static ResourceFile UploadResourceFile(FileData files, int resourceId)
        {
            ResourceFile resFileRet = new ResourceFile();
            //we get the information
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                //check if we have the file type
                int typeid = 0;
                var type = (from d in dc.bhdFileTypes
                            where d.contentType == files.fileType
                            && d.isActive
                            select d).FirstOrDefault();
                if (type == null)
                {
                    bhdFileType ft = new bhdFileType();
                    ft.contentType = files.fileType;
                    string extension = files.fileName;
                    int pos = extension.LastIndexOf('.');
                    ft.extension = extension.Substring(pos + 1, extension.Length - (pos + 1));
                    ft.isActive = true;
                    dc.bhdFileTypes.InsertOnSubmit(ft);
                    dc.SubmitChanges();
                    typeid = ft.id;
                }
                else
                {
                    typeid = type.id;
                }

                bhdFile f = new bhdFile();
                f.size = files.fileSize;
                f.name = files.fileName;
                f.isActive = true;
                f.fileTypeId = typeid;
                dc.bhdFiles.InsertOnSubmit(f);
                dc.SubmitChanges();

                bhdFileData fd = new bhdFileData();
                fd.fileId = f.id;
                fd.data = files.fileData;
                dc.bhdFileDatas.InsertOnSubmit(fd);
                dc.SubmitChanges();


                bhdResourceFile rf = new bhdResourceFile();
                rf.resourceId = resourceId;
                rf.fileId = f.id;
                dc.bhdResourceFiles.InsertOnSubmit(rf);
                dc.SubmitChanges();

                ResourceFile tmpFileRes = new ResourceFile();
                tmpFileRes.fileid = rf.fileId;
                tmpFileRes.filename = f.name;
                resFileRet = tmpFileRes;
                
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