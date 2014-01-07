<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceView.ascx.cs" Inherits="Blackhouse.Resources.ResourceView" %>

<h3><asp:Label runat="server" ID="lblResourceName" /></h3>
<p><asp:Label runat="server" ID="lblResourceDescription" /></p>
<span><b>Type:</b> <asp:Label runat="server" ID="ResourceType" /></span><br />
<span><b>Topic:</b> <asp:Label runat="server" ID="ResourceTopic" /></span><br />
<span><b>Language:</b> <asp:Label runat="server" ID="ResourceLanguage" /></span><br />
<p><b>Uploaded:</b> <asp:Label runat="server" ID="ResourceUploadDate" /></p>

<h3><asp:Label runat="server" ID="lblFiles" /></h3>
<asp:Repeater runat="server" ID="rptFiles" OnItemCommand="rptFiles_ItemCommand">
    <ItemTemplate>
        <span><b>File Name: </b><asp:Label runat="server" ID="lblFileName" Text='<%#Eval("FileName") %>' /></span><br />
        <span><b>File Size: </b><asp:Label runat="server" ID="lblFileSize" Text='<%#Eval("FileSize") %>' /></span><br />
        <span><b>File Content Type: </b><asp:Label runat="server" ID="lblFileContentType" Text='<%#Eval("FileContentType") %>' /></span><br />
        <p><b>Download:</b> <asp:LinkButton runat="server" ID="lnkDownload" Text="Download This File" CommandArgument='<%#Eval("FileId") %>' /></p>
    </ItemTemplate>
</asp:Repeater>

<h3><asp:Label runat="server" ID="lblWebsiteLinks" /></h3>
<asp:Repeater runat="server" ID="rptWebsites">
    <ItemTemplate>
        <span><b>Go See: </b><asp:HyperLink runat="server" ID="lblFileName" Text='<%#Eval("resourceURL") %>' NavigateUrl='<%#Eval("resourceURL") %>' /></span><br />
    </ItemTemplate>
</asp:Repeater>

<%--<script src="/DesktopModules/Blackhouse/js/admin.js"></script>

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
</div>--%>