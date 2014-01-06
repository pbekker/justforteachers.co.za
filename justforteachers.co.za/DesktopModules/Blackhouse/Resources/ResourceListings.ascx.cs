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

namespace Blackhouse.Resources
{
    public partial class ResourceListings : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];
        protected void Page_Load(object sender, EventArgs e)
        {
            //get the information from the api
            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourcelist/") as HttpWebRequest;
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
                var temp = JsonConvert.DeserializeObject<ResourceListPayload>(text);

                rptListings.DataSource = temp.resourceList;
                rptListings.DataBind();

            }
            if (!PortalSettings.Current.UserInfo.IsInRole("Administrator"))
            {
                lnkAdd.Visible = false;
            }
        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL(PortalSettings.Current.ActiveTab.TabID, "resourceEdit", "mid=" + ModuleContext.ModuleId.ToString()));
        }
        protected void rptListings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Response.Redirect(Request.Url.ToString() + "&mid=" + ModuleContext.ModuleId.ToString() + "&ctl=resourceView&resourceid=" + ((LinkButton)e.CommandSource).CommandArgument);
        }
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

    public class ResourceListPayload
    {
        public List<ResourceList> resourceList { get; set; }
    }
}