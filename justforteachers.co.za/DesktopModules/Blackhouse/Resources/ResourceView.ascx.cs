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

                    lblResourceName.Text = result.resourceInfo.ResourceName;
                    lblResourceDescription.Text = result.resourceInfo.ResourceDescription;
                    ResourceType.Text = result.resourceInfo.ResourceType;
                    ResourceTopic.Text = result.resourceInfo.ResourceTopic;
                    ResourceLanguage.Text = result.resourceInfo.ResourceLanguage;
                    ResourceUploadDate.Text = result.resourceInfo.ResourceUploadDate;

                    //now we need to fill in the resource file information
                    //best do the repeater now...
                    rptFiles.DataSource = result.fileInfo;
                    rptFiles.DataBind();
                    lblFiles.Text = "(" + result.fileInfo.Count + ") Files are associated with this resource.";

                    //now we need to fill in the resource url information
                    lblWebsiteLinks.Text = "(" + result.urlInfo.Count + ") Website Links are associated with this resource.";
                    rptWebsites.DataSource = result.urlInfo;
                    rptWebsites.DataBind();
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
        }
}

    public class ResourceViewPayload
    {
        public ResourceList resourceInfo { get; set; }
        public List<FileViewInfo> fileInfo { get; set; }
        public List<LinkViewInfo> urlInfo { get; set; }
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

}