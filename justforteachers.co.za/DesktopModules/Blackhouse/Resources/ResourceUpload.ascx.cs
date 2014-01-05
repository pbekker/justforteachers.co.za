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
using System.Data;

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
                        //Span1.Text += "<u>File #" + (i + 1) + "</u><br>";
                        //Span1.Text += "File Content Type: " + userPostedFile.ContentType + "<br>";
                        //Span1.Text += "File Size: " + userPostedFile.ContentLength + "kb<br>";
                        //Span1.Text += "File Name: " + userPostedFile.FileName + "<br>";
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
                //when we get the response we need to get the object returned.
                //then show the author and publisher information upload.
                Stream resp = httpResponse.GetResponseStream();
                StreamReader reader = new StreamReader(resp);
                string text = reader.ReadToEnd();
                List<ResourceFile> result = JsonConvert.DeserializeObject<List<ResourceFile>>(text);
                System.Diagnostics.Debug.WriteLine(result);
                rptFileInfo.DataSource = result;
                rptFileInfo.DataBind();
            }
            catch (Exception ex)
            {
                lnkSave.Text = ex.ToString();
            }

            divFileUpload.Visible = false;
            divFileinfo.Visible = true;

            ////now we need to get the author and publisher payloads and set them to the dropdowns
            //WebClient aclient = new WebClient();
            //string aurl = dashboardUrlBase + "resourcepublisher";
            //List<GenDropList> authors = JsonConvert.DeserializeObject<List<GenDropList>>(aclient.DownloadString(aurl));
            //FillDropDown(ddlAuthor, publishers);
            //WebClient pclient = new WebClient();
            //string purl = dashboardUrlBase + "resourcepublisher";
            //List<GenDropList> publishers = JsonConvert.DeserializeObject<List<GenDropList>>(pclient.DownloadString(purl));
            //FillDropDown(ddlPublisher, publishers);
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
        protected void rptFileInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //now we need to check what sent the command and then we must react accordingly
            switch (((LinkButton)e.CommandSource).CommandName.ToLower())
            {
                case "author":
                    //divAddAuthor.Visible = true;
                    //divFileinfo.Visible = false;
                    break;
                case "publisher":
                    //divAddPublisher.Visible = true;
                    //divFileinfo.Visible = false;
                    break;
                case "addauthor":

                    break;
                case "addpublisher":

                    break;
                default:
                    break;
            }
        }

        protected void rptFileInfo_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                //populate the dropdowns
                WebClient aclient = new WebClient();
                string aurl = dashboardUrlBase + "resourceauthor";
                List<GenDropList> authors = JsonConvert.DeserializeObject<List<GenDropList>>(aclient.DownloadString(aurl));
                FillDropDown((DropDownList)e.Item.FindControl("ddlAuthor"), authors);

                WebClient pclient = new WebClient();
                string purl = dashboardUrlBase + "resourcepublisher";
                List<GenDropList> publishers = JsonConvert.DeserializeObject<List<GenDropList>>(pclient.DownloadString(purl));
                FillDropDown((DropDownList)e.Item.FindControl("ddlPublisher"), publishers);

                //hide the add data
                ((UpdatePanel)e.Item.FindControl("pnlAuthor")).Visible = false;
                ((UpdatePanel)e.Item.FindControl("pnlPublisher")).Visible = false;
            }
        }
        protected void lnkPublisherAdd_Click(object sender, EventArgs e)
        {
            //we can now add the publisher information
            PublisherData tmpPData = new PublisherData();
            tmpPData.PublisherName = txtPublisherName.Text;
            tmpPData.PublisherSurname = txtPublisherSurname.Text;
            //now post the data
            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourcepublisher") as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "POST";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(tmpPData);

                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)request.GetResponse();

            }
            catch (Exception ex)
            {
                lnkPublisherAdd.Text = ex.ToString();
            }
            //must update the file info
            //divAddPublisher.Visible = false;
            divFileinfo.Visible = true;

        }
        protected void btnAuthorAdd_Click(object sender, EventArgs e)
        {
            //we can now add the author information
            AuthorData tmpAData = new AuthorData();
            tmpAData.AuthorName = txtAuthorName.Text;
            tmpAData.AuthorSurname = txtAuthorSurname.Text;
            //now post the data
            HttpWebRequest prequest = WebRequest.Create(dashboardUrlBase + "resourceauthor") as HttpWebRequest;
            prequest.ContentType = "text/json";
            prequest.Method = "POST";
            try
            {
                using (var streamWriter = new StreamWriter(prequest.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(tmpAData);

                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)prequest.GetResponse();

            }
            catch (Exception ex)
            {
                btnAuthorAdd.Text = ex.ToString();
            }
            //must update the fileInfo
            //divAddAuthor.Visible = false;
            divFileinfo.Visible = true;
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
    
    public class ResourceFile
    {
        public int fileid { get; set; }
        public string filename { get; set; }
    }

    public class AuthorData
    {
        public string AuthorName { get; set; }
        public string AuthorSurname { get; set; }
    }

    public class PublisherData
    {
        public string PublisherName { get; set; }
        public string PublisherSurname { get; set; }
    }
}