﻿using System;
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


namespace Blackhouse.Resources
{
    public partial class ResourceBundle : ModuleUserControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpWebRequest request = WebRequest.Create("http://localhost:27645/api/resourcebundle/" + PortalSettings.Current.UserInfo.UserID + "/") as HttpWebRequest;
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
                var temp = JsonConvert.DeserializeObject<List<ResourceBundle>>(text);
                gvResourceBundle.DataSource = temp;
                gvResourceBundle.DataBind();
           }

        }
    }
}