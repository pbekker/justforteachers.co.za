<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Options_Tags.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Options_Tags" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<dnn:sectionhead id="dshSettings" cssclass="Head" runat="server" section="tbSettings"
    resourcekey="dshSettings" includerule="True" />
<table id="tbSettings" runat="Server" cellspacing="0" cellpadding="2" border="0" width="100%"
    summary="ModuleName1 Settings Design Table">
    <tr>
        <td class="SubHead" width="200" valign="top">
            <dnn:label id="lblDisplayNumber" runat="server" controlname="txtDisplayNumber" suffix=":">
            </dnn:label>
        </td>
        <td valign="bottom" align="left">
            <asp:TextBox runat="server" ID="txtDisplayNumber" Width="100px" CssClass="NormalTextBox :required :number"></asp:TextBox>
        </td>
    </tr>
</table>
 
<p style="text-align: center;">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" resourcekey="cmdUpdate" runat="server"
        BorderStyle="none" Text="Update" OnClick="cmdUpdate_Click"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
        BorderStyle="none" Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:LinkButton>&nbsp;
</p>