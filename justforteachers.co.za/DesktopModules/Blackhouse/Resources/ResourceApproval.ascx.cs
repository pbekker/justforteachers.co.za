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

namespace Blackhouse.Resources
{
    public partial class ResourceApproval : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];
        protected void Page_Load(object sender, EventArgs e)
        {
            //get the information from the api
            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceapprove/") as HttpWebRequest;
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                if (response.StatusCode != HttpStatusCode.OK)
                    throw new Exception(String.Format(
                    "Server error (HTTP {0}: {1}).",
                    response.StatusCode,
                    response.StatusDescription));

                Stream resp = response.GetResponseStream();
                StreamReader reader = new StreamReader(resp);
                string text = reader.ReadToEnd();
                var temp = JsonConvert.DeserializeObject<ResourceApprovalList>(text);

                rptListings.DataSource = temp.resourceList;
                rptListings.DataBind();

            }
        }
        protected void rptListings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Response.Redirect(Request.Url.ToString() + "&mid=" + ModuleContext.ModuleId.ToString() + "&ctl=resourceView&resourceid=" + ((LinkButton)e.CommandSource).CommandArgument);
        }
    }

    public class ResourceApprovalItem
    {
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public string ResourceTopic { get; set; }
        public string ResourceType { get; set; }
        public string ResourceLanguage { get; set; }
        public string ResourceUploadDate { get; set; }
    }

    public class ResourceApprovalList
    {
        public List<ResourceApprovalItem> resourceList { get; set; }
    }
}