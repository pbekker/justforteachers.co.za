<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceListings.ascx.cs" Inherits="Blackhouse.Resources.ResourceListings" %>

<base href="/" />
<script src="/DesktopModules/Blackhouse/js/admin.js"></script>
<style>
    .resource-listing {
        display:block;
        background: #ececec;
        border: 1px solid #e5e5e5;
        padding: 5px;
        margin: 5px;
    }
    .resource-listing a {
        font-size: 16px;
        line-height: 26px;
        text-decoration: none;
    }
    .resource-listing p {
        font-size: 12px;
        line-height: 14px;
    }
</style>

<div ng-app="resource-manager">
    <div ng-controller="ResourcesList">
        <div ng-repeat="resource in defaults">
            <div class="resource-listing">
                <a ng-click="selectResource(resource)">{{resource.ResourceName}}</a>
                <p>{{resource.ResourceDescription | truncate:300}}</p>
                <span><b>Type:</b> {{resource.ResourceType}}</span>
                <span><b>Topic:</b> {{resource.ResourceTopic}}</span>
                <span><b>Language:</b> {{resource.ResourceLanguage}}</span>
                <p><b>Uploaded:</b> {{resource.ResourceUploadDate}}</p>
            </div>
        </div>

        <input type="hidden" name="moduleId" ng-model="moduleId" value="<%= ModuleContext.ModuleId %>" value-setter />

    </div>
</div>
<asp:LinkButton runat="server" ID="lnkAdd" Text ="Add a resource" OnClick="lnkAdd_Click" />
