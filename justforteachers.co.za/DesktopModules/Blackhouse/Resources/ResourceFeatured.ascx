<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceFeatured.ascx.cs" Inherits="Blackhouse.Resources.ResourceFeatured" %>

<script src="/DesktopModules/Blackhouse/js/admin.js"></script>
<style>
    .resource-box {
        display:block;
        background: #ececec;
        border: 1px solid #e5e5e5;
        padding: 5px;
        margin: 5px;
        max-width: 31%;
        float: left;
    }
    .resource-box a {
        text-overflow: ellipsis;
        overflow: hidden;
        font-size: 16px;
        line-height: 26px;
        text-decoration: none;

    }
    .resource-box a:visited {
        color: #930916;
    }
    .resource-box p {
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        font-size: 12px;
        line-height: 14px;
        max-height: 42px;
    }
</style>

<div ng-app="resource-manager">
    <div ng-controller="ResourcesFeatured">
        <div ng-repeat="resource in defaults">
            <div class="resource-box">
                <a ng-click="selectResource(resource)">{{resource.ResourceName}}</a>
                <p>{{resource.ResourceDescription}}</p>
                <span><b>Type:</b> {{resource.ResourceType}}</span>
                <span><b>Topic:</b> {{resource.ResourceTopic}}</span>
                <span><b>Language:</b> {{resource.ResourceLanguage}}</span>
                <p><b>Uploaded:</b> {{resource.ResourceUploadDate}}</p>
            </div>
        </div>
    </div>
</div>