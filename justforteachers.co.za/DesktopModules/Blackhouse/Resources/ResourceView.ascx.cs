using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.UI.Modules;
using System.Net;
using Newtonsoft.Json;
using System.Net.Http;
using System.IO;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Common;
using System.ComponentModel;
using System.Drawing;

namespace Blackhouse.Resources
{
    public partial class ResourceView : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    WebClient client = new WebClient();
                    string url = dashboardUrlBase + "resources/" + Request.QueryString["resourceid"];
                    //'User' is a Model class that I have defined.
                    ResourceViewPayload result = JsonConvert.DeserializeObject<ResourceViewPayload>(client.DownloadString(url));

                    hidResourceId.Value = result.resourceInfo.ResourceId.ToString();
                    lblResourceName.Text = result.resourceInfo.ResourceName;
                    lblResourceDescription.Text = result.resourceInfo.ResourceDescription.Replace(Environment.NewLine, "<BR/>"); ;
                    ResourceType.Text = result.resourceInfo.ResourceType;
                    ResourceTopic.Text = result.resourceInfo.ResourceTopic;
                    ResourceLanguage.Text = result.resourceInfo.ResourceLanguage;
                    ResourceUploadDate.Text = result.resourceInfo.ResourceUploadDate;
                    ResourceFormat.Text = result.resourceInfo.ResourceFormat;

                    //do some shit for the topics..
                    if (result.resourceInfo.ResourceTopic != null && result.resourceInfo.ResourceTopic != "")
                    {
                        if (result.resourceInfo.ResourceTopic.Contains('>'))
                        {
                            //now we are in action
                            string[] tempTopics = result.resourceInfo.ResourceTopic.Split(" > ");
                            if (tempTopics.Length > 2)
                            {
                                ResourcePhase.Text = tempTopics[0];
                                ResourceSubject.Text = tempTopics[1];
                                ResourceTopic.Text = tempTopics[2];
                            }
                            else
                            {
                                if (tempTopics.Length < 2)
                                {
                                    ResourcePhase.Text = result.resourceInfo.ResourceTopic;
                                    spanSubject.Visible = false;
                                    spanTopic.Visible = false;
                                }
                                else
                                {
                                    ResourcePhase.Text = tempTopics[0];
                                    ResourceSubject.Text = tempTopics[1];
                                    spanTopic.Visible = false;

                                }
                            }
                        }
                        else
                        {
                            ResourcePhase.Text = result.resourceInfo.ResourceTopic;
                            spanSubject.Visible = false;
                            spanTopic.Visible = false;
                        }
                    }

                    if (result.resourceInfo.PreviewFileId > 0)
                    {
                        //need to fetch the image information
                        makeImageVisible(result.resourceInfo.PreviewFileId.ToString());
                    }
                    else
                        imgPreviewImage.Src = "/desktopmodules/blackhouse/resources/noimage.png";

                    //now we need to fill in the resource file information
                    //best do the repeater now...
                    rptFiles.DataSource = result.fileInfo;
                    rptFiles.DataBind();
                    if (result.fileInfo.Count > 0)
                    {
                        lblFiles.Text = "No. of associated files: " + result.fileInfo.Count;
                        string fileIds = string.Empty;
                        foreach (var item in result.fileInfo)
                        {
                            if (fileIds == string.Empty)
                            {
                                fileIds = item.FileId.ToString();
                            }
                            else
                            {
                                fileIds = fileIds + "," + item.FileId.ToString();
                            }
                        }
                        lnkDownload.CommandArgument = fileIds;

                    }
                    else
                    {
                        lblFiles.Visible = false;
                        rptFiles.Visible = false;
                        lnkDownload.Visible = false;
                    }
                    
                    //now we need to fill in the resource url information
                    if (result.urlInfo.Count > 0)
                    {
                        lblWebsiteLinks.Text = "No. if associated links: " + result.urlInfo.Count;
                        rptWebsites.DataSource = result.urlInfo;
                        rptWebsites.DataBind();
                    }
                    else
                    {
                        lblWebsiteLinks.Visible = false;
                        rptWebsites.Visible = false;
                    }

                    // TODO: Add a check for approval, if it is approved no need to approve again.
                    if (ModuleContext.PortalSettings.UserInfo.IsInRole("Administrator") || ModuleContext.PortalSettings.UserInfo.IsSuperUser)
                        divApproval.Visible = Visible;
                    else 
                        divApproval.Visible = false;

