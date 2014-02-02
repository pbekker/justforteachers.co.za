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
                divAddEdit.Visible = false;
                string url = dashboardUrlBase + "resourcetopic";
                WebClient client = new WebClient();
                List<ResourceTopic> result = JsonConvert.DeserializeObject<List<ResourceTopic>>(client.DownloadString(url));
                foreach (ResourceTopic parentTopics in result.Where((x) => x.parentId == null))
                {
                    TreeNode parentNode = new TreeNode(parentTopics.name, parentTopics.topicId.ToString());
                    AddChildNodes(parentNode, result, int.Parse(parentTopics.topicId.ToString()));
                    tvTopics.Nodes.Add(parentNode);
                }
            }
        }

        private void AddChildNodes(TreeNode parentNode, List<ResourceTopic> result, int parentTopicId)
        {
            foreach (ResourceTopic childItem in result.Where((x) => x.parentId == parentTopicId))
            {
                TreeNode childNode = new TreeNode(childItem.name, childItem.topicId.ToString());
                childNode.Expanded = false;
                AddChildNodes(childNode, result, int.Parse(childItem.topicId.ToString()));
                parentNode.ChildNodes.Add(childNode);
            }

        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            hidTopicId.Value = "";
            txtName.Text = "";
            txtDesc.Text = "";
            chkActive.Checked = true;
            divSubject.Visible = false;
            divAddEdit.Visible = false;
            divTopics.Visible = true;
            upAddEdit.Update();
        }

        protected void tvTopics_SelectedNodeChanged(object sender, EventArgs e)
        {
            divTopics.Visible = false;
            divAddEdit.Visible = true;

            WebClient client = new WebClient();
            string url = dashboardUrlBase + "resourcetopic/" + tvTopics.SelectedValue;
            ResourceTopic result = JsonConvert.DeserializeObject<ResourceTopic>(client.DownloadString(url));
            hidTopicId.Value = result.topicId.ToString();
            txtName.Text = result.name;
            txtDesc.Text = result.description;
            chkActive.Checked = result.active;
            int parentId = 0;
            int.TryParse(result.parentId.ToString(), out parentId);
            int subjectId = 0;
            int.TryParse(result.subjectId.ToString(), out subjectId);

            PopulateParentDropdown(parentId);
            PopulateSubjectDropdown(subjectId);
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

            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourcetopic/") as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "PUT";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(newTopic);
                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }

                var httpResponse = (HttpWebResponse)request.GetResponse();
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.ToString());
            }

            divAddEdit.Visible = false;
            divTopics.Visible = true;
            tvTopics.Nodes.Clear();
            string url = dashboardUrlBase + "resourcetopic";
            WebClient client = new WebClient();
            List<ResourceTopic> result = JsonConvert.DeserializeObject<List<ResourceTopic>>(client.DownloadString(url));
            foreach (ResourceTopic parentTopics in result.Where((x) => x.parentId == null))
            {
                TreeNode parentNode = new TreeNode(parentTopics.name, parentTopics.topicId.ToString());
                AddChildNodes(parentNode, result, int.Parse(parentTopics.topicId.ToString()));
                tvTopics.Nodes.Add(parentNode);
            }

        }

        public class ResourceTopic
        {
            public int? topicId { get; set; }
            public int? parentId { get; set; }
            public int? subjectId { get; set; }
            public string parentname { get; set; }
            public string name { get; set; }
            public string description { get; set; }
            public bool isParent { get; set; }
            public bool isSubject { get; set; }
            public bool active { get; set; }
        }

        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            divAddEdit.Visible = true;
            divTopics.Visible = false;

            PopulateParentDropdown(0);
        }

        private void PopulateParentDropdown(int selectedValue)
        {
            WebClient client = new WebClient();
            string url = dashboardUrlBase + "resourcetopic";
            ddParentId.Items.Clear();
            ddParentId.Items.Add(new ListItem("Please select a Phase.", "0"));
            ddParentId.AppendDataBoundItems = true;
            List<ResourceTopic> result = JsonConvert.DeserializeObject<List<ResourceTopic>>(client.DownloadString(url));
            ddParentId.DataSource = result.Where((x) => x.parentId == null);
            ddParentId.DataValueField = "topicId";
            ddParentId.DataTextField = "name";
            ddParentId.DataBind();
            ddParentId.SelectedValue = (selectedValue != 0) ? selectedValue.ToString() : "0";
        }
        protected void ddParent_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateSubjectDropdown(0);
        }

        private void PopulateSubjectDropdown(int selectedValue)
        {
            divSubject.Visible = true;
            WebClient client = new WebClient();
            string url = dashboardUrlBase + "resourcetopic";
            ddSubject.Items.Clear();
            ddSubject.Items.Add(new ListItem("Please select a Subject.", "0"));
            ddSubject.AppendDataBoundItems = true;
            List<ResourceTopic> result = JsonConvert.DeserializeObject<List<ResourceTopic>>(client.DownloadString(url));
            ddSubject.DataSource = result.Where((x) => x.parentId == int.Parse(ddParentId.SelectedValue));
            ddSubject.DataValueField = "topicId";
            ddSubject.DataTextField = "name";
            ddSubject.DataBind();
            upAddEdit.Update();
            ddSubject.SelectedValue = (selectedValue != 0) ? selectedValue.ToString() : "0";
        }
    }
}