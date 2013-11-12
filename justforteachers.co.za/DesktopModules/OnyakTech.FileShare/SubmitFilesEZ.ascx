<%@ Control Language="c#" CodeBehind="SubmitFilesEZ.ascx.cs" Inherits="OnyakTech.FileShare.SubmitFilesEZ"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="Normal">
            <dnn:label id="lblTitle" runat="server" controlname="lblTitle" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <asp:TextBox ID="txtTitle" runat="server" Width="247px"></asp:TextBox>            
            <asp:Label ID="lblTitleInfo" runat="server" CssClass="Normal"></asp:Label>
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
        <asp:TextBox ID="txtSummary" runat="server" Width="248px"></asp:TextBox>           
            
            <asp:Label ID="lblSummaryInfo" runat="server" CssClass="Normal"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                ControlToValidate="txtSummary"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblCategories" runat="server" controlname="lblCategories" suffix=":">
            </dnn:label>
        </td>
        <td class="Normal">
            <telerik:radtreeview id="chkCategory" runat="server" checkboxes="False" multipleselect="False"
                sort="Ascending">
            </telerik:radtreeview>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="chkCategory"
                ErrorMessage="Please select a category for this File" />
            <br />
            <asp:Label ID="lblCatInfo" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="Normal">
        </td>
        <td class="Normal">
            <table border="0" id="tblFileUpload" runat="server" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="Normal" valign="top">
                        <input id="txtFilePath" type="file" name="txtFilePath" runat="server">
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
<asp:LinkButton ID="lnkSubmitFile" runat="server" resourcekey="lnkSubmitFile"></asp:LinkButton>
&nbsp;
<asp:LinkButton ID="lnkUpdate" runat="server" resourcekey="lnkUpdate"></asp:LinkButton>&nbsp;
&nbsp;<asp:LinkButton ID="lnkApprove" runat="server" resourcekey="lnkApprove"></asp:LinkButton>
&nbsp;<asp:LinkButton ID="lnkDelete" runat="server" resourcekey="lnkDelete" CausesValidation="False"></asp:LinkButton>
&nbsp;
<asp:LinkButton ID="lnkCancel" runat="server" resourcekey="lnkCancel" CausesValidation="false"></asp:LinkButton>
