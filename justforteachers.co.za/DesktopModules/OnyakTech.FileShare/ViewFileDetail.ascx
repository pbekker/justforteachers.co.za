<%@ Control Language="c#" CodeBehind="ViewFileDetail.ascx.cs" Inherits="OnyakTech.FileShare.ViewFileDetail"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table border="0" cellpadding="2" cellspacing="2">
    <tr>
        <td class="Normal">
            <asp:ImageButton ID="imgRankDown" runat="server" />&nbsp;
            <asp:ImageButton ID="imgRankUp" runat="server" />
        </td>
        <td class="Normal">
            <asp:Label ID="lblRating" runat="server" CssClass="Normal"></asp:Label>
        </td>
    </tr>
</table>
<table id="tblComments" runat="server" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="Normal">
            <asp:Literal ID="ltlFile" runat="server"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Literal ID="ltlFileAttributes" runat="server"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td bgcolor="#FAFAFA" >
            <table style="border-bottom: thin; border-bottom-color: #B9CEEB; border-top-style: solid;
                border-bottom-style: solid; border-top-width: 1px; border-bottom-width: 1px;
                border-top-color: #B9CEEB;" width="540px">
                <tr align="left">
                    <td class="Normal" valign="middle" align="right" width="32px">
                        <asp:Image ID="imgComments" runat="server" ToolTip="Comments" />
                    </td>
                    <td align="left">
                        <asp:Label ID="lblComments" runat="server" resourcekey="lblComments" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="Normal" bgcolor="#FAFAFA">
            <asp:Literal ID="ltlComments" runat="server"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <telerik:radtextbox id="txtAddComments" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="450px" height="50px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:LinkButton ID="lnkAddComments" runat="server" resourcekey="lnkAddComments"></asp:LinkButton>
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td class="Normal" bgcolor="#EFEFEF" >
            <table style="border-bottom: thin; border-top-style: solid; border-top-width: 1px;
                border-top-color: #B9CEEB; border-bottom-style: solid; border-bottom-width: 1px;
                border-bottom-color: #B9CEEB;" width="440px" id="tblDownloadFiles" runat="server">
                <tr align="left">
                    <td class="Normal" valign="middle" align="right" width="32px">
                        <asp:Image ID="imgDownloadFile" runat="server" ToolTip="Download" />
                    </td>
                    <td align="left">
                        <asp:Literal ID="lnkDownloadFile" runat="server"></asp:Literal>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table cellpadding="3" cellspacing="3" border="0">
    <tr>
        <td class="Normal" valign="middle" align="right" width="32px">
            <asp:ImageButton ID="imgCancel" runat="server" />
        </td>
        <td>
            <asp:LinkButton ID="lnkCancel" runat="server" resourcekey="lnkCancel"></asp:LinkButton>
        </td>
        <td class="Normal" valign="middle" align="right" width="32px">
            <asp:ImageButton ID="imgAddToOrder" runat="server" />
        </td>
        <td>
            <asp:LinkButton ID="lnkAddToOrder" runat="server" resourcekey="lnkAddToOrder"></asp:LinkButton>
            <asp:Label ID="lblAddToOrderInfo" runat="server" CssClass="Normal"></asp:Label>
        </td>
        <td class="Normal" valign="middle" align="right" width="32px">
            <asp:ImageButton ID="imgBundleOptions" runat="server" />
        </td>
        <td>
            <asp:LinkButton ID="lnkMyBundle" runat="server" resourcekey="lnkMyBundle"></asp:LinkButton>
            <asp:Label ID="lblBundleOptions" runat="server" CssClass="Normal"></asp:Label>
        </td>
    </tr>
</table>
