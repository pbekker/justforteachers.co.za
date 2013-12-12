using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JustForTeachersApi.Models
{
    public class ResourceModel
    {

    }

    public class UploadModel
    {
        public UploadData model { get; set; }
        public List<UploadFile> files { get; set; }
    }

    public class UploadFile
    {
        public string name { get; set; }
        public string size { get; set; }
        public string type { get; set; }
    }

    public class UploadData
    {
        public string ResourceName { get; set; }
        public string ResourceDescription { get; set; }
        public int ResourceTypeId { get; set; }
        public int ResourceLanguageId { get; set; }
        public int ResourceTopicId { get; set; }
    }

    public class GenDropList
    {
        public int ListId { get; set; }
        public string ListValue { get; set; }
    }

    public class ResourcePayload
    {
        public List<GenDropList> types { get; set; }
        public List<GenDropList> topics { get; set; }
        public List<GenDropList> languages { get; set; }
    }

    public class ResourceListPayload
    {
        public List<ResourceList> resourceList { get; set; }
    }

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

    public class ResourceFeaturedPayload
    {
        public List<ResourceList> resourceList { get; set; }
    }

    public class ResourceApprovePayload
    {
        public List<ResourceList> resourceList { get; set; }
    }
}