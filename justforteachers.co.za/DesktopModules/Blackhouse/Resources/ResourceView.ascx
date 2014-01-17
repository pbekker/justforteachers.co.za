<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceView.ascx.cs" Inherits="Blackhouse.Resources.ResourceView" %>

<asp:HiddenField runat="server" ID="hidResourceId" />
<h3><asp:Label runat="server" ID="lblResourceName" Style="width:90%" /><span runat="server" id="spanRating" style="float:right">[Rating Info]</span></h3>
<p><asp:Image runat="server" ID="imgPreviewImage" /><asp:Label runat="server" ID="lblResourceDescription" /></p>
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

<div id="divApproval" runat="server" style="visibility:hidden;">
    <div><asp:CheckBox runat="server" ID="chkApprove" Text="Approved" Checked="true" /></div>
    <div><asp:LinkButton runat="server" ID="cmdApprove" Text="Confirm Approval" OnClick="cmdApprove_Click" /></div>
</div>

