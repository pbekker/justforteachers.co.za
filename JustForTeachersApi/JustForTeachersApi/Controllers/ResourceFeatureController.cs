using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ResourceData;
using JustForTeachersApi.Models;
using System.Threading.Tasks;
using System.Web;
using System.IO;
using System.Web.Http.Cors;
using Newtonsoft.Json;

namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ResourceFeatureController : ApiController
    {
        // GET api/resourcefeature
        [HttpGet]
        [AllowAnonymous]
        public ResourceFeaturedPayload Get()
        {
            ResourceFeaturedPayload payload = new ResourceFeaturedPayload();
            payload.resourceList = new List<ResourceList>();
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = dc.sps_getFeaturedResources(0, true);
                foreach (var item in r)
                {
                    ResourceList tmpPayload = new ResourceList();
                    tmpPayload.ResourceName = item.name;
                    tmpPayload.ResourceDescription = item.description;
                    tmpPayload.ResourceLanguage = item.language;
                    tmpPayload.ResourceTopic = item.topic;
                    tmpPayload.ResourceUploadDate = item.uploadDate.ToShortDateString();
                    tmpPayload.ResourceId = item.id;
                    tmpPayload.ResourceType = item.type;
                    payload.resourceList.Add(tmpPayload);
                }
            }
            return payload;
        }

        // GET api/resourcefeature/5
        [HttpGet]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Get(int id)
        {
            return Request.CreateResponse(HttpStatusCode.BadRequest, "This method is not supported (GET) with a parameter. 400-1");
        }

        // POST api/resourcefeature
        [HttpPost]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Post()
        {
            using (ResourcesDataContext dc = new ResourcesDataContext())
            {
                var r = (from d in dc.bhdFeaturedResources
                         select d);
                foreach (var feature in r)
                {
                    feature.isActive = false;
                    feature.isFrontPage = false;
                }
                dc.SubmitChanges();

                var result = Request.Content.ReadAsFormDataAsync();
                Stream streamIn = await Request.Content.ReadAsStreamAsync();
                StreamReader streamReader = new StreamReader(streamIn);
                string jsonstring = streamReader.ReadToEnd();
                if (result != null)
                {
                    List<FeaturedResourceModel> featuredModel;
                    try
                    {
                        List<FeaturedResourceModel> tmp = (List<FeaturedResourceModel>)JsonConvert.DeserializeObject(jsonstring.ToString(), typeof(List<FeaturedResourceModel>));
                        featuredModel = tmp;
                    }
                    catch (Exception ex)
                    {
                        return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
                    }

                    if (featuredModel != null)
                    {
                        foreach (FeaturedResourceModel item in featuredModel)
                        {
                            bhdFeaturedResource feat = new bhdFeaturedResource();
                            feat.resourceId = item.ResourceId;
                            feat.portalId = item.PortalId;
                            feat.sequence = item.Sequence;
                            //feat.startDate = item.startDate;
                            //feat.endDate = item.endDate;
                            feat.isActive = true;
                            dc.bhdFeaturedResources.InsertOnSubmit(feat);
                            dc.SubmitChanges();
                        }
                    }
                }
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Success");
        }

        // PUT api/resourcefeature/5
        [HttpPut]
        [AllowAnonymous]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/resourcefeature/5
        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id)
        {
        }

    }
}
