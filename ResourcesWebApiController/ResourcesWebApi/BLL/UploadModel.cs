using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ResourcesWebApi.BLL
{
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
}