                    //if (result.comments.Count > 0)
                    //{
                    //    dlComments.DataSource = result.comments;
                    //    dlComments.DataBind();
                    //    divEmptyMessage.Visible = false;
                    //}
                    //else
                    //{
                    //    //divRepeater.Visible = false;
                    //    if (ModuleContext.PortalSettings.UserInfo.UserID > 0 && !ModuleContext.PortalSettings.UserInfo.IsSuperUser)
                    //        divAddFirstComment.Visible = false;
                    //}
                }
                catch (Exception ex)
                {
                    lblResourceName.Text = ex.Message;
                }
            }
        }
        protected void rptFiles_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //this is where we will get the information needed for the files to be downloaded.
            //((LinkButton)e.CommandSource).CommandArgument)
            List<int> tmpFileId = new List<int>();
            tmpFileId.Add(int.Parse(((LinkButton)e.CommandSource).CommandArgument));
            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourcefile/1") as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "PUT";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(tmpFileId);

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
                FileDownloadData file = JsonConvert.DeserializeObject<FileDownloadData>(text);
                Response.Clear();

                Response.AddHeader("Content-Type", "image/jpeg");
                Response.AddHeader("Content-Length", file.FileData.Length.ToString());
                
                Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}; size={1}", file.ContentDispositionFileName, file.FileData.Length));

                Response.BinaryWrite(file.FileData.ToArray());
                Response.Flush();

                Response.End();
            }
            catch (Exception ex)
            {
                //bleh..
                ((LinkButton)e.CommandSource).Text = ex.Message;
            }
        }
        protected void cmdApprove_Click(object sender, EventArgs e)
        {
            WebClient client = new WebClient();

            string url = dashboardUrlBase + "resourceapprove/" + hidResourceId.Value; 
            ResourceList  currentItem = JsonConvert.DeserializeObject<ResourceList>(client.DownloadString(url));
            currentItem.isActive = chkApprove.Checked;
            client.Dispose();

            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceapprove/"+ ModuleContext.PortalSettings.UserInfo.UserID.ToString()) as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "PUT";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(currentItem);
                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }

                var httpResponse = (HttpWebResponse)request.GetResponse();
            } catch (Exception ex)
            {
                throw new ApplicationException(url + " -- " + currentItem.ResourceId.ToString() + "\r\n" + ex.ToString());
            }
        }
        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            //get all the file id's in the list and send a request to download it.
            LinkButton tmpbtn = (LinkButton)sender;
            if (tmpbtn.CommandArgument != "")
            {
                string[] ids = tmpbtn.CommandArgument.Split(',');
                HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourcefile/1") as HttpWebRequest;
                request.ContentType = "text/json";
                request.Method = "PUT";
                try
                {
                    using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                    {
                        string json = JsonConvert.SerializeObject(ids.ToList());

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
                    FileDownloadData file = JsonConvert.DeserializeObject<FileDownloadData>(text);
                    Response.Clear();

                    Response.AddHeader("Content-Type", "application/zip");
                    Response.AddHeader("Content-Length", file.FileData.Length.ToString());

                    Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}; size={1}", file.ContentDispositionFileName, file.FileData.Length));

                    Response.BinaryWrite(file.FileData.ToArray());
                    Response.Flush();

                    Response.End();
                }
                catch (Exception ex)
                {
                    //bleh..
                    lblPhase.Text = ex.ToString();
                }
            }
        }

        protected void makeImageVisible(string fileId)
        {
            string url = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"] + string.Format("resourcefile/{0}", fileId);
            WebClient client = new WebClient();
            FileResult result = JsonConvert.DeserializeObject<FileResult>(client.DownloadString(url));
           
            TypeConverter tc = TypeDescriptor.GetConverter(typeof(Bitmap));
            Bitmap MyBitmap = (Bitmap)tc.ConvertFrom(result.fileContents);


            string imgString = Convert.ToBase64String(result.fileContents);
            //Set the source with data:image/bmp
            imgPreviewImage.Src = String.Format("data:image/Bmp;base64,{0}\"", imgString);
        }
        
        //protected void cmdSaveComment_Click(object sender, EventArgs e)
        //{
        //    Comment saveComment = new Comment();
        //    saveComment.commentId = String.IsNullOrEmpty(hidCommentId.Value)? 0 : int.Parse(hidCommentId.Value);
        //    saveComment.resourceId = int.Parse(Request.QueryString["resourceid"]);
        //    saveComment.userId = PortalSettings.Current.UserId;
        //    saveComment.commentDate = DateTime.Now;
        //    saveComment.active = true;
        //    saveComment.comment = txtComment.Text;

        //    HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourcecomment/") as HttpWebRequest;
        //    request.ContentType = "text/json";
        //    request.Method = "PUT";
        //    try
        //    {
        //        using (var streamWriter = new StreamWriter(request.GetRequestStream()))
        //        {
        //            string json = JsonConvert.SerializeObject(saveComment);
        //            streamWriter.Write(json);
        //            streamWriter.Flush();
        //            streamWriter.Close();
        //        }

        //        var httpResponse = (HttpWebResponse)request.GetResponse();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new ApplicationException(ex.ToString());
        //    }

        //    Response.Redirect(Request.Url.AbsoluteUri);
        //}
        //protected void cmdAddNewComment_Click(object sender, EventArgs e)
        //{
        //    resetCommentControls();
        //    AddComment.Visible = true;
        //}
        //protected void cmdCancelComment_Click(object sender, EventArgs e)
        //{
        //    resetCommentControls();
        //}

        //private void resetCommentControls()
        //{
        //    AddComment.Visible = false;
        //    hidCommentId.Value = "";
        //    txtComment.Text = "";
        //}


        //protected void dlComments_ItemCreated(object sender, DataListItemEventArgs e)
        //{
        //    if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem))
        //    {
        //        if (e.Item.DataItem == null)
        //        {
        //            throw new ApplicationException("rebound wtf?");
        //            return;
        //        }
        //        Comment currentComment = (Comment)e.Item.DataItem;
        //        HiddenField hidUserId = (HiddenField)e.Item.FindControl("hidUserId");
        //        Label lblUserName = (Label)e.Item.FindControl("lblUserName");
        //        Label lblCommentDate = (Label)e.Item.FindControl("lblCommentDate");
        //        Label lblComment = (Label)e.Item.FindControl("lblComment");
        //        Button cmdRemove = (Button)e.Item.FindControl("cmdRemove");
        //        Button cmdAddComment = (Button)e.Item.FindControl("cmdAddComment");

        //        hidUserId.Value = currentComment.userId.ToString();
        //        lblUserName.Text = DotNetNuke.Entities.Users.UserController.GetUserById(ModuleContext.PortalId, currentComment.userId).DisplayName;
        //        lblCommentDate.Text = currentComment.commentDate.ToShortDateString();
        //        lblComment.Text = currentComment.comment;
        //        cmdAddComment.CommandName = "addComment";
        //        cmdAddComment.CommandArgument = currentComment.commentId.ToString();
        //        if (ModuleContext.PortalSettings.UserInfo.IsInRole("Administrator") || ModuleContext.PortalSettings.UserInfo.IsSuperUser)
        //        {
        //            cmdRemove.CommandName = "removeComment";
        //            cmdRemove.CommandArgument = currentComment.commentId.ToString();
        //        }
        //        else
        //        {
        //            cmdRemove.Visible = false;
        //        }

        //    }

        //}
        //protected void dlComments_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    switch (e.CommandName.ToString().ToLower())
        //    {
        //        case "addcomment":
        //            resetCommentControls();
        //            AddComment.Visible = true;
        //            break;
        //        case "removecomment":
        //            //lblResourceName.Text = e.CommandArgument.ToString();
        //            //return;
        //            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourcecomment/" + e.CommandArgument.ToString()) as HttpWebRequest;
        //            request.ContentType = "text/json";
        //            request.Method = "DELETE";
        //            var response = (HttpWebResponse)request.GetResponse();
        //            Response.Redirect(Request.Url.AbsoluteUri);
        //            break;
        //        default:
        //            break;
        //    }
        //}
}

    public class ResourceViewPayload
    {
        public ResourceList resourceInfo { get; set; }
        public List<FileViewInfo> fileInfo { get; set; }
        public List<LinkViewInfo> urlInfo { get; set; }
        public List<Comment> comments { get; set; }
    }

    public class ResourceList
    {
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public string ResourceTopic { get; set; }
        public string ResourceType { get; set; }
        public string ResourceLanguage { get; set; }
        public string ResourceUploadDate { get; set; }
        public string ResourceTags { get; set; }
        public string ResourceFormat { get; set; }
        public int PreviewFileId { get; set; }
        public string PreviewFileString { get; set; }
        public bool isActive { get; set; }
    }

    public class Comment
    {
        public int commentId { get; set; }
        public int userId { get; set; }
        public int resourceId { get; set; }
        public DateTime commentDate { get; set; }
        public bool active { get; set; }
        public string comment { get; set; }

    }

    public class FileViewInfo
    {
        public string FileName { get; set; }
        public int FileSize { get; set; }
        public string FileContentType { get; set; }
        public int FileId { get; set; }
    }

    public class LinkViewInfo
    {
        public string resourceURL { get; set; }
    }

    public class FileDownloadData
    {
        public string ContentType { get; set; }
        public string ContentLength { get; set; }
        public string ContentDisposition { get; set; }
        public string ContentDispositionFileName { get; set; }
        public byte[] FileData { get; set; }
    }

    public class FileResult
    {
        public byte[] fileContents { get; set; }
        public string contentType { get; set; }
    }
}