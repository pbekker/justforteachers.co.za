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
                    break;
                case 2:
                    //urls
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

}