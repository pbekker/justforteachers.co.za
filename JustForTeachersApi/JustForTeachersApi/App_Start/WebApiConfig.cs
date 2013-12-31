﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace JustForTeachersApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {

            config.EnableCors();

            //config.Routes.MapHttpRoute(
            //    name: "DefaultApi",
            //    routeTemplate: "api/{controller}/{id}",
            //    defaults: new { id = RouteParameter.Optional }
            //); 

            config.Routes.MapHttpRoute(
                name: "ResourceUpload",
                routeTemplate: "api/{controller}/{id}/{type}",
                defaults: new { id = RouteParameter.Optional, type = RouteParameter.Optional }
            ); 
            
            config.Routes.MapHttpRoute(
                name: "BundleApi",
                routeTemplate: "api/{controller}/{id}/{fileid}",
                defaults: new { id = RouteParameter.Optional, fileid = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}/{orderby}/{order}",
                defaults: new { id = RouteParameter.Optional, orderby = RouteParameter.Optional, order = RouteParameter.Optional }
            );
        }
    }
}
