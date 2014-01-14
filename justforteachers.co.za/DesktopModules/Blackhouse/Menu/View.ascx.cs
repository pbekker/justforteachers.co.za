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
using DotNetNuke.Entities.Modules;


namespace Blackhouse.Menu
{
    public partial class View : PortalModuleBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];
        public class menuItem
        {
            public int menuId { get; set; }
            public string text { get; set; }
            public string hoverText { get; set; }
            public bool isAdmin { get; set; }
            public bool isActive { get; set; }
            public int tabId { get; set; }
            public int moduleId { get; set; }
            public string url { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string url = dashboardUrlBase + "menuitem/tabid/" + TabId.ToString() + "/moduleid/" + ModuleId.ToString() + "/";
                WebClient client = new WebClient();
                var result = JsonConvert.DeserializeObject<List<menuItem>>(client.DownloadString(url));
                if (UserInfo.IsInRole("administrator") || UserInfo.IsSuperUser)
                    rptMenuItems.DataSource = result;
                else 
                    rptMenuItems.DataSource = result.Where((x)=>x.isAdmin == false);
                rptMenuItems.DataBind();
                client.Dispose();

                if (result == null)
                {
                    lblEmptyMenu.Visible = true;
                }
            }
        }


        protected void rptMenuItems_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
               e.Item.ItemType == ListItemType.AlternatingItem)
            {
                menuItem currentItem = (menuItem)e.Item.DataItem;
                HyperLink menuLink = (HyperLink)e.Item.FindControl("hlMenuLink");
                menuLink.Text = currentItem.text;
                menuLink.ToolTip = currentItem.hoverText;

                if (!String.IsNullOrEmpty(currentItem.url) && currentItem.tabId == 0 && currentItem.moduleId == 0)
                {
                    menuLink.NavigateUrl = currentItem.url;
                }
                else if (!String.IsNullOrEmpty(currentItem.url) && currentItem.tabId != 0 && currentItem.moduleId != 0)
                {
                    menuLink.NavigateUrl = Globals.NavigateURL(currentItem.tabId, currentItem.url, "mid=" + currentItem.moduleId.ToString());
                }
                else
                {
                    menuLink.NavigateUrl = Globals.NavigateURL(currentItem.tabId);
                }
            }            
        }
    }
}