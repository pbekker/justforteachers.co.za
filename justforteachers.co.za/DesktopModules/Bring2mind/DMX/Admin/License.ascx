<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="License.ascx.vb" Inherits="Bring2mind.DNN.Modules.DMX.Controls.Admin.License" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<h1><%=DotNetNuke.Services.Localization.Localization.GetString("ControlTitle", LocalResourceFile)%></h1>
<p class="Normal"><%=DotNetNuke.Services.Localization.Localization.GetString("ControlHelp", LocalResourceFile)%></p>

<table width="100%" cellspacing="4" cellpadding="0" border="0">
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plStatus" runat="server" controlname="chkTrialLicense" suffix=":" />
  </td>
  <td class="Normal">
   <%=(New Bring2mind.DNN.Modules.DMX.Services.Licensing.License()).Status.Replace(vbCrLf, "<br />")%>
  </td>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plTrialLicense" runat="server" controlname="chkTrialLicense" suffix=":" />
  </td>
  <td>
   <asp:checkbox id="chkTrialLicense" runat="server" AutoPostBack="true" />
  </td>
 </tr>
</table>
<table width="100%" cellspacing="4" cellpadding="0" border="0" runat="server" id="tblAccount">
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plAccount" runat="server" controlname="txtAccount" suffix=":" />
  </td>
  <td>
   <asp:textbox runat="server" id="txtAccount" Width="300" />
  </td>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plInvoice" runat="server" controlname="txtInvoice" suffix=":" />
  </td>
  <td>
   <asp:textbox runat="server" id="txtInvoice" Width="300" />
  </td>
 </tr>
</table>

<p class="NormalRed"><asp:Label runat="server" ID="lblCheckLicense" resourcekey="lblCheckLicense" /></p>

<p style="width:100%;text-align:center">
 <asp:Button runat="server" ID="cmdManual" resourcekey="cmdManual" class="dnnSecondaryAction" />
</p>
<p>
<asp:Panel runat="server" ID="pnlTrialLicenseRequest">
 <input id="btnRequestActivation" value="<%=DotNetNuke.Services.Localization.Localization.GetString("btnRequestActivation", LocalResourceFile)%>" type="button" onclick="javascript:cbCommand.Callback('RequestActivationWebservice', '', 'TRIAL');" class="dnnSecondaryAction" />&nbsp;
 <input id="btnRequestActivationWeb" value="<%=DotNetNuke.Services.Localization.Localization.GetString("btnRequestActivationWeb", LocalResourceFile)%>" type="button" onclick="javascript:cbCommand.Callback('RequestActivationWeb',  '', 'TRIAL');" class="dnnSecondaryAction" />&nbsp;
</asp:Panel>
<asp:Panel runat="server" ID="pnlRegularLicenseRequest">
 <input id="Button1" value="<%=DotNetNuke.Services.Localization.Localization.GetString("btnRequestActivation", LocalResourceFile)%>" type="button" onclick="javascript:cbCommand.Callback('RequestActivationWebservice', document.getElementById('<%=txtAccount.ClientID%>').value, document.getElementById('<%=txtInvoice.ClientID%>').value);" class="dnnSecondaryAction" />&nbsp;
 <input id="Button2" value="<%=DotNetNuke.Services.Localization.Localization.GetString("btnRequestActivationWeb", LocalResourceFile)%>" type="button" onclick="javascript:cbCommand.Callback('RequestActivationWeb', document.getElementById('<%=txtAccount.ClientID%>').value, document.getElementById('<%=txtInvoice.ClientID%>').value);" class="dnnSecondaryAction" />&nbsp;
</asp:Panel>
</p>

<p class="NormalRed">
 <ComponentArt:Callback runat="server" ID="cbCommand" />
</p>

<p style="width:100%;text-align:center">
 <asp:linkbutton id="cmdReturn" runat="server" CssClass="dnnPrimaryAction" borderstyle="none" text="Return" resourcekey="cmdReturn" />
</p>
