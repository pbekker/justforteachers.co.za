using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.UI.Modules;
using System.Net;
using Newtonsoft.Json;
using DotNetNuke.Common;
using System.IO;
using System.Net.Http;
using System.Data;

namespace Blackhouse.Resources
{
    public partial class ResourceEdit : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["resourceid"] != null)
                {
                    WebClient client = new WebClient();
                    string url = dashboardUrlBase + "resourceupload";
                    //'User' is a Model class that I have defined.
                    ResourcePayload result = JsonConvert.DeserializeObject<ResourcePayload>(client.DownloadString(url));
                    List<GenDropList> languages = result.languages;
                    FillDropDown(ddlResourceLanguage, languages);
                    try
                    {
                        AddNodes(tvTopics.Nodes, 0, result.topics);
                    }
                    catch (Exception ex)
                    {
                        span1.InnerText = ex.Message;
                    }
                    PopulateInformation(Request.QueryString["resourceid"]);
                    divWebsiteUpload.Visible = false;
                    divAuthorAdd.Visible = false;
                    divPublisherAdd.Visible = false;
                }
                else
                {
                    span1.InnerText = "There seems to be a problem here, please try again.";
                }
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

        public void updateAuthPubSelection(List<FileViewInfo> data)
        {
            int filecount = 0;
            foreach (RepeaterItem item in rptFileInfo.Items)
            {
                ((DropDownList)item.FindControl("ddlAuthor")).SelectedValue = data[filecount].authorId.ToString();
                ((DropDownList)item.FindControl("ddlPublisher")).SelectedValue = data[filecount].publisherId.ToString();
                ((DropDownList)item.FindControl("ddlYear")).SelectedValue = data[filecount].year.ToString();
                filecount++;
            }
        }

        public void PopulateInformation(string id)
        {
            //we must get the information for the edit..
            WebClient resourceclient = new WebClient();
            string resourceurl = dashboardUrlBase + "resourceedit/" + Request.QueryString["resourceid"];
            //'User' is a Model class that I have defined.
            ResourceEditPayload resourceresult = JsonConvert.DeserializeObject<ResourceEditPayload>(resourceclient.DownloadString(resourceurl));
            txtResourceName.Text = resourceresult.resourceInfo.ResourceName;
            txtResourceDescription.Text = resourceresult.resourceInfo.ResourceDescription;
            ddlResourceLanguage.SelectedValue = resourceresult.resourceInfo.ResourceLanguageId.ToString();
            txtResourceTags.Text = resourceresult.resourceInfo.ResourceTags;
            hidTopicId.Value = resourceresult.resourceInfo.ResourceTopicId.ToString();
            lnkShowTreeAgain.Text = resourceresult.resourceInfo.ResourceTopic;
            hidChoice.Value = resourceresult.resourceInfo.ResourceTypeId.ToString();
            TreeNode item = tvTopics.FindNode(resourceresult.resourceInfo.ResourceTopicId.ToString());
            if (item != null)
            {
                item.Selected = true;
            }
            tvTopics.Visible = false;
            switch (resourceresult.resourceInfo.ResourceTypeId)
            {
                case 1:
                    //files
                    try
                    {
                        rptFileInfo.DataSource = resourceresult.fileInfo;
                        rptFileInfo.DataBind();
                    }
                    catch (Exception ex)
                    {
                        span1.InnerText = ex.Message;
                        return;
                    }
                    divFileinfo.Visible = true;
                    updateAuthPub();
                    updateAuthPubSelection(resourceresult.fileInfo);
                    break;
                case 2:
                    //urls
                    divWebsiteUpload.Visible = true;
                    divFileinfo.Visible = false;
                    txtWebUrl.Text = resourceresult.urlInfo[0].resourceURL;
                    break;
                default:
                    break;
            }
            
        }
        protected void lnkShowTreeAgain_Click(object sender, EventArgs e)
        {
            tvTopics.Visible = true;
            lnkShowTreeAgain.Visible = false;
            hidTopicId.Value = "";
            lnkShowTreeAgain.Text = "change?";
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
            lnkShowTreeAgain.Visible = true;
        }
        protected void lnkUpdateInfo_Click(object sender, EventArgs e)
        {            
            string URL = "";
            List<FileViewInfo> tmpFileInfo = new List<FileViewInfo>();
            //right, lets update the data
            ResourceEditList tmpEditData = new ResourceEditList();
            tmpEditData.ResourceId = int.Parse(Request.QueryString["resourceid"].ToString());
            tmpEditData.ResourceName = txtResourceName.Text;
            tmpEditData.ResourceDescription = txtResourceDescription.Text;
            tmpEditData.ResourceLanguageId = int.Parse(ddlResourceLanguage.SelectedValue.ToString());
            tmpEditData.ResourceTopicId = int.Parse(hidTopicId.Value.ToString());

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
            tmpTags.ResourceId = tmpEditData.ResourceId;
            tmpTags.tags = new List<string>();
            tmpTags.tags = tagsSend;

            //according to type
            switch (hidChoice.Value)
            {
                case "1":
                    //files
                    
                    //get the files from the repeater
                    break;
                case "2":
                    //urls
                    URL = txtWebUrl.Text;
                    break;
                default:
                    break;
            }

            ResourceEditSend tmpSend = new ResourceEditSend();
            tmpSend.fileInfo = tmpFileInfo;
            tmpSend.resourceInfo = tmpEditData;
            tmpSend.tagsInfo = tmpTags;
            tmpSend.URL = URL;

            //now send the information to the API
            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceedit/" + Request.QueryString["resourceid"]) as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "POST";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(tmpSend);

                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)request.GetResponse();
            }
            catch (Exception ex)
            {
                span1.InnerText = ex.ToString();
                return;
            }

        }
}

    public class ResourceEditSend
    {
        public ResourceEditList resourceInfo { get; set; }
        public TagsInfo tagsInfo { get; set; }
        public string URL { get; set; }
        public List<FileViewInfo> fileInfo { get; set; }
    }

    public class ResourceEditList
    {
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public string ResourceTopic { get; set; }
        public int ResourceTopicId { get; set; }
        public string ResourceType { get; set; }
        public int ResourceTypeId { get; set; }
        public string ResourceLanguage { get; set; }
        public int ResourceLanguageId { get; set; }
        public string ResourceUploadDate { get; set; }
        public string ResourceTags { get; set; }
        public bool isActive { get; set; }
    }
    
    public class ResourceEditPayload
    {
        public ResourceEditList resourceInfo { get; set; }
        public List<FileViewInfo> fileInfo { get; set; }
        public List<LinkViewInfo> urlInfo { get; set; }
    }

    public class FileViewInfo
    {
        public string FileName { get; set; }
        public int FileSize { get; set; }
        public string FileContentType { get; set; }
        public int FileId { get; set; }
        public int authorId { get; set; }
        public int publisherId { get; set; }
        public int year { get; set; }
    }

    public class LinkViewInfo
    {
        public string resourceURL { get; set; }
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
        public DataTable topics { get; set; }
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

    public class TagsInfo
    {
        public int ResourceId { get; set; }
        public List<string> tags { get; set; }
    }

}