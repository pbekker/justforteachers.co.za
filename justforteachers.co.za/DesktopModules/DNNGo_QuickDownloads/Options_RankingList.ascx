<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="Options_RankingList.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Options_RankingList" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="asp" Namespace="DNNGo.Modules.QuickDownloads.WebControls" Assembly="DNNGo.Modules.QuickDownloads" %>
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
     <tr>
        <td class="SubHead" width="200" valign="top">
            <dnn:label id="lblRankingListType" runat="server" controlname="rblRankingListType" suffix=":">
            </dnn:label>
        </td>
        <td valign="bottom" align="left">
           <asp:RadioButtonList  ID="rblRankingListType"  runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="200" valign="top">
            <dnn:label id="lblTemplateFile" runat="server" controlname="ddlTemplateFile" suffix=":">
            </dnn:label>
        </td>
        <td valign="bottom" align="left">
           <asp:DropDownList runat="server" ID="ddlTemplateFile"></asp:DropDownList>
        </td>
    </tr>

     <tr>
        <td class="SubHead" width="200" valign="top">
            <dnn:label id="lblCategories" runat="server" controlname="ddlCategories" suffix=":">
            </dnn:label>
        </td>
        <td valign="bottom" align="left">
            <asp:CustDropDownList ID="ddlCategories"  runat="server" Width="60%">  </asp:CustDropDownList>
        </td>
    </tr>

</table>
 
<p style="text-align: center;">
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" resourcekey="cmdUpdate" runat="server"
        BorderStyle="none" Text="Update" OnClick="cmdUpdate_Click"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
        BorderStyle="none" Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:LinkButton>&nbsp;
</p>