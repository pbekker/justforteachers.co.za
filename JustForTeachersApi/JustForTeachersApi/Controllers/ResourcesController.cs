using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace JustForTeachersApi.Controllers
{
    public class ResourcesController : ApiController
    {
        // GET api/resources
        [HttpGet]
        [AllowAnonymous]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/resources/5
        [HttpGet]
        [AllowAnonymous]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/resources
        [HttpPost]
        [AllowAnonymous]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/resources/5
        [HttpPut]
        [AllowAnonymous]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/resources/5
        [HttpDelete]
        [AllowAnonymous]
        public void Delete(int id)
        {
        }
    }
}
