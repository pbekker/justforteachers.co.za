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
<<<<<<< HEAD
                foreach (ResourceTopic parentTopics in result.Where((x) => x.parentId == null))
                {
                    TreeNode parentNode = new TreeNode(parentTopics.name, parentTopics.topicId.ToString());
                    parentNode.Expanded = false;
                    AddChildNodes(parentNode, result, int.Parse(parentTopics.topicId.ToString()));
                    tvTopics.Nodes.Add(parentNode);
                }
=======
                gvTopics.DataSource = result;
                gvTopics.DataBind();
>>>>>>> 14cf5e315a2a1e61411386202b5ad33f34134bf8
            }
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {

<<<<<<< HEAD
            WebClient client = new WebClient();
            string url = dashboardUrlBase + "resourcetopic/" + tvTopics.SelectedValue;
            ResourceTopic result = JsonConvert.DeserializeObject<ResourceTopic>(client.DownloadString(url));
            hidTopicId.Value = result.topicId.ToString();
            txtName.Text = result.name;
            txtDesc.Text = result.description;
            chkActive.Checked = result.active;
            int parentId = result.phaseId;
            int subjectId = 0;
            int.TryParse(result.subjectId.ToString(), out subjectId);

            PopulateParentDropdown(parentId);
            PopulateSubjectDropdown(subjectId);
=======
>>>>>>> 14cf5e315a2a1e61411386202b5ad33f34134bf8
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
<<<<<<< HEAD
            public int? subjectId { get; set; }
            public int phaseId {get; set; }
=======
>>>>>>> 14cf5e315a2a1e61411386202b5ad33f34134bf8
            public string parentname { get; set; }
            public string name { get; set; }
            public string description { get; set; }
            public bool active { get; set; }
        }
    }
}