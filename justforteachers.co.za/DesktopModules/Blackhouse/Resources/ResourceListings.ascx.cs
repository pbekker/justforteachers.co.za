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
using DotNetNuke.Entities.Portals;

namespace Blackhouse.Resources
{
    public partial class ResourceListings : ModuleUserControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!PortalSettings.Current.UserInfo.IsInRole("Administrator"))
            {
                lnkAdd.Visible = false;
            }
        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL(PortalSettings.Current.ActiveTab.TabID, "resourceEdit", "mid=" + ModuleContext.ModuleId.ToString()));
        }
    }
}