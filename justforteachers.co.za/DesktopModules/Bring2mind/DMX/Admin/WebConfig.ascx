<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="WebConfig.ascx.vb" Inherits="Bring2mind.DNN.Modules.DMX.Admin.WebConfig" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<style>
td.DMX_EditTitle
{
 white-space: nowrap;
 padding-right: 20px;
}
</style>

<asp:label runat="server" id="lblNoteHost" resourcekey="lblNoteHost" cssclass="NormalRed" />
<table cellspacing="4" cellpadding="0" border="0">
 <tr>
  <th><asp:Label runat="server" ID="lblAspect" resourcekey="lblAspect" CssClass="SubHead" /></th>
  <th colspan="2">
   <dnn:label id="plIIS6" runat="server" />
  </th>
  <th colspan="2">
   <dnn:label id="plIIS7" runat="server" />
  </th>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plWebDAV" runat="server" controlname="cmdAddWebDAV" suffix=":" />
  </td>
  <td class="Normal">
   <%=GetStatusString("WebDAV", 6)%>
  </td>
  <td class="Normal">
   <asp:Button runat="server" ID="cmdToggleWebDAVIIS6" resourcekey="cmdToggle" />&nbsp;
  </td>
  <td class="Normal">
   <%=GetStatusString("WebDAV", 7)%>
  </td>
  <td class="Normal">
   <asp:Button runat="server" ID="cmdToggleWebDAVIIS7" resourcekey="cmdToggle" />&nbsp;
  </td>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plTelerik" runat="server" controlname="cmdAddTelerik" suffix=":" />
  </td>
  <td class="Normal">
   <%=GetStatusString("Telerik", 6)%>
  </td>
  <td class="Normal">
   <asp:Button runat="server" ID="cmdToggleTelerikIIS6" resourcekey="cmdToggle" />&nbsp;
  </td>
  <td class="Normal">
   <%=GetStatusString("Telerik", 7)%>
  </td>
  <td class="Normal">
   <asp:Button runat="server" ID="cmdToggleTelerikIIS7" resourcekey="cmdToggle" />&nbsp;
  </td>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plCA" runat="server" controlname="cmdAddCA" suffix=":" />
  </td>
  <td class="Normal">
   <%=GetStatusString("CA", 6)%>
  </td>
  <td class="Normal">
   <asp:Button runat="server" ID="cmdToggleCAIIS6" resourcekey="cmdToggle" />&nbsp;
  </td>
  <td class="Normal">
   <%=GetStatusString("CA", 7)%>
  </td>
  <td class="Normal">
   <asp:Button runat="server" ID="cmdToggleCAIIS7" resourcekey="cmdToggle" />&nbsp;
  </td>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plMaxUpload" runat="server" controlname="txtMaxUpload" suffix=":" />
  </td>
  <td class="Normal" colspan="2">
   <asp:TextBox runat="server" ID="txtMaxUploadIIS6" Width="100" />&nbsp;
   <asp:comparevalidator id="Comparevalidator1" runat="server" controltovalidate="txtMaxUploadIIS6" display="Dynamic" errormessage="Not a valid (whole) number!" type="Integer" operator="DataTypeCheck" resourcekey="valWholeNumber" />
  </td>
  <td class="Normal" colspan="2">
   <asp:TextBox runat="server" ID="txtMaxUploadIIS7" Width="100" />&nbsp;
   <asp:comparevalidator id="Comparevalidator2" runat="server" controltovalidate="txtMaxUploadIIS7" display="Dynamic" errormessage="Not a valid (whole) number!" type="Integer" operator="DataTypeCheck" resourcekey="valWholeNumber" />
  </td>
 </tr>
 <tr>
  <td colspan="5">&nbsp;</td>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:label id="plExecutionTimeout" runat="server" controlname="txtExecutionTimeout" suffix=":" />
  </td>
  <td class="Normal" colspan="4">
   <asp:TextBox runat="server" ID="txtExecutionTimeout" Width="100" />&nbsp;
   <asp:comparevalidator id="valcompVersions" runat="server" controltovalidate="txtExecutionTimeout" display="Dynamic" errormessage="Not a valid (whole) number!" type="Integer" operator="DataTypeCheck" resourcekey="valWholeNumber" />
  </td>
 </tr>
</table>

<p>
 <asp:linkbutton id="cmdUpdate" runat="server" CssClass="dnnPrimaryAction" borderstyle="none" text="Update" resourcekey="cmdUpdate" />&nbsp; 
 <asp:hyperlink id="cmdCancel" runat="server" CssClass="dnnSecondaryAction" borderstyle="none" text="Cancel" resourcekey="cmdCancel" />
</p>
