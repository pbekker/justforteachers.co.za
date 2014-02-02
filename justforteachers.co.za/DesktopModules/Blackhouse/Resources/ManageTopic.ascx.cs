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

namespace Blackhouse.Resources
{
    public partial class ManageTopic : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string url = dashboardUrlBase + "resourcetopic";
                WebClient client = new WebClient();
                List<ResourceTopic> result = JsonConvert.DeserializeObject<List<ResourceTopic>>(client.DownloadString(url));
                gvTopics.DataSource = result;
                gvTopics.DataBind();
            }
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {

        }
        protected void cmdSave_Click(object sender, EventArgs e)
        {
                int? parentId = 0;
                if (ddSubject.SelectedValue == "0")
                {
                    if (ddParentId.SelectedValue == "0")
                    {
                        parentId = null;
                    }
                    else
                    {
                        parentId = int.Parse(ddParentId.SelectedValue);
                    }
                }
                else
                {
                    parentId = int.Parse(ddSubject.SelectedValue);
                }
                ResourceTopic newTopic = new ResourceTopic();
                newTopic.topicId = String.IsNullOrEmpty(hidTopicId.Value) ? 0 : int.Parse(hidTopicId.Value);
                newTopic.parentId = parentId;
                newTopic.name = txtName.Text;
                newTopic.description = txtDesc.Text;
                newTopic.active = chkActive.Checked;
        }
    
        public class ResourceTopic
        {
            public int? topicId { get; set; }
            public int? parentId { get; set; }
            public string parentname { get; set; }
            public string name { get; set; }
            public string description { get; set; }
            public bool active { get; set; }
        }
    }
}