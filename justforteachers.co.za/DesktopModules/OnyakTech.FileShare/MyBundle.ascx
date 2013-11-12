<%@ Control Language="c#" CodeBehind="MyBundle.ascx.cs" Inherits="OnyakTech.FileShare.MyBundle"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false"
    EnableViewState="true" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table align="left" cellpadding="0" cellspacing="0" border="0" id="tblMasterCheckOut"
    runat="server">
    <tr>
        <td class="Normal" valign="top">
            <asp:Label ID="lblTemplateCheckOutTop" runat="server" CssClass="Normal"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="Head" valign="top">
        <table >
                <tr align="left" valign="middle">
                    <td class="Head" >
                        <asp:Image ID="imgBundle" runat="server" />
                    </td>
                    <td class="Head" align="left" valign="middle">
                        <asp:Label ID="lblMySelectedFiles" runat="server" CssClass="Head" resourcekey="lblMySelectedFiles"></asp:Label>
                    </td>
                </tr>
            </table>      
            <hr />
        </td>
    </tr>
    <tr>
        <td valign="top" class="Normal" align="left" >
            <asp:DataList ID="dlsMyLibrary" runat="server" DataKeyField="EntryId" RepeatDirection="Horizontal"
                RepeatColumns="1">
                <ItemStyle CssClass="DAMSubFileList" />
                <ItemTemplate>
                    <asp:HiddenField ID="hdnEntryId" runat="server" Value='<%# Eval("EntryId") %>' />
                    <asp:CheckBox ID="chkFileSelect" runat="server" Visible="false" />
                    <%# DataBinder.Eval(Container.DataItem, "ListHTML") %>
                </ItemTemplate>
            </asp:DataList>
            <asp:LinkButton ID="btnFirst" runat="server">First</asp:LinkButton>
            <asp:LinkButton ID="btnPrev" Text="Prev" runat="server" />
            <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
            <asp:LinkButton ID="btnNext" Text="Next" runat="server" />
            <asp:LinkButton ID="btnLast" runat="server">Last</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="lblInfo" runat="server" CssClass="Normal" ForeColor="#CC0000"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="Normal" valign="top">
            <br />
            <asp:LinkButton ID="lnkRemoveSelected" resourcekey="lnkRemoveSelected" runat="server"
                CssClass="CommandButton" Visible="false"></asp:LinkButton>
            &nbsp;
            <asp:LinkButton ID="lnkContinueShopping" resourcekey="lnkContinueShopping" runat="server"
                CssClass="CommandButton" Visible="False"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="Normal" align="center">
            <asp:Label ID="lblDoneChoose" resourcekey="lblDoneChoose" runat="server" CssClass="h1"
                Visible="False"></asp:Label><br />
            <table cellpadding="3" cellspacing="3" border="0">
                <tr>
                    <td class="Normal" valign="middle" align="right" width="32px">
                        <asp:ImageButton ID="lnkCancel" runat="server" />
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkCancelText" resourcekey="lnkCancelText" runat="server" CssClass="CommandButton"></asp:LinkButton>
                    </td>
                    <td class="Normal" valign="middle" align="right" width="32px">
                        <asp:ImageButton ID="lnkCheckOutDownload" runat="server" />
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkDownloadAllFiles" resourcekey="lnkDownloadAllFiles" runat="server" CssClass="CommandButton"></asp:LinkButton>
                    </td>
                    <td class="Normal" valign="middle" align="right" width="32px">
                        <asp:ImageButton ID="lnkCheckOutEmail" runat="server" />
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkEmailFiles" resourcekey="lnkEmailFiles" runat="server" CssClass="CommandButton"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>    
    <tr>
        <td>
            <asp:Label ID="lblTemplateCheckOutBottom" runat="server" CssClass="Normal"></asp:Label>
        </td>
    </tr>
</table>
