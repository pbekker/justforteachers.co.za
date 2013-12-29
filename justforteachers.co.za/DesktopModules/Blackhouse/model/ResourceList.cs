using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Upload
/// </summary>
/// 
namespace Blackhouse.Resources
{
    public class ResourceListings
    {
        public class ResourceList
        {
            public int ResourceId { get; set; }
            public string ResourceName { get; set; }
            public string ResourceDescription { get; set; }
            public string ResourceTopic { get; set; }
            public string ResourceType { get; set; }
            public string ResourceLanguage { get; set; }
            public string ResourceUploadDate { get; set; }
        }

        public class ResourceListPayload
        {
            public List<ResourceList> resourceList { get; set; }
        }
    }
}
