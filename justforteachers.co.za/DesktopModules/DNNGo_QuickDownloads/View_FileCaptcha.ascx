<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View_FileCaptcha.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.View_FileCaptcha" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" width="100%" summary="ModuleName1 Settings Design Table">
     <!-- 是否需要输入验证码后下载 -->
    <tr>
        <td class="SubHead" valign="top" style="width: 100px;">
            <dnn:label id="lblDisplayCaptcha" runat="server" controlname="cbDisplayCaptcha" suffix=":"></dnn:label>
        </td>
        <td valign="top" align="left" >
            <dnn:CaptchaControl ID="ctlCaptcha" CaptchaWidth="150px" CaptchaHeight="30" CaptchaLength="4"
                CssClass="Normal" runat="server" ErrorStyle-CssClass="NormalRed" />
            <asp:LinkButton ID="btnRF5" runat="server" CssClass="Normal" resourcekey="ChangeCaptcha"
                OnClick="btnF5_Click"></asp:LinkButton>
        </td>
    </tr>   
</table>

<p>
    <asp:LinkButton CssClass="" ID="cmdDownLoad" resourcekey="cmdDownLoad" runat="server"
        BorderStyle="none" Text="DonwLoad" OnClick="cmdDonwLoad_Click"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
        BorderStyle="none" Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:LinkButton>&nbsp;
   
</p>
