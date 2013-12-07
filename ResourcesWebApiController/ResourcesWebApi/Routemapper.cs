using System;
using DotNetNuke.Web.Api;

namespace ResourcesWebApi
{
    public class RouteMapper : IServiceRouteMapper
    {
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            mapRouteManager.MapHttpRoute("ResourcesWebApi", "default", "{controller}/{action}", new[] { "ResourcesWebApi" });
        }
    }
}
