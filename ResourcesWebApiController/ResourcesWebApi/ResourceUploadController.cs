using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DotNetNuke.Web.Api;
using System.Collections.Generic;
using ResourcesWebApi.BLL;
using System.Threading.Tasks;
using System.Web;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Diagnostics;

using System.Linq;
using System.Net.Http.Formatting;


namespace ResourcesWebApi
{
    public class ResourceUploadController : DnnApiController
    {
        public static T JsonDeserialize<T>(string jsonString)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));
            T obj = (T)ser.ReadObject(ms);
            return obj;
        }

        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage GetUploadPayLoad()
        {
            ResourcePayload payload = new ResourcePayload();
            GenDropList tmpList = new GenDropList();
            using (ResourcesData.ResourcesDataContext dc = new ResourcesData.ResourcesDataContext())
            {
                List<GenDropList> r = (from d in dc.bhdResourceTypes
                                       where d.isActive
                                       select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.types = r;
                r = (from d in dc.bhdResourceTopics
                     where d.isActive
                     select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.topics = r;
                r = (from d in dc.bhdResourceLanguages
                     where d.isActive
                     select new GenDropList() { ListId = d.id, ListValue = d.name }).ToList();
                payload.languages = r;
            }
            return Request.CreateResponse(HttpStatusCode.OK, payload);
        }

        [HttpPost]
        public HttpResponseMessage Post(UploadModel model)
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, model);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.OK, ex);
            }
        }
    }
}
