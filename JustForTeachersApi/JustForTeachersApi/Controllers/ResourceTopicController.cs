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
    public class ResourceTopicController : ApiController
    {
        public class ResourceTopic
        {
            public int? topicId { get; set; }
            public int? parentId { get; set; }
            public int? subjectId { get; set; }
            public int phaseId { get; set; }
            public string parentname { get; set; }
            public string name { get; set; }
            public string description { get; set; }
            public bool isParent { get; set; }
            public bool isSubject { get; set; }
            public bool active { get; set; }
        }

        [HttpGet]
        [AllowAnonymous]
        public List<ResourceTopic> Get()
        {
            List<ResourceTopic> topics = new List<ResourceTopic>();
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                foreach (bhdResourceTopic currentItem in db.bhdResourceTopics)
                {
                    topics.Add(populateTopicFromDB(currentItem.id));
                }
            }
            return topics;
        }


        [HttpGet]
        [AllowAnonymous]
        public ResourceTopic Get(int id)
        {
            return populateTopicFromDB(id);
        }

        internal ResourceTopic populateTopicFromDB(int id)
        {
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                ResourceTopic currentTopic = new ResourceTopic();
                var dbTopic = db.bhdResourceTopics.Single((x) => x.id == id);
                currentTopic.topicId = dbTopic.id;
                currentTopic.parentId = dbTopic.parentId;
                currentTopic.name = dbTopic.name;
                currentTopic.description = dbTopic.description;
                currentTopic.active = dbTopic.isActive;
                if (currentTopic.parentId != null)
                {
                    FindParent(currentTopic);
                    currentTopic.isParent = false;
                }
                else
                {
                    currentTopic.isParent = true;
                    currentTopic.phaseId = currentTopic.topicId.Value;
                }

                return currentTopic;
            }
        }

        private void FindParent(ResourceTopic currentTopic)
        {
            bool isParent = !currentTopic.parentId.HasValue;
            if (isParent)
            {
                currentTopic.isSubject = false;
                currentTopic.subjectId = null;
            }
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                bhdResourceTopic parent = db.bhdResourceTopics.Single((x) => x.id == currentTopic.parentId);
                isParent = !parent.parentId.HasValue;
                if (isParent)
                {
                    currentTopic.isParent = false;
                    currentTopic.isSubject = true;
                    currentTopic.phaseId = parent.id;
                    currentTopic.parentname = parent.name;
                }
                else
                    currentTopic.isSubject = false;

                while (!isParent)
                {
                    
                    isParent = !parent.parentId.HasValue;
                    if (!isParent)
                    {
                        currentTopic.subjectId = parent.id;
                        parent = db.bhdResourceTopics.Single((x) => x.id == parent.parentId);
                    }
                    
                }
                currentTopic.phaseId = parent.id;
            }
        }

        [HttpPost]
        [AllowAnonymous]
        public void Post()
        {
        }

        [HttpPut]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Put()
        {
            HttpResponseMessage response = new HttpResponseMessage();
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            ResourceTopic currentTopic;
            try
            {
                currentTopic = JsonConvert.DeserializeObject<ResourceTopic>(jsonstring);
            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }

            try
            {
                using (ResourcesDataContext db = new ResourcesDataContext())
                {
                    if (currentTopic.topicId == 0)
                    {
                        bhdResourceTopic newTopic = new bhdResourceTopic();
                        newTopic.name = currentTopic.name;
                        newTopic.description = currentTopic.description;
                        newTopic.parentId = currentTopic.parentId;
                        newTopic.isActive = currentTopic.active;
                        db.bhdResourceTopics.InsertOnSubmit(newTopic);
                        db.SubmitChanges();
                        response = Request.CreateResponse(HttpStatusCode.OK, "New Topic sucessfully added.");
                    }
                    else
                    {
                        bhdResourceTopic editTopic = db.bhdResourceTopics.Single((x) => x.id == currentTopic.topicId);
                        editTopic.isActive = currentTopic.active;
                        editTopic.parentId = currentTopic.parentId;
                        editTopic.name = currentTopic.name;
                        editTopic.description = currentTopic.description;
                        db.SubmitChanges();
                        response = Request.CreateResponse(HttpStatusCode.OK, "Topic sucessfully edited.");
                    }
                }
            }
            catch (Exception ex)
            {
                Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }

            return response;
        }

        [HttpDelete]
        [AllowAnonymous]
        public HttpResponseMessage Delete(int id)
        {
            HttpResponseMessage response = new HttpResponseMessage();
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                try
                {
                    db.bhdResourceTopics.DeleteOnSubmit(db.bhdResourceTopics.Single((x) => x.id == id));
                    db.SubmitChanges();
                }
                catch (Exception ex)
                {
                    Request.CreateResponse(HttpStatusCode.PreconditionFailed, "Could not Remove the Topic. \r\n" + ex.ToString());
                }
            }
            return response;
        }
    }
}