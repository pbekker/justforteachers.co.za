<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceListings.ascx.cs" Inherits="Blackhouse.Resources.ResourceListings" %>

<style>
div.box {
    float:left;
    width:223px;
    padding: 5px;
    border: 2px solid #FAFAFA;
    margin: 2px;
	box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
}

div.box h3 {
    font-size: 24px;
    line-height: 26px;
    margin: 0;
}
div.box h3 a:link, div.box h3 a:hover {
    text-decoration:none;
}
div.box p {
    line-height: 14px;
    font-size: 12px;
    overflow: hidden;
    height: 28px;
	color: #333;
	margin: 0;
    margin-bottom: 4px;
}

div:hover .box:not(:hover) {
    opacity: 0.4;
}

</style>

<asp:Repeater runat="server" ID="rptListings" OnItemCommand="rptListings_ItemCommand">
    <ItemTemplate>
        <div class="box">
            <h3><asp:LinkButton runat="server" ID="lblResourceName" Text='<%#Eval("ResourceName") %>' CommandArgument='<%#Eval("ResourceId") %>' /></h3>
            <p><asp:Label runat="server" ID="lblResourceDescription" Text='<%#Eval("ResourceDescription") %>' /></p>
            <span><b>Type:</b> <asp:Label runat="server" ID="ResourceType" Text='<%#Eval("ResourceType") %>' /></span><br />
            <span><b>Topic:</b> <asp:Label runat="server" ID="ResourceTopic" Text='<%#Eval("ResourceTopic") %>' /></span><br />
            <span><b>Language:</b> <asp:Label runat="server" ID="ResourceLanguage" Text='<%#Eval("ResourceLanguage") %>' /></span><br />
            <p><b>Uploaded:</b> <asp:Label runat="server" ID="ResourceUploadDate" Text='<%#Eval("ResourceUploadDate") %>' /></p>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:LinkButton runat="server" ID="lnkAdd" Text ="Add a resource" OnClick="lnkAdd_Click" />
