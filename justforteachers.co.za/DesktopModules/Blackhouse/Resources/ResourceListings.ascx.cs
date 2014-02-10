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
using DotNetNuke.Entities.Tabs;
using System.ComponentModel;
using System.Drawing;

namespace Blackhouse.Resources
{
    public partial class ResourceListings : ModuleUserControlBase
    {
        protected string dashboardUrlBase = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"];
        protected static List<TopicInfo> Topics;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                    if (Request.QueryString["q"] != null)
                    {
                        string query = Request.QueryString["q"];
                        query = query.Replace(", ", ",").Replace(' ', ',');
                        query = Request.QueryString["q"].Replace(", ", ",") + "," + query; // like a baus.
                        request = WebRequest.Create(dashboardUrlBase + "resourcelist/0/search/" + query) as HttpWebRequest;
                    }
                    else if (Request.QueryString["p"] != null)
                    {
                        int topicid = 0;
                        string topic = Request.QueryString["p"];
                        if (Request.QueryString["s"] != null)
                            topic = Request.QueryString["s"];
                        if (Request.QueryString["t"] != null)
                            topic = Request.QueryString["t"];
                        if (int.TryParse(topic, out topicid))
                        {
                            request = WebRequest.Create(dashboardUrlBase + "resourcetopicsearch/0/topic/" + topic) as HttpWebRequest;
                        }
                        else
                        {
                            request = WebRequest.Create(dashboardUrlBase + "resourcelist/") as HttpWebRequest;
                        }
                    }
                    else
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
                HttpWebRequest Topicsrequest;
                Topicsrequest = WebRequest.Create(dashboardUrlBase + "resourcetopicsearch") as HttpWebRequest;
                using (HttpWebResponse Topicsresponse = Topicsrequest.GetResponse() as HttpWebResponse)
                {
                    if (Topicsresponse.StatusCode != HttpStatusCode.OK)
                        throw new Exception(String.Format(
                        "Server error (HTTP {0}: {1}).",
                        Topicsresponse.StatusCode,
                        Topicsresponse.StatusDescription));

                    Stream resp = Topicsresponse.GetResponseStream();
                    StreamReader reader = new StreamReader(resp);
                    string text = reader.ReadToEnd();
                    Topics = JsonConvert.DeserializeObject<List<TopicInfo>>(text);
                    try
                    {
                        FillPhaseDropDown(ddlPhaseFilter, Topics.Where((x)=>x.parentId == null).ToList());
                        if (Request.QueryString["p"] != null)
                        {
                            ddlPhaseFilter.SelectedValue = Request.QueryString["p"];
                            FillSubjectDropDown(ddlSubjectFilter, Topics, Request.QueryString["p"]);
                        }
                        if (Request.QueryString["s"] != null)
                        {
                            ddlSubjectFilter.SelectedValue = Request.QueryString["s"];
                            FillTopicDropDown(ddlTopicFilter, Topics, Request.QueryString["s"]);
                        }
                        else ddlSubjectFilter.Items.Add("Please select a Phase...");
                        if (Request.QueryString["t"] != null)
                        {
                            ddlTopicFilter.SelectedValue = Request.QueryString["t"];
                        }
                        else ddlTopicFilter.Items.Add("Please select a Subject...");

                    }
                    catch (Exception ex)
                    {
                        throw new ApplicationException(ex.ToString());
                    }
                }

            }
            if (!PortalSettings.Current.UserInfo.IsInRole("Administrator"))
            {
                lnkAdd.Visible = false;
            }
        }

        public static void FillPhaseDropDown(DropDownList target, List<TopicInfo> data)
        {
            target.Items.Clear();
            target.AppendDataBoundItems = true;
            target.Items.Add(new ListItem("Please select a Phase...", "0"));
            target.DataSource = data;
            target.DataTextField = "name";
            target.DataValueField = "topicId";
            target.DataBind();
        }

        public static void FillSubjectDropDown(DropDownList target, List<TopicInfo> data, string selectedPhase)
        {
            int attemptedParse = 0;
            int.TryParse(selectedPhase, out attemptedParse);
            target.Items.Clear();
            target.AppendDataBoundItems = true;
            target.Items.Add(new ListItem("Please select a Subject...", "0"));
            target.DataSource = data.Where((x)=>x.parentId == attemptedParse);
            target.DataTextField = "name";
            target.DataValueField = "topicId";
            target.DataBind();
        }

        public static void FillTopicDropDown(DropDownList target, List<TopicInfo> data, string selectedSubject)
        {
            int attemptedParse = 0;
            int.TryParse(selectedSubject, out attemptedParse);
            target.Items.Clear();
            target.AppendDataBoundItems = true;
            target.Items.Add(new ListItem("Please select a Topic...", "0"));
            target.DataSource = data.Where((x) => x.parentId == attemptedParse);
            target.DataTextField = "name";
            target.DataValueField = "topicId";
            target.DataBind();
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL(PortalSettings.Current.ActiveTab.TabID, "resourceEdit", "mid=" + ModuleContext.ModuleId.ToString()));
        }

        protected void rptListings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string httprequest = "";
            int page = 0;
            string searchquery = "";
            string topic = "";
            if (Request.QueryString["page"] != null)
            {
                page = int.Parse(Request.QueryString["page"]) - 1;
            }
            if (Request.QueryString["q"] != null)
            {
                searchquery = Request.QueryString["q"];
            }
            if (Request.QueryString["t"] != null)
            {
                topic = Request.QueryString["t"];
            }
            switch (((LinkButton)e.CommandSource).CommandArgument.ToLower())
            {
                case "resourcename":
                    if (searchquery == "" && topic == "")
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/name/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/name/DESC";
                        }
                    }
                    else if (topic != "")
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcetopicsearch/" + page + "/topic/" + topic + "/name/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcetopicsearch/" + page + "/topic/" + topic + "/name/DESC";
                        }
                    }
                    else
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/search/" + searchquery + "/name/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/search/" + searchquery + "/name/DESC";
                        }
                    }
                    break;
                case "resourcerating":
                    if (searchquery == "" && topic == "")
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/rating/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/rating/DESC";
                        }
                    }
                    else if (topic != "")
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcetopicsearch/" + page + "/topic/" + topic + "/rating/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcetopicsearch/" + page + "/topic/" + topic + "/rating/DESC";
                        }
                    }
                    else
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/search/" + searchquery + "/rating/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/search/" + searchquery + "/rating/DESC";
                        }
                    }
                    break;
                case "resourceuploaddate":
                    if (searchquery == "" && topic == "")
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/uploaddate/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/uploaddate/DESC";
                        }
                    }
                    else if (topic != "")
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcetopicsearch/" + page + "/topic/" + topic + "/uploaddate/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcetopicsearch/" + page + "/topic/" + topic + "/uploaddate/DESC";
                        }
                    }
                    else
                    {
                        if (((LinkButton)e.CommandSource).CssClass.Contains("active"))
                        {
                            ((LinkButton)e.CommandSource).CssClass.Replace(" active", "");
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/search/" + searchquery + "/uploaddate/ASC";
                        }
                        else
                        {
                            ((LinkButton)e.CommandSource).CssClass = ((LinkButton)e.CommandSource).CssClass + " active";
                            httprequest = dashboardUrlBase + "resourcelist/" + page + "/search/" + searchquery + "/uploaddate/DESC";
                        }
                    }
                    break;
                case "resourcesearch":
                    //we need to find the searchbox.
                    TextBox txtSearch = (TextBox)rptListings.Controls[0].Controls[0].FindControl("txtSearch");
                    if (!txtSearch.Text.IsNullOrWhiteSpace() && txtSearch.Text != "")
                        Response.Redirect(TabController.CurrentPage.FullUrl + "?q=" + txtSearch.Text);
                    return;
                    break;
                default:
                    Response.Redirect(TabController.CurrentPage.FullUrl + "?mid=" + ModuleContext.ModuleId.ToString() + "&ctl=resourceView&resourceid=" + ((LinkButton)e.CommandSource).CommandArgument);
                    break;
            }
            HttpWebRequest request = WebRequest.Create(httprequest) as HttpWebRequest;
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

                rptListings.DataSource = null;
                rptListings.DataBind();
                rptListings.DataSource = temp.resourceList;
                rptListings.DataBind();
                PaginationLabel.Text = RenderPaginationControl(page + 1, 20, temp.count);
            }


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

        public string GetImage(string fileId)
        {
            if (fileId != "" && fileId != "0")
            {
                string url = "http://" + System.Configuration.ConfigurationManager.AppSettings["apiURL"] + string.Format("resourcefile/{0}", fileId);
                WebClient client = new WebClient();
                FileResult result = JsonConvert.DeserializeObject<FileResult>(client.DownloadString(url));
                if (result != null)
                {
                    TypeConverter tc = TypeDescriptor.GetConverter(typeof(Bitmap));
                    Bitmap MyBitmap = (Bitmap)tc.ConvertFrom(result.fileContents);


                    string imgString = Convert.ToBase64String(result.fileContents);
                    //Set the source with data:image/bmp
                    return String.Format("data:image/Bmp;base64,{0}\"", imgString);
                }
                else
                {
                    return "/desktopmodules/blackhouse/resources/noimage.png";
                }
            }
            else
            {
                return "/desktopmodules/blackhouse/resources/noimage.png";
            }

        }

        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            if (!txtSearch.Text.IsNullOrWhiteSpace() && txtSearch.Text != "")
                Response.Redirect(TabController.CurrentPage.FullUrl + "?q=" + txtSearch.Text);
        }
        protected void ddlTopicSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPhaseFilter.SelectedValue != "0")
            {
                //now we need to search....
                Response.Redirect(TabController.CurrentPage.FullUrl + "?p=" + ddlPhaseFilter.SelectedValue);
            }
        }
        protected void ddlSubjectFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSubjectFilter.SelectedValue != "0")
            {
                //now we need to search....
                if (Request.QueryString["p"] != null)
                {
                    Response.Redirect(TabController.CurrentPage.FullUrl + "?s=" + ddlSubjectFilter.SelectedValue + "&p=" + Request.QueryString["p"]);
                }
            }

        }
        protected void ddlTopicFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTopicFilter.SelectedValue != "0")
            {
                if (Request.QueryString["p"] != null && Request.QueryString["s"] != null)
                {
                    //now we need to search....
                    Response.Redirect(TabController.CurrentPage.FullUrl + "?t=" + ddlTopicFilter.SelectedValue + "&s=" + Request.QueryString["s"] + "&p=" + Request.QueryString["p"]);
                }
            }
        }
}


}