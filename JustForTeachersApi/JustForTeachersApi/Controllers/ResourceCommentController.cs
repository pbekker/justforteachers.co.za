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
using System.IO.Compression;
using System.Web.Http.Cors;
using Newtonsoft.Json;

namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ResourceCommentController : ApiController
    {

        [HttpPut]
        [AllowAnonymous]
        public async Task<HttpResponseMessage> Put()
        {
            HttpResponseMessage response = new HttpResponseMessage();
            var result = Request.Content.ReadAsFormDataAsync();
            Stream streamIn = await Request.Content.ReadAsStreamAsync();
            StreamReader streamReader = new StreamReader(streamIn);
            string jsonstring = streamReader.ReadToEnd();
            Comment currentComment;
            try
            {
                currentComment = JsonConvert.DeserializeObject<Comment>(jsonstring);
            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }

            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                if (currentComment.commentId != 0)
                {
                    bhdResourceComment editComment = db.bhdResourceComments.Single((x) => x.commentId == currentComment.commentId);
                    editComment.commentDate = currentComment.commentDate;
                    editComment.comment = currentComment.comment;
                    editComment.isActive = currentComment.active;
                    db.SubmitChanges();
                    response = Request.CreateResponse(HttpStatusCode.OK, "Comment sucessfully edited.");
                }
                else
                {
                    bhdResourceComment newComment = new bhdResourceComment();
                    newComment.comment = currentComment.comment;
                    newComment.commentDate = DateTime.Now;
                    newComment.isActive = true;
                    newComment.userId = currentComment.userId;
                    newComment.resourceId = currentComment.resourceId;
                    db.bhdResourceComments.InsertOnSubmit(newComment);
                    db.SubmitChanges();
                    response = Request.CreateResponse(HttpStatusCode.OK, "New Format sucessfully added.");
                }
            }
            return response;

        }

        [HttpDelete]
        [AllowAnonymous]
        public HttpResponseMessage Delete(int id)
        {
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                db.bhdResourceComments.DeleteOnSubmit(db.bhdResourceComments.Single(x=>x.commentId == id));
                db.SubmitChanges();
                return  Request.CreateResponse(HttpStatusCode.OK);
            }
        }

    }
}
