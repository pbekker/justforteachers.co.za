<%@ Control Language="c#" CodeBehind="FilesAttributes.ascx.cs" Inherits="OnyakTech.FileShare.FilesAttributes"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="SubHead">
            <asp:Label ID="lblTitle" runat="server" CssClass="SubHead"></asp:Label>
            <br /><br />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <telerik:radtreeview id="chkPortalRoles" runat="server" checkboxes="True" multipleselect="True"
                sort="Ascending">
            </telerik:radtreeview>
            <br /><br />
        </td>
    </tr>
    <tr>
        <td>
            <dnn:label id="lblAuthorizedUsers" runat="server" controlname="lblAuthorizedUsers"
                suffix=":">
            </dnn:label>
            <telerik:radtextbox id="txtUserName" runat="server" selectiononfocus="SelectAll"
                skin="Outlook" width="250px">
            </telerik:radtextbox>            
            <asp:Label ID="lblUsersCurrentlyAuthorized" runat="server" CssClass="Normal"></asp:Label>            
        </td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton ID="lnkAddUser" resourcekey="lnkAddUser" CssClass="CommandButton"
                BorderStyle="none" runat="server"></asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lnkClearUsers" resourcekey="lnkClearUsers" CssClass="CommandButton"
                BorderStyle="none" runat="server"></asp:LinkButton>
        </td>
    </tr>
</table>
<br /><br />
<asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="lnkUpdate" ></asp:LinkButton>&nbsp;
<asp:LinkButton ID="lnkCancel" runat="server" resourcekey="lnkCancel" CausesValidation="false"></asp:LinkButton>
