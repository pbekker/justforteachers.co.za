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
using JustForTeachersApi.Models;

namespace JustForTeachersApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class MenuItemController : ApiController
    {
        // GET: /MenuItem/tabid/moduleid
        [HttpGet]
        [AllowAnonymous]
        public List<menuItem> Get(int tabid, int moduleid)
        {
            using (ResourcesDataContext db = new ResourcesDataContext())
            {
                if (db.bhdMenuPages.Any((x) => x.tabId == tabid && x.moduleId == moduleid))
                {
                    var m = db.bhdMenuPages.Single((x) => x.tabId == tabid && x.moduleId == moduleid);
                    var menuList = m.bhdMenu.bhdMenuItems.ToList();
                    if (menuList.Any())
                    {
                        List<menuItem> menuItemList = new List<menuItem>();
                        foreach (var currentMenuItem in menuList)
                        {
                            int _tabid = 0;
                            int _moduleid = 0;
                            int.TryParse(currentMenuItem.tabId.ToString(), out _tabid);
                            int.TryParse(currentMenuItem.moduleId.ToString(), out _moduleid);
                            //menuItem item = new menuItem(currentMenuItem.id, currentMenuItem.text, currentMenuItem.hoverText, _tabid, _moduleid, currentMenuItem.url, currentMenuItem.isActive);
                            menuItem item = new menuItem();
                            item.menuId = currentMenuItem.menuId;
                            item.text = currentMenuItem.text;
                            item.hoverText = currentMenuItem.hoverText;
                            item.tabId = _tabid;
                            item.moduleId = _moduleid;
                            item.url = currentMenuItem.url;
                            item.isActive = currentMenuItem.isActive;
                            //item.isAdmin = currentMenuItem.isAdmin;
                            menuItemList.Add(item);
                        }

                        return menuItemList;
                    }
                    else return null;

                }
                else return null;
            }
        }

    }
}
