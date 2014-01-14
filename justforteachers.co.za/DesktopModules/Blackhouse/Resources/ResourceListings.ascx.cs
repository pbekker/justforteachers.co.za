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
using System.Text;

namespace Blackhouse.Resources
{
    public partial class ResourceListings : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpWebRequest request;
            int page = 0;
            if (Request.QueryString["page"] != null)
            {
                page = int.Parse(Request.QueryString["page"]) - 1;
                request = WebRequest.Create(dashboardUrlBase + "resourcelist/" + page) as HttpWebRequest;
            }
            else
            {
                //get the information from the api
                request = WebRequest.Create(dashboardUrlBase + "resourcelist/") as HttpWebRequest;
            }
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
                PaginationLabel.Text = RenderPaginationControl(page + 1, 20, temp.count);
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

        public string RenderPaginationControl(int page, int pageSize, int totalItems)
        {
            int totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            // Create pager.
            StringBuilder pagerSb = new StringBuilder();
            for (int i = 1; i <= totalPages; ++i)
            {
                // If it is NOT a link to current page.
                if (i != page) { pagerSb.Append(string.Format("<a href='" + Globals.NavigateURL(ModuleContext.TabId) + "?page={0}' Class='btn btn-header'>{0}</a>", i)); }
                // If it is the link to current page.
                else { pagerSb.Append(string.Format("<a href='" + Globals.NavigateURL(ModuleContext.TabId) + "?page={0}' Class='btn btn-header' style='background: #3498db; color: #fff;'>{0}</a>", i)); }
            }

            return pagerSb.ToString();
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
        public bool isActive { get; set; }
    }

    public class ResourceListPayload
    {
        public int count { get; set; }
        public List<ResourceList> resourceList { get; set; }
    }
}