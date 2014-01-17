<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceView.ascx.cs" Inherits="Blackhouse.Resources.ResourceView" %>

<script src="/DesktopModules/Blackhouse/js/admin.js"></script>

<style>
    .resource-box {
        display:block;
        background: #ececec;
        border: 1px solid #e5e5e5;
        padding: 5px;
        margin: 5px;
    }
    .resource-box a {
        font-size: 16px;
        line-height: 26px;
        text-decoration: none;
    }
    .resource-box p {
        font-size: 12px;
        line-height: 14px;
    }
</style>

<div ng-app="resource-manager">
    <div ng-controller="ResourceView">
        <div class="resource-box">
            <a href="#">{{defaults.ResourceName}}</a>
            <p>{{defaults.ResourceDescription}}</p>
            <span><b>Type:</b> {{defaults.ResourceType}}</span>
            <span><b>Topic:</b> {{defaults.ResourceTopic}}</span>
            <span><b>Language:</b> {{defaults.ResourceLanguage}}</span>
            <p><b>Uploaded:</b> {{defaults.ResourceUploadDate}}</p>
        </div>
    </div>
</div>