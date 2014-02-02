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
    public partial class manageResourceFormat : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];

        public class ResourceFormat
        {
            public int formatId { get; set; }
            public string name { get; set; }
            public bool? active { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divAddEdit.Visible = false;
                string url = dashboardUrlBase + "resourceformat";
                WebClient client = new WebClient();
                List<ResourceFormat> result = JsonConvert.DeserializeObject<List<ResourceFormat>>(client.DownloadString(url));
                gvResourceFormat.DataSource = result;
                gvResourceFormat.DataBind();
            }
        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            divFormats.Visible = false;
            divAddEdit.Visible = true;
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            divFormats.Visible = true;
            divAddEdit.Visible = false;
            hidFormatId.Value = "";
            txtFormatName.Text = "";
            chkActive.Checked = true;
        }
        protected void cmdSave_Click(object sender, EventArgs e)
        {
            ResourceFormat newFormat = new ResourceFormat();

            newFormat.formatId = String.IsNullOrEmpty(hidFormatId.Value) ? 0 : int.Parse(hidFormatId.Value);
            newFormat.name = txtFormatName.Text;
            newFormat.active = chkActive.Checked;

            HttpWebRequest request = WebRequest.Create(dashboardUrlBase + "resourceformat/") as HttpWebRequest;
            request.ContentType = "text/json";
            request.Method = "PUT";
            try
            {
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    string json = JsonConvert.SerializeObject(newFormat);
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

            divFormats.Visible = true;
            divAddEdit.Visible = false;

            string url = dashboardUrlBase + "resourceformat";
            WebClient client = new WebClient();
            List<ResourceFormat> result = JsonConvert.DeserializeObject<List<ResourceFormat>>(client.DownloadString(url));
            gvResourceFormat.DataSource = result;
            gvResourceFormat.DataBind();

        }
        protected void gvResourceFormat_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblName = (Label)e.Row.FindControl("lblName");
                Label lblId = (Label)e.Row.FindControl("lblFormatId");
                CheckBox chkActive = (CheckBox)e.Row.FindControl("chkActive");
                LinkButton cmdEdit = (LinkButton)e.Row.FindControl("cmdEdit");
                ResourceFormat currentFormat = (ResourceFormat)e.Row.DataItem;
                lblName.Text = currentFormat.name;
                lblId.Text = currentFormat.formatId.ToString();
                chkActive.Checked = currentFormat.active.Value;
                cmdEdit.CommandArgument = currentFormat.formatId.ToString();
                cmdEdit.CommandName = "editFormat";
                //upGrid.Update();
            }

        }
        protected void gvResourceFormat_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName.ToLower())
            {
                case "editformat":
                    {
                        loadFormat(e.CommandArgument.ToString());
                        break;
                    }
            }
        }

        private void loadFormat(string formatId)
        {
            try
            {
                string url = dashboardUrlBase + "resourceformat/" + formatId;
                WebClient client = new WebClient();
                ResourceFormat result = JsonConvert.DeserializeObject<ResourceFormat>(client.DownloadString(url));
                hidFormatId.Value = result.formatId.ToString();
                txtFormatName.Text = result.name;
                chkActive.Checked = result.active.Value;
                divFormats.Visible = false;
                divAddEdit.Visible = true;
            }
            catch (Exception ex)
            {

                throw new ApplicationException(ex.ToString());
            }
        }
    }
}