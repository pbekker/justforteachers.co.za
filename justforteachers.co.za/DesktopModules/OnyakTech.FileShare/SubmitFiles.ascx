<%@ Control Language="c#" CodeBehind="SubmitFiles.ascx.cs" Inherits="OnyakTech.FileShare.SubmitFiles"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<script type="text/javascript">
    function TogglePopupCal() {
        // <%# dateExpires.ClientID %>.ShowPopup();
    }
</script>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="Normal">
            <dnn:label id="lblTitle" runat="server" controlname="lblTitle" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <telerik:RadTextBox ID="txtTitle" runat="server" EmptyMessage="Enter a title for your file"
                SelectionOnFocus="SelectAll" skin="ONYAKTECH" EnableEmbeddedSkins="false"   Width="328px">
            </telerik:RadTextBox><asp:Label ID="lblTitleInfo" runat="server" CssClass="Normal"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblSummary" runat="server" controlname="lblSummary" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <dnn:texteditor id="txtSummary" runat="server" width="660" height="300" EnableViewState="False">
            </dnn:texteditor><asp:Label ID="lblSummaryInfo" runat="server" CssClass="Normal"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                ControlToValidate="txtSummary"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblBody" runat="server" controlname="lblBody" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <dnn:texteditor id="txtBody" runat="server" width="660" height="300" EnableViewState="False">
            </dnn:texteditor>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                ControlToValidate="txtBody"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblKeyWords" runat="server" controlname="lblKeyWords" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <telerik:radtextbox id="txtKeyWords" runat="server" emptymessage="Type key words specific to this category"
                height="60px" selectiononfocus="SelectAll" skin="ONYAKTECH" EnableEmbeddedSkins="false"  TextMode="MultiLine" CssClass="Normal"
                width="350px">
            </telerik:radtextbox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                ControlToValidate="txtKeyWords" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblPublishedDate" runat="server" controlname="lblPublishedDate" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <dnn:DnnDatePicker ID="datePublished" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblArchiveDate" runat="server" controlname="lblArchiveDate" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <dnn:DnnDatePicker ID="dateExpires" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblAddUsersSection" runat="server" controlname="lblAddUsersSection"
                suffix=":">
            </dnn:label>
        </td>    
        <td>
            <telerik:radtextbox id="txtUserName" runat="server" EmptyMessage="Type User Name Here" SelectionOnFocus="SelectAll"  >
            </telerik:radtextbox>
            <asp:LinkButton ID="lnkAddUser" resourcekey="lnkAddUser" CssClass="CommandButton"
                BorderStyle="none" runat="server"></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkClearUsers" resourcekey="lnkClearUsers" CssClass="CommandButton"
                BorderStyle="none" runat="server"></asp:LinkButton>
            <br />
            <asp:Label ID="lblUsersCurrentlyAuthorized" runat="server" CssClass="Normal"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblRoles" runat="server" controlname="lblRoles" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <telerik:radtreeview id="chkPortalRoles" runat="server" checkboxes="True" multipleselect="True" sort="Ascending">
            </telerik:radtreeview>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblPortals" runat="server" controlname="lblPortals" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <telerik:radtreeview id="chkPortals" runat="server" checkboxes="True" multipleselect="False"   sort="Ascending">
            </telerik:radtreeview>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblCategories" runat="server" controlname="lblCategories" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <asp:DropDownList ID="ddCategory" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="Normal">
        </td>
        <td class="Normal">
            <table border="0" id="tblFileUpload" runat="server" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="Normal" valign="top">
                        <input id="txtFilePath" type="file" name="txtFilePath" runat="server" />
                        <asp:Button ID="btnAddfile" resourcekey="Upload" runat="server" CssClass="CommandButton">
                        </asp:Button>
                        <asp:Label ID="lblUploadError" runat="server" ForeColor="Red" Font-Names="Verdana"
                            Font-Size="X-Small"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal" bgcolor="#EFEFEF" align="center">
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
        </td>
    </tr>
    <tr>
        <td class="Normal">
        </td>
        <td class="Normal">
            <asp:CheckBox ID="chkPremium" runat="server" Checked="False" resourcekey="chkPremium" />
        </td>
    </tr>
</table>
<br />
<asp:LinkButton ID="lnkSubmitFile" runat="server" resourcekey="lnkSubmitFile"></asp:LinkButton>&nbsp;
<asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="lnkUpdate"></asp:LinkButton>&nbsp;&nbsp;
<asp:LinkButton ID="lnkSetAttributes" runat="server" resourcekey="lnkSetAttributes"></asp:LinkButton>&nbsp;&nbsp;
<asp:LinkButton ID="lnkApprove" runat="server" resourcekey="lnkApprove"></asp:LinkButton>&nbsp;
<asp:LinkButton ID="lnkDelete" runat="server" resourcekey="lnkDelete" CausesValidation="False"></asp:LinkButton>&nbsp;
<asp:LinkButton ID="lnkCancel" runat="server" resourcekey="lnkCancel" CausesValidation="false"></asp:LinkButton>
