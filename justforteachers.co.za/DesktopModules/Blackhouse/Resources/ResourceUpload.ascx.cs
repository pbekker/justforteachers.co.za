using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.UI.Modules;
using System.Net;
using Newtonsoft.Json;
using System.IO;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Common;

namespace Blackhouse.Resources
{
    public partial class ResourceUpload : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://localhost:27645/api/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebClient client = new WebClient();
                string url = dashboardUrlBase + "resourceupload";
                //'User' is a Model class that I have defined.
                ResourcePayload result = JsonConvert.DeserializeObject<ResourcePayload>(client.DownloadString(url));
                List<GenDropList> types = result.types;
                List<GenDropList> topics = result.topics;
                List<GenDropList> languages = result.languages;
                FillDropDown(ddlResourceType, types);
                FillDropDown(ddlResourceTopic, topics);
                FillDropDown(ddlResourceLanguage, languages);
                divFileUpload.Visible = false;
                divWebsiteUpload.Visible = false;
                divLessonplan.Visible = false;
            }
        }

        public static void FillDropDown(DropDownList target, List<GenDropList> data)
        {
            target.AppendDataBoundItems = true;
            target.Items.Add(new ListItem("Please select an item...", "0"));
            target.DataSource = data;
            target.DataTextField = "ListValue";
            target.DataValueField = "ListId";
            target.DataBind();
        }

        protected void UploadFiles_Click(object sender, EventArgs e)
        {
            //ok so now we need to save the file, create a byte string out of it and send that to 
            HttpFileCollection uploadedFiles = Request.Files;
            Span1.Text = string.Empty;
            List<FileData> tmpFileDataList = new List<FileData>();

            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];
                try
                {
                    if (userPostedFile.ContentLength > 0)
                    {
                        FileData tmpFile = new FileData();
                        tmpFile.fileName = userPostedFile.FileName;
                        tmpFile.fileSize = userPostedFile.ContentLength;
                        tmpFile.fileType = userPostedFile.ContentType;
                        tmpFile.fileData = ReadFile(userPostedFile);
                        Span1.Text += "<u>File #" + (i + 1) + "</u><br>";
                        Span1.Text += "File Content Type: " + userPostedFile.ContentType + "<br>";
                        Span1.Text += "File Size: " + userPostedFile.ContentLength + "kb<br>";
                        Span1.Text += "File Name: " + userPostedFile.FileName + "<br>";
                        tmpFileDataList.Add(tmpFile);
                    }
                }
                catch (Exception Ex)
                {
                    Span1.Text += "Error: <br>" + Ex.Message;
                }
            }

            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceupload/" + hidResourceId.Value) as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "POST";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(tmpFileDataList);

                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)request.GetResponse();

            }
            catch (Exception ex)
            {
                lnkSave.Text = ex.ToString();
            }

        }

        private byte[] ReadFile(HttpPostedFile file)
        {
            byte[] data = new Byte[file.ContentLength];
            file.InputStream.Read(data, 0, file.ContentLength);
            return data;
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            try
            {
                int topicValue = int.Parse(ddlResourceTopic.SelectedValue);
                int typeValue = int.Parse(ddlResourceType.SelectedValue);
                int langValue = int.Parse(ddlResourceLanguage.SelectedValue);
                //create the upload information
                UploadData resourceData = new UploadData();
                resourceData.ResourceName = txtResourceName.Text;
                resourceData.ResourceDescription = txtResourceDescription.Text;
                resourceData.ResourceTopicId = topicValue;
                resourceData.ResourceTypeId = typeValue;
                resourceData.ResourceLanguageId = langValue;
                resourceData.PortalId = ModuleContext.PortalId;

                //we have the information so now we send it through to the API and expect the resourceid back
                HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceupload/") as HttpWebRequest;
                request.Method = "POST";
                request.ContentType = "text/json";
                try
                {
                    using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                    {
                        string json = JsonConvert.SerializeObject(resourceData);

                        streamWriter.Write(json);
                        streamWriter.Flush();
                        streamWriter.Close();
                    }
                    var httpResponse = (HttpWebResponse)request.GetResponse();

                }
                catch (Exception ex)
                {
                    lnkSave.Text = ex.ToString();
                }

                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode != HttpStatusCode.OK)
                        throw new Exception(String.Format("Server error (HTTP {0}: {1}).", response.StatusCode, response.StatusDescription));
                    Stream resp = response.GetResponseStream();
                    StreamReader reader = new StreamReader(resp);
                    string text = reader.ReadToEnd();
                    hidResourceId.Value = text;

                    switch (ddlResourceType.SelectedItem.Text.ToLower())
                    {
                        case "website":
                            divWebsiteUpload.Visible = true;
                            break;
                        case "lesson plan":
                            divLessonplan.Visible = true;
                            break;
                        default:
                            divFileUpload.Visible = true;
                            break;
                    }
                    divUploadform.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lnkSave.Text = ex.ToString();
            }

        }
        protected void UploadWebsite_Click(object sender, EventArgs e)
        {
            string type = "website";
            Span2.Text = "";
            string url = "";
            if (txtWebUrl.Text != "" && txtWebUrl.Text != " ")
            {
                if (!txtWebUrl.Text.ToLower().StartsWith("http://") && !txtWebUrl.Text.ToLower().StartsWith("https://"))
                    url = "http://" + txtWebUrl.Text.ToLower();
                else
                    url = txtWebUrl.Text.ToLower();

                //now we need to upload the information for this resource
                HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceupload/" + hidResourceId.Value + "/" + type + "/") as HttpWebRequest;
                request.Method = "POST";
                request.ContentType = "text/json";
                try
                {
                    using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                    {
                        string json = JsonConvert.SerializeObject(url);

                        streamWriter.Write(json);
                        streamWriter.Flush();
                        streamWriter.Close();
                    }
                    var httpResponse = (HttpWebResponse)request.GetResponse();

                }
                catch (Exception ex)
                {
                    Span2.Text = ex.ToString();
                }
            }
            else
                Span2.Text = "No information has been added, please add information and try again.";
            Response.Redirect(Globals.NavigateURL(PortalSettings.Current.ActiveTab.TabID, "resourceView", "mid=" + ModuleContext.ModuleId.ToString()) + "?resourceid=" + hidResourceId.Value);
        }
        protected void UploadLessonPlan_Click(object sender, EventArgs e)
        {
            LessonPlan tmpDataPack = new LessonPlan();
            string type = "lesson plan";
            Span3.Text = "";
            string url = "";
            if (txtLessonWebUrl.Text != "" && txtWebUrl.Text != " ")
            {
                if (!txtLessonWebUrl.Text.ToLower().StartsWith("http://") && !txtLessonWebUrl.Text.ToLower().StartsWith("https://"))
                    url = "http://" + txtLessonWebUrl.Text.ToLower();
                else
                    url = txtLessonWebUrl.Text.ToLower();
            }
            else
            {
                Span3.Text = "No information has been added, please add information and try again.";
                return;

            }
            tmpDataPack.linkUrl = url;

            //ok so now we need to save the file, create a byte string out of it and send that to 
            HttpFileCollection uploadedFiles = Request.Files;
            Span3.Text = string.Empty;
            List<FileData> tmpFileDataList = new List<FileData>();

            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];
                try
                {
                    if (userPostedFile.ContentLength > 0)
                    {
                        FileData tmpFile = new FileData();
                        tmpFile.fileName = userPostedFile.FileName;
                        tmpFile.fileSize = userPostedFile.ContentLength;
                        tmpFile.fileType = userPostedFile.ContentType;
                        tmpFile.fileData = ReadFile(userPostedFile);
                        Span1.Text += "<u>File #" + (i + 1) + "</u><br>";
                        Span1.Text += "File Content Type: " + userPostedFile.ContentType + "<br>";
                        Span1.Text += "File Size: " + userPostedFile.ContentLength + "kb<br>";
                        Span1.Text += "File Name: " + userPostedFile.FileName + "<br>";
                        tmpFileDataList.Add(tmpFile);
                    }
                }
                catch (Exception Ex)
                {
                    Span3.Text += "Error: <br>" + Ex.Message;
                }
            }

            tmpDataPack.fileData = tmpFileDataList;



            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceupload/" + hidResourceId.Value + "/" + type + "/") as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "POST";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(tmpDataPack);

                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)request.GetResponse();

            }
            catch (Exception ex)
            {
                lnkSave.Text = ex.ToString();
            }

        }
    }
    
    
    public class GenDropList
    {
        public int ListId { get; set; }
        public string ListValue { get; set; }
    }
    public class ResourcePayload
    {
        public List<GenDropList> types { get; set; }
        public List<GenDropList> topics { get; set; }
        public List<GenDropList> languages { get; set; }
    }

    public class UploadData
    {
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public int ResourceTypeId { get; set; }
        public int ResourceLanguageId { get; set; }
        public int ResourceTopicId { get; set; }
        public int PortalId { get; set; }
    }

    public class FileData
    {
        public string fileName { get; set; }
        public string fileType { get; set; }
        public int fileSize { get; set; }
        public byte[] fileData { get; set; }
    }

    public class LessonPlan
    {
        public List<FileData> fileData { get; set; }
        public string linkUrl { get; set; }
    }

}