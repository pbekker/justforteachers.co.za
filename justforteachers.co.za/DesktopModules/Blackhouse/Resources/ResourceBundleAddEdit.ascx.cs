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

namespace Blackhouse.Resources
{
    public partial class ResourceBundleAddEdit : ModuleUserControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string apiURL = System.Configuration.ConfigurationManager.AppSettings["apiURL"];
            HttpWebRequest request = WebRequest.Create("http://" + apiURL + "resourcebundle/" + PortalSettings.Current.UserInfo.UserID + "/") as HttpWebRequest;
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                if (response.StatusCode != HttpStatusCode.OK)
                    throw new Exception(String.Format(
                    "Server error (HTTP {0}: {1}).",
                    response.StatusCode,
                    response.StatusDescription));

                Stream resp = response.GetResponseStream();
                StreamReader reader = new StreamReader(resp);
                string jsonstring = reader.ReadToEnd();
                List<ResourceBundle> lrb = JsonConvert.DeserializeObject<List<ResourceBundle>>(jsonstring);
                if (!IsPostBack)
                {
                    ddBundleId.Items.Clear();
                    ddBundleId.Items.Add(new ListItem("Please Select a Bundle", "0"));
                    if (lrb.Any())
                    {
                        foreach (ResourceBundle rb in lrb)
                        {
                            ddBundleId.Items.Add(new ListItem(rb.name, rb.bundleId.ToString()));
                        }
                    }
                }
            }
        }
        protected void cmdAddResourceToBundle_Click(object sender, EventArgs e)
        {
            // get resource Id from qs, add to db (bundleId from selected)
            string apiURL = System.Configuration.ConfigurationManager.AppSettings["apiURL"];
            HttpWebRequest request = WebRequest.Create("http://" + apiURL + "resourcebundle/" + PortalSettings.Current.UserInfo.UserID + "/") as HttpWebRequest;
            request.Method = "POST";
            request.ContentType = "text/json";

            List<ResourceBundle> newBundleList = new List<ResourceBundle>();
            ResourceBundle newBundle = new ResourceBundle();
            newBundle.name = txtBundleName.Text;
            newBundle.description = txtBundleDescription.Text;
            newBundle.fileId = int.Parse(hidResourceFileId.Value);
            newBundle.isFavourite = false;
            newBundleList.Add(newBundle);

            string jsonstring = JsonConvert.SerializeObject(newBundleList);

            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamWriter streamwriter = new StreamWriter(request.GetRequestStream());
                streamwriter.Write(jsonstring);
                streamwriter.Flush();
                streamwriter.Close();

                if (response.StatusCode != HttpStatusCode.OK)
                    throw new Exception(String.Format(
                    "Server error (HTTP {0}: {1}).",
                    response.StatusCode,
                    response.StatusDescription));

                Stream resp = response.GetResponseStream();
                StreamReader reader = new StreamReader(resp);
                string jsonresponsestring = reader.ReadToEnd();
                List<ResourceBundle> lrb = JsonConvert.DeserializeObject<List<ResourceBundle>>(jsonresponsestring);

            }

        }
        protected void cmdAddBundle_Click(object sender, EventArgs e)
        {
            // make add visible, get resourceId from qs
        }
        protected void cmdSaveBundle_Click(object sender, EventArgs e)
        {
            // create / update the bundle
        }
        protected void cmdCancelBundle_Click(object sender, EventArgs e)
        {
            // cancel the create bundle view
        }
        protected void cmdCancelResource_Click(object sender, EventArgs e)
        {
           // closes the screen (fml.)
        }
    }

        //TODO: Fix this kak.
    public partial class ResourceBundle
    {
        public int bundleId { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public int fileId { get; set; }
        public string fileName { get; set; }
        public long fileSize { get; set; }
        public string fileType { get; set; }
        public string fileExtension { get; set; }
        public bool isActive { get; set; }
        public bool isFavourite { get; set; }
    }
}