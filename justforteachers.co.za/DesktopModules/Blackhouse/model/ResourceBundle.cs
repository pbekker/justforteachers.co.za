using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ResourceBundle
/// </summary>
/// 

namespace Blackhouse.Resources
{
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
    }
}