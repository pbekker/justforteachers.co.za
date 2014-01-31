<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceListings.ascx.cs" Inherits="Blackhouse.Resources.ResourceListings" %>

<style>
div.box {
    float:left;
    width:239px;
    padding: 5px;
    border: 2px solid #FAFAFA;
    margin: 2px;
	box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
    display: inline-block;
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
        .box1 {
          padding: 10px 20px;
          display: inline-block;
          border: 1px solid #E5E5E5;
          text-decoration: none;
          border-radius: 4px;
          background: #ECECEC;
          -webkit-transition: all 0.15s ease-out;
          -moz-transition: all 0.15s ease-out;
          transition: all 0.15s ease-out;
          width: 100%;
        }

    .box2 {
          padding: 5px;
          text-align: right;
          display: inline-block;
          border: 1px solid #E5E5E5;
          text-decoration: none;
          border-radius: 4px;
          background: #fff;
          -webkit-transition: all 0.15s ease-out;
          -moz-transition: all 0.15s ease-out;
          transition: all 0.15s ease-out;
          width: 100%;
    }
        .box2 .resource-search {
            text-align: left;
            margin: 5px;
            width: 100%;
            border: 0;
            background: #f5f5f5;
            height: 56px;
            border-radius: 4px;
            -webkit-appearance: none;
            padding: 10px 15px;
            font-size: 14px;
        }

    .resource-text {
        width: 80%;
        border: 0;
        background: #f5f5f5;
        height: 36px;
        border-radius: 4px;
        -webkit-appearance: none;
        padding: 10px 15px;
        font-size: 14px;
    }
</style>

<asp:Repeater runat="server" ID="rptListings" OnItemCommand="rptListings_ItemCommand" OnItemDataBound="rptListings_ItemDataBound">
    <HeaderTemplate>
        <div class="box2">
            <p>sort: &nbsp; 
                <asp:LinkButton runat="server" ID="lnkName" CommandArgument="resourcename" Text="Name" /> |
                <asp:LinkButton runat="server" ID="lnkRating" CommandArgument="resourcerating" Text="Rating" /> |
                <asp:LinkButton runat="server" ID="lnkUploadDate" CommandArgument="resourceuploaddate" Text="Upload Date" /> 
            </p>
            <p>
                <div class="resource-search">
                    search: &nbsp;<asp:TextBox runat="server" ID="txtSearch" CssClass="resource-text" PlaceHolder="e.g. english, afrikaans" />&nbsp; <asp:LinkButton runat="server" ID="lnkSearch" CommandArgument="resourcesearch" Text="Search" />
                </div>
            </p>
        </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="box">
            <h3><asp:LinkButton runat="server" ID="lblResourceName" Text='<%#Eval("ResourceName") %>' CommandArgument='<%#Eval("ResourceId") %>' /></h3>
            <p><asp:Image runat="server" ID="imgPreviewImage" /></p>
            <span><b>Type:</b> <asp:Label runat="server" ID="ResourceType" Text='<%#Eval("ResourceType") %>' /></span><br />
            <span><b>Topic:</b> <asp:Label runat="server" ID="ResourceTopic" Text='<%#Eval("ResourceTopic") %>' /></span><br />
            <span><b>Language:</b> <asp:Label runat="server" ID="ResourceLanguage" Text='<%#Eval("ResourceLanguage") %>' /></span><br />
            <p><b>Uploaded:</b> <asp:Label runat="server" ID="ResourceUploadDate" Text='<%#Eval("ResourceUploadDate") %>' /></p>
        </div>
    </ItemTemplate>
</asp:Repeater>
<div style="clear:both; width: 100%;">
    <br />
</div>

<!-- put pager here -->
<div class="box1" style="clear:both; width: 100%; text-align:center;">
<asp:Label runat="server" ID="PaginationLabel"/>
</div>
<!-- end pager -->

<div style="clear:both;">
    <asp:LinkButton runat="server" CssClass="text" ID="lnkAdd" Text ="Add a resource" OnClick="lnkAdd_Click" />
</div>
