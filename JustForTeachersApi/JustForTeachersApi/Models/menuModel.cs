using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JustForTeachersApi.Models
{
    public class menuModel
    {

    }

    public class menuItem
    {
        public int menuId { get; set; }
        public string text { get; set; }
        public string hoverText { get; set; }
        public bool isActive { get; set; }
        public int tabId { get; set; }
        public int moduleId { get; set; }
        public string url { get; set; }

    }

    //public menuItem(int MenuId, string Text, string HoverText, string Url, bool IsActive)
    //    {
    //        menuId = MenuId;
    //        text = Text;
    //        hoverText = HoverText;
    //        url = Url;
    //        isActive = IsActive;
    //    }

    //    public menuItem(int MenuId, string Text, string HoverText, int TabId, int ModuleId, bool IsActive)
    //    {
    //        menuId = MenuId;
    //        text = Text;
    //        hoverText = HoverText;
    //        tabId = TabId;
    //        moduleId = ModuleId;
    //        isActive = IsActive;
    //    }

    //    public menuItem(int MenuId, string Text, string HoverText, int TabId, int ModuleId, string Url, bool IsActive)
    //    {
    //        menuId = MenuId;
    //        text = Text;
    //        hoverText = HoverText;
    //        tabId = TabId;
    //        moduleId = ModuleId;
    //        url = Url;
    //        isActive = IsActive;
    //    }

        

}