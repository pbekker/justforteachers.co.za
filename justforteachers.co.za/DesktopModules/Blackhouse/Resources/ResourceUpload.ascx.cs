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
        //this must not change
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];
        public List<ResourceFile> fileinfo;
        public List<FileData> fileData;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebClient client = new WebClient();
                string url = dashboardUrlBase + "resourceupload";
                //'User' is a Model class that I have defined.
                ResourcePayload result = JsonConvert.DeserializeObject<ResourcePayload>(client.DownloadString(url));
                List<GenDropList> types = result.types;
                List<GenDropList> languages = result.languages;
                List<GenDropList> formats = result.formats;
                try
                {
                    AddNodes(tvTopics.Nodes, 0, result.topics);
                }
                catch (Exception ex)
                {
                    spantree.InnerText = ex.Message;
                }
                //FillDropDown(ddlResourceType, types);
                //FillDropDown(ddlResourceTopic, topics);
                FillDropDown(ddlResourceLanguage, languages);
                FillDropDown(ddlResourceFormat, formats);
                divFileUpload.Visible = false;
                divWebsiteUpload.Visible = false;
                divAuthorAdd.Visible = false;
                divPublisherAdd.Visible = false;
                divFileinfo.Visible = false;
                divUploadform.Visible = false;
                divTopics.Visible = false;
                spanSelectedTopicdiv.Visible = false;
            }
        }

        private void AddNodes(TreeNodeCollection nodes, int level, System.Data.DataTable dt)
        {
            string filterExp = string.Format("parentid='{0}'", level);
            foreach (System.Data.DataRow r in dt.Select(filterExp))
            {
                TreeNode item = new TreeNode()
                {
                    Text = r["name"].ToString(),
                    Value = r["id"].ToString()
                };
                this.AddNodes(item.ChildNodes, int.Parse(r["id"].ToString()), dt);
                nodes.Add(item);
            }
        }

        public static void FillDropDown(DropDownList target, List<GenDropList> data)
        {
            target.Items.Clear();
            target.AppendDataBoundItems = true;
            target.Items.Add(new ListItem("Please select an item...", "0"));
            target.DataSource = data;
            target.DataTextField = "ListValue";
            target.DataValueField = "ListId";
            target.DataBind();
        }

        protected void UploadFiles_Click(object sender, EventArgs e)
        {
            try
            {
                HttpFileCollection uploadedFiles = Request.Files;
                fileData = new List<FileData>();
                List<HttpPostedFile> tmpFileList = new List<HttpPostedFile>();
                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];
                    FileData tmpFile = new FileData();
                    tmpFile.fileName = userPostedFile.FileName;
                    tmpFile.fileSize = userPostedFile.ContentLength;
                    tmpFile.fileType = userPostedFile.ContentType;
                    tmpFile.fileData = ReadFile(userPostedFile);
                    fileData.Add(tmpFile);
                    tmpFileList.Add(userPostedFile);
                }
                hidFileData.Value = JsonConvert.SerializeObject(fileData);
                rptFileInfo.DataSource = fileData;
                rptFileInfo.DataBind();
            }
            catch (Exception ex)
            {
                Span1.Text += "Error: <br>" + ex.Message;
            }
            updateAuthPub();
            divFileUpload.Visible = false;
            divFileinfo.Visible = true;

        }

        private byte[] ReadFile(HttpPostedFile file)
        {
            byte[] data = new Byte[file.ContentLength];
            file.InputStream.Read(data, 0, file.ContentLength);
            return data;
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            divUploadform.Visible = false;
            divTopics.Visible = true;

        }

        protected void UploadWebsite_Click(object sender, EventArgs e)
        {
            int ResourceId = 0;
            //ok, now we need to get all the information for the save
            //reource basic infortmation
            UploadData resourceData = new UploadData();
            resourceData.PortalId = ModuleContext.PortalId;
            resourceData.ResourceDescription = txtResourceDescription.Text;
            resourceData.ResourceLanguageId = int.Parse(ddlResourceLanguage.SelectedValue);
            resourceData.ResourceName = txtResourceName.Text;
            resourceData.ResourceTopicId = int.Parse(hidTopicId.Value);
            resourceData.ResourceTypeId = 2;
            resourceData.ResourceFormatId = int.Parse(ddlResourceFormat.SelectedValue);

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
                throw new ApplicationException(ex.ToString());
            }

            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                if (response.StatusCode != HttpStatusCode.OK)
                    throw new Exception(String.Format("Server error (HTTP {0}: {1}).", response.StatusCode, response.StatusDescription));
                Stream resp = response.GetResponseStream();
                StreamReader reader = new StreamReader(resp);
                string text = reader.ReadToEnd();
                ResourceId = int.Parse(text);
            }
            //end of basic information

            //now it is tags
            List<string> tagsSend = new List<string>();
            string tags = txtResourceTags.Text;
            if (tags.Contains(","))
            {
                //these tags must be split
                string[] tagsList = tags.Split(",");
                foreach (var item in tagsList)
                {
                    string tmp = item;
                    if (tmp.StartsWith(" "))
                    {
                        tmp = tmp.Remove(0, 1);
                    }
                    if (item.EndsWith(" "))
                    {
                        tmp = tmp.Remove(tmp.Length - 1, 1);
                    }
                    tagsSend.Add(tmp);
                }
            }
            else
            {
                if (tags.StartsWith(" "))
                {
                    tags = tags.Remove(0, 1);
                }
                if (tags.EndsWith(" "))
                {
                    tags = tags.Remove(tags.Length - 2, 1);
                }
                tagsSend.Add(tags);
            }
            TagsInfo tmpTags = new TagsInfo();
            tmpTags.ResourceId = ResourceId;
            tmpTags.tags = new List<string>();
            tmpTags.tags = tagsSend;

            HttpWebRequest tagrequest = WebRequest.Create(dashboardUrlBase + "resourcelist/" + ResourceId) as HttpWebRequest;
            tagrequest.Method = "POST";
            tagrequest.ContentType = "text/json";
            try
            {
                using (var streamWriter = new StreamWriter(tagrequest.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(tmpTags);

                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)tagrequest.GetResponse();
            }
            catch (Exception ex)
            {
                lnkSaveFileInfo.Text = ex.ToString();
            }
            //end of tags

            //now it has URL
            string url = "";
            if (txtWebUrl.Text != "" && txtWebUrl.Text != " ")
            {
                if (!txtWebUrl.Text.ToLower().StartsWith("http://") && !txtWebUrl.Text.ToLower().StartsWith("https://"))
                    url = "http://" + txtWebUrl.Text.ToLower();
                else
                    url = txtWebUrl.Text.ToLower();
            }
            else
            {
                Span2.Text = "No information has been added, please add information and try again.";
                return;
            }
            HttpWebRequest urlRequest = WebRequest.Create(dashboardUrlBase + "resourceupload/" + ResourceId + "/website") as HttpWebRequest;
            urlRequest.ContentType = "text/json";
            urlRequest.Method = "POST";
            try
            {
                using (var streamWriter = new StreamWriter(urlRequest.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(url);

                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)urlRequest.GetResponse();
            }
            catch (Exception ex)
            {
                lnkSaveFileInfo.Text = ex.ToString();
                return;
            }
            //end of url

            Response.Redirect(Globals.NavigateURL(PortalSettings.Current.ActiveTab.TabID, "resourceView", "mid=" + ModuleContext.ModuleId.ToString()) + "?resourceid=" + ResourceId);
        }

        protected void rptFileInfo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //now we need to check what sent the command and then we must react accordingly
            switch (((LinkButton)e.CommandSource).CommandName.ToLower())
            {
                case "author":
                    divAuthorAdd.Visible = true;
                    divFileinfo.Visible = false;
                    break;
                case "publisher":
                    divPublisherAdd.Visible = true;
                    divFileinfo.Visible = false;
                    break;
                case "addauthor":

                    break;
                case "addpublisher":

                    break;
                default:
                    break;
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
            divPublisherAdd.Visible = false;
            divFileinfo.Visible = true;
            updateAuthPub();
        }
        protected void btnAuthorAdd_Click(object sender, EventArgs e)
        {
            //we can now add the author information
            AuthorData tmpAData = new AuthorData();
            tmpAData.AuthorName = txtAuthorName.Text;
            tmpAData.AuthorSurname = txtAuthorSurname.Text;
            ////now post the data
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
            divAuthorAdd.Visible = false;
            divFileinfo.Visible = true;
            updateAuthPub();
        }

        protected void updateAuthPub()
        {
            foreach (RepeaterItem item in rptFileInfo.Items)
            {
                WebClient aclient = new WebClient();
                string aurl = dashboardUrlBase + "resourceauthor";
                List<GenDropList> authors = JsonConvert.DeserializeObject<List<GenDropList>>(aclient.DownloadString(aurl));
                FillDropDown((DropDownList)item.FindControl("ddlAuthor"), authors);

                WebClient pclient = new WebClient();
                string purl = dashboardUrlBase + "resourcepublisher";
                List<GenDropList> publishers = JsonConvert.DeserializeObject<List<GenDropList>>(pclient.DownloadString(purl));
                FillDropDown((DropDownList)item.FindControl("ddlPublisher"), publishers);

                int endYear = DateTime.Now.Year;
                int startYear = 1950;
                List<GenDropList> yearsPub = new List<GenDropList>();
                for (int i = startYear; i < endYear + 1; i++)
                {
                    GenDropList tmp = new GenDropList();
                    tmp.ListId = i;
                    tmp.ListValue = i.ToString();
                    yearsPub.Add(tmp);
                }
                DropDownList target = (DropDownList)item.FindControl("ddlYear");
                target.Items.Clear();
                target.AppendDataBoundItems = true;
                target.Items.Add(new ListItem("Please select an item...", "0"));
                target.DataSource = yearsPub;
                target.DataTextField = "ListValue";
                target.DataValueField = "ListId";
                target.DataBind();
            }
        }

        protected void rptFileInfo_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            updateAuthPub();
        }
        protected void lnkSaveFileInfo_Click(object sender, EventArgs e)
        {
            int ResourceId = 0;
            try
            {
                //ok, now we need to get all the information for the save
                //reource basic infortmation
                UploadData resourceData = new UploadData();
                resourceData.PortalId = ModuleContext.PortalId;
                resourceData.ResourceDescription = txtResourceDescription.Text;
                resourceData.ResourceLanguageId = int.Parse(ddlResourceLanguage.SelectedValue);
                resourceData.ResourceName = txtResourceName.Text;
                resourceData.ResourceTopicId = int.Parse(hidTopicId.Value);
                resourceData.ResourceTypeId = 1;
                resourceData.ResourceFormatId = int.Parse(ddlResourceFormat.SelectedValue);

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
                    throw new ApplicationException(ex.ToString());
                }

                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode != HttpStatusCode.OK)
                        throw new Exception(String.Format("Server error (HTTP {0}: {1}).", response.StatusCode, response.StatusDescription));
                    Stream resp = response.GetResponseStream();
                    StreamReader reader = new StreamReader(resp);
                    string text = reader.ReadToEnd();
                    ResourceId = int.Parse(text);
                }
                //end of basic information

                //now it is tags
                List<string> tagsSend = new List<string>();
                string tags = txtResourceTags.Text;
                if (tags.Contains(","))
                {
                    //these tags must be split
                    string[] tagsList = tags.Split(",");
                    foreach (var item in tagsList)
                    {
                        string tmp = item;
                        if (tmp.StartsWith(" "))
                        {
                            tmp = tmp.Remove(0, 1);
                        }
                        if (item.EndsWith(" "))
                        {
                            tmp = tmp.Remove(tmp.Length - 2, 1);
                        }
                        tagsSend.Add(tmp);
                    }
                }
                else
                {
                    if (tags.StartsWith(" "))
                    {
                        tags = tags.Remove(0, 1);
                    }
                    if (tags.EndsWith(" "))
                    {
                        tags = tags.Remove(tags.Length - 2, 1);
                    }
                    tagsSend.Add(tags);
                }
                TagsInfo tmpTags = new TagsInfo();
                tmpTags.ResourceId = ResourceId;
                tmpTags.tags = new List<string>();
                tmpTags.tags = tagsSend;

                HttpWebRequest tagrequest = WebRequest.Create(dashboardUrlBase + "resourcelist/" + ResourceId) as HttpWebRequest;
                tagrequest.Method = "POST";
                tagrequest.ContentType = "text/json";
                try
                {
                    using (var streamWriter = new StreamWriter(tagrequest.GetRequestStream()))
                    {
                        string json = JsonConvert.SerializeObject(tmpTags);

                        streamWriter.Write(json);
                        streamWriter.Flush();
                        streamWriter.Close();
                    }
                    var httpResponse = (HttpWebResponse)tagrequest.GetResponse();
                }
                catch (Exception ex)
                {
                    lnkSaveFileInfo.Text = ex.ToString();
                }
                //end of tags

                //now its the files
                List<FileInfoData> tmpFileData = new List<FileInfoData>();
                List<FileData> newFileData = new List<FileData>();
                int filecounter = 0;
                try
                {
                    newFileData = JsonConvert.DeserializeObject<List<FileData>>(hidFileData.Value);
                }
                catch (Exception ex)
                {
                    lnkSaveFileInfo.Text = ex.Message;
                }

                foreach (RepeaterItem item in rptFileInfo.Items)
                {
                    int fileid = 0;
                    FileData tmpFile = newFileData[filecounter];
                    HttpWebRequest filerequest = WebRequest.Create(dashboardUrlBase + "resourceupload/" + ResourceId) as HttpWebRequest;
                    filerequest.ContentType = "text/json";
                    filerequest.Method = "POST";
                    try
                    {
                        using (var streamWriter = new StreamWriter(filerequest.GetRequestStream()))
                        {
                            string json = JsonConvert.SerializeObject(tmpFile);

                            streamWriter.Write(json);
                            streamWriter.Flush();
                            streamWriter.Close();
                        }
                        var httpFileResponse = (HttpWebResponse)filerequest.GetResponse();
                        //when we get the response we need to get the object returned.
                        //then show the author and publisher information upload.
                        Stream resp = httpFileResponse.GetResponseStream();
                        StreamReader reader = new StreamReader(resp);
                        string text = reader.ReadToEnd();
                        ResourceFile resourcefileReturn = JsonConvert.DeserializeObject<ResourceFile>(text);
                        fileid = resourcefileReturn.fileid;
                        filecounter++;
                    }
                    catch (Exception ex)
                    {
                        lnkSaveFileInfo.Text = ex.ToString();
                        return;
                    }

                    DropDownList author = (DropDownList)item.FindControl("ddlAuthor");
                    DropDownList publisher = (DropDownList)item.FindControl("ddlPublisher");
                    DropDownList year = (DropDownList)item.FindControl("ddlYear");

                    FileInfoData tmpFData = new FileInfoData();
                    tmpFData.resourceid = ResourceId;
                    tmpFData.authorid = int.Parse(author.SelectedValue);
                    tmpFData.publisherid = int.Parse(publisher.SelectedValue);
                    tmpFData.publishYear = int.Parse(year.SelectedValue);
                    tmpFData.fileid = fileid;
                    tmpFileData.Add(tmpFData);

                    HttpWebRequest fileInfoRequest = WebRequest.Create(dashboardUrlBase + "resourcefile") as HttpWebRequest;
                    fileInfoRequest.ContentType = "text/json";
                    fileInfoRequest.Method = "POST";
                    try
                    {
                        using (var streamWriter = new StreamWriter(fileInfoRequest.GetRequestStream()))
                        {
                            string json = JsonConvert.SerializeObject(tmpFData);

                            streamWriter.Write(json);
                            streamWriter.Flush();
                            streamWriter.Close();
                        }
                        var httpResponse = (HttpWebResponse)fileInfoRequest.GetResponse();

                    }
                    catch (Exception ex)
                    {
                        lnkSaveFileInfo.Text = ex.ToString();
                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.InnerException.ToString());
            }
            //end of files
            Response.Redirect(Globals.NavigateURL(PortalSettings.Current.ActiveTab.TabID, "resourceView", "mid=" + ModuleContext.ModuleId.ToString()) + "?resourceid=" + ResourceId);
        }
        protected void lnkFile_Click(object sender, EventArgs e)
        {
            divUploadform.Visible = true;
            divChoose.Visible = false;
            hidChoice.Value = "file";
        }
        protected void lnkURL_Click(object sender, EventArgs e)
        {
            divUploadform.Visible = true;
            divChoose.Visible = false;
            hidChoice.Value = "link";
        }
        protected void lnkBackToForm_Click(object sender, EventArgs e)
        {
            divTopics.Visible = false;
            divUploadform.Visible = true;
        }
        protected void lnkTopic_Click(object sender, EventArgs e)
        {
            if (lnkShowTreeAgain.Text == "change?")
            {
                lblError.Visible = true;
                return;
            }
            switch (hidChoice.Value.ToLower())
            {
                case "link":
                    divWebsiteUpload.Visible = true;
                    break;
                case "file":
                    divFileUpload.Visible = true;
                    break;
                default:
                    break;
            }
            divTopics.Visible = false;
        }
        protected void lnkBack_Click(object sender, EventArgs e)
        {
            divUploadform.Visible = false;
            hidChoice.Value = "";
            divChoose.Visible = true;
        }
        protected void tvTopics_SelectedNodeChanged(object sender, EventArgs e)
        {
            if (tvTopics.SelectedNode.Parent == null)
            {
                lnkShowTreeAgain.Text = tvTopics.SelectedNode.Text.ToString();
            }
            else
            {
                string text = "";
                TreeNode tmpNode;
                tmpNode = tvTopics.SelectedNode;
                while (tmpNode != null)
                {
                    text = tmpNode.Text + text;
                    tmpNode = tmpNode.Parent;
                    if (tmpNode != null)
                        text = " > " + text;
                }
                lnkShowTreeAgain.Text = text;
            }
            hidTopicId.Value = tvTopics.SelectedNode.Value;
            tvTopics.Visible = false;
            spanSelectedTopicdiv.Visible = true;
        }
        protected void lnkShowTreeAgain_Click(object sender, EventArgs e)
        {
            tvTopics.Visible = true;
            lnkShowTreeAgain.Text = "";
            spanSelectedTopicdiv.Visible = false;
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
        public List<GenDropList> languages { get; set; }
        public List<GenDropList> formats { get; set; }
        public DataTable topics { get; set; }
    }

    public class UploadData
    {
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public int ResourceTypeId { get; set; }
        public int ResourceLanguageId { get; set; }
        public int ResourceTopicId { get; set; }
        public int ResourceFormatId { get; set; }
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

    public class FileInfoData
    {
        public int resourceid { get; set; }
        public int fileid { get; set; }
        public int authorid { get; set; }
        public int publisherid { get; set; }
        public int publishYear { get; set; }
    }

    public class TagsInfo
    {
        public int ResourceId { get; set; }
        public List<string> tags { get; set; }
    }
}