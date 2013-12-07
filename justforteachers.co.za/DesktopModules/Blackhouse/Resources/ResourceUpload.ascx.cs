using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.UI.Modules;
using System.Net;
using Newtonsoft.Json;



namespace Blackhouse.Resources
{
    public partial class ResourceUpload : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://localhost:27645/api/";

        protected void Page_Load(object sender, EventArgs e)
        {
            //WebClient client = new WebClient();
            //string url = dashboardUrlBase + "resourceupload";
            ////'User' is a Model class that I have defined.
            //ResourcePayload result = JsonConvert.DeserializeObject<ResourcePayload>(client.DownloadString(url));
            //List<GenDropList> types = result.types;
            //List<GenDropList> topics = result.topics;
            //List<GenDropList> languages = result.languages;
            //FillDropDown(ddlTypes, types);
            //FillDropDown(ddlTopics, topics);
            //FillDropDown(ddlLanguages, languages);
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

}