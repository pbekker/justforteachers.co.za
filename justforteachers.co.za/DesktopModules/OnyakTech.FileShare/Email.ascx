<%@ Control Language="c#" CodeBehind="Email.ascx.cs" Inherits="OnyakTech.FileShare.Email"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false"
    EnableViewState="true" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<style type="text/css">
    .style1
    {
        height: 28px;
    }
</style>
<script type="text/javascript">

    //This code is used to provide a reference to the RadWindow "wrapper"
    function GetRadWindow() {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz az well)
        return oWindow;
    }

    function CloseOnReload() {
        GetRadWindow().Close();
    }

    function RefreshParentPage() {
        GetRadWindow().BrowserWindow.location.reload();
    }

    function RedirectCheckOut(strURL) {
        GetRadWindow().BrowserWindow.location.href = strURL;
    }                
</script>
<asp:Label ID="lblError" ForeColor="red" EnableViewState="false" CssClass="Normal"
    runat="Server"></asp:Label>
<table id="Table1" cellspacing="1" cellpadding="1" border="0">
    <tr>
        <td>
            <asp:Label ID="lblYourName" resourcekey="lblYourName" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtYourName" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="NormalRed"
                ErrorMessage="*" ControlToValidate="txtYourName"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="lblYourEmail" resourcekey="lblYourEmail" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="NormalRed"
                ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="*Invalid Email" ValidationExpression="^(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*[,;]?\b)*$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="lblEmail" resourcekey="lblEmail" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtSendTo" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtSendTo"
                CssClass="NormalRed" ErrorMessage="*"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSendTo"
                ErrorMessage="*Invalid Email" ValidationExpression="^(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*[,;]?\b)*$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="lblEmailSubject" resourcekey="lblEmailSubject" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtSubject" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="NormalRed"
                ErrorMessage="*" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="lblMessage" resourcekey="lblMessage" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="Normal">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="2" class="Normal">
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="368px" Height="90px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtMessage"
                CssClass="NormalRed" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: right" class="Normal">
            <asp:ImageButton ID="lnkCancel" runat="server" CausesValidation="False" />
            &nbsp;&nbsp;
            <asp:ImageButton ID="lnkEmailImages" runat="server" />
        </td>
    </tr>
</table>
<asp:CheckBox ID="chkSendCopyToMe" runat="server" Text="Send copy of email to me" />
