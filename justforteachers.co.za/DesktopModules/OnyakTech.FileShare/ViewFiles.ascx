<%@ Control Language="c#" CodeBehind="ViewFiles.ascx.cs" Inherits="OnyakTech.FileShare.ViewFiles"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="FileShare" TagName="FileGrid" Src="~/DeskTopModules/OnyakTech.FileShare/DisplayGrid.ascx" %>
<asp:LinkButton ID="lnkSubmitFile" runat="server" resourcekey="lnkSubmitFile"></asp:LinkButton>
&nbsp; &nbsp; &nbsp;&nbsp;
<asp:LinkButton ID="lnkViewPendingApproval" runat="server" resourcekey="lnkViewPendingApproval"></asp:LinkButton>
<asp:LinkButton ID="lnkViewHome" runat="server" resourcekey="lnkViewHome"></asp:LinkButton>
&nbsp; &nbsp; &nbsp;&nbsp;
<asp:LinkButton ID="lnkDownloadLog" runat="server" resourcekey="lnkDownloadLog"></asp:LinkButton><br />
<table border="0" id="tblViewFiles" runat="server" cellpadding="4" cellspacing="4">
    <tr id="tblRowFileCategory" runat="server">
        <td class="Normal" valign="top">&nbsp;
        </td>
        <td class="Normal">
            <asp:RadioButtonList ID="rdlstCategories" runat="server" AutoPostBack="True" CssClass="Normal"
                RepeatDirection="Horizontal" RepeatColumns="5">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="Normal" valign="top">
            <telerik:radtreeview id="chkCategory" runat="server" checkboxes="False" multipleselect="False"
                sort="Ascending">
            </telerik:radtreeview>
            <br />
            <asp:Literal ID="ltlLastComments" runat="server"></asp:Literal>
        </td>
        <td class="Normal">
            <telerik:radtextbox id="txtSearch" runat="server" emptymessage="Type Key Words To Search Files"
                selectiononfocus="SelectAll" skin="Outlook" width="200px">
            </telerik:radtextbox>
            <asp:LinkButton ID="lnkSearch" resourcekey="lnkSearch" CssClass="CommandButton" CausesValidation="False"
                BorderStyle="none" runat="server"></asp:LinkButton><br />
            <table border="0" id="tblSubscribe" runat="server" cellpadding="0" cellspacing="0">
                <tr id="Tr1" runat="server">
                    <td class="Normal" valign="top">
                        <asp:Image ID="imgSubscribe" runat="server" ToolTip="Subscribe to get email notifications about new Files!" />
                        <asp:CheckBox ID="chkSubscribe" resourcekey="chkSubscribe" runat="server" AutoPostBack="True" />
                        <asp:Label ID="lblSubscribeInfo" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblLogIn" runat="server"></asp:Label>
            <!-- File Share Templated List -->
            <asp:DataList ID="dlsFiles" DataKeyField="FileId" CssClass="Normal" runat="server">
                <ItemTemplate>
                    <%# DataBinder.Eval(Container.DataItem, "ListHTML") %>
                </ItemTemplate>
                <SeparatorTemplate>
                </SeparatorTemplate>
            </asp:DataList>
            <!-- End File Share Templated List -->
            <!-- File Share Data Grid -->
            <FileShare:FileGrid id="grdFiles" Runat="Server"></FileShare:FileGrid>
            <br />
            <asp:LinkButton runat="server" ID="lnkToggleViewMode" resourcekey="chkToggleViewMode"  AutoPostBack="True" />
            <!-- End File Share Data Grid -->
            <br />
            <br />
            <asp:Label ID="lblInfo" runat="server"></asp:Label>
            <asp:LinkButton ID="btnFirst" runat="server" resourcekey="btnFirst"></asp:LinkButton>
            <asp:LinkButton ID="btnPrev" Text="Prev" runat="server" resourcekey="btnPrev" />
            <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
            <asp:LinkButton ID="btnNext" runat="server" resourcekey="btnNext" />
            <asp:LinkButton ID="btnLast" runat="server" resourcekey="btnLast"></asp:LinkButton>
        </td>
    </tr>
</table>
<table cellpadding="3" cellspacing="3" border="0">
    <tr>
        <td class="Normal" valign="middle" align="right" width="32px">
            <asp:ImageButton ID="imgFileShareRSS" runat="server" />
        </td>
        <td>
            <asp:LinkButton ID="lnkRSS" runat="server" resourcekey="lnkRSS"></asp:LinkButton>
        </td>
        <td class="Normal" valign="middle" align="right" width="32px">
            <asp:ImageButton ID="imgBundleOptions" runat="server" />
        </td>
        <td>
            <asp:LinkButton ID="lnkMyBundle" runat="server" resourcekey="lnkMyBundle"></asp:LinkButton>
        </td>
        <td class="Normal" valign="middle" align="right" width="32px">
            <asp:ImageButton ID="imgAdvancedSearch" runat="server" />
        </td>
        <td>
            <asp:LinkButton ID="lnkAdvancedSearch" runat="server" resourcekey="lnkAdvancedSearch"></asp:LinkButton>
        </td>
    </tr>
</table>
