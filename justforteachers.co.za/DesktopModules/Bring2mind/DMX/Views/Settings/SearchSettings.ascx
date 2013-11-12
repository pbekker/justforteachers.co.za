<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SearchSettings.ascx.vb" Inherits="Bring2mind.DNN.Modules.DMX.Views.Settings.SearchSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<h2 id="H1" class="dnnFormSectionHead">
 <a href="#" class="dnnSectionExpanded">
  <%=LocalizeString("SearchSettings")%></a></h2>
<fieldset>
 <div class="dnnFormItem">
   <dnn:label id="plPageSize" runat="server" controlname="txtPageSize" suffix=":" />
   <asp:TextBox runat="server" ID="txtPageSize" />
 </div>
 <div class="dnnFormItem">
   <dnn:label id="plShowAdvancedSearchPanel" runat="server" controlname="chkShowAdvancedSearchPanel" suffix=":" />
   <asp:checkbox runat="server" ID="chkShowAdvancedSearchPanel" />
 </div>
 <div class="dnnFormItem">
   <dnn:label id="plShowSearchResults" runat="server" controlname="chkShowSearchResults" suffix=":" />
   <asp:checkbox runat="server" ID="chkShowSearchResults" />
 </div>
 <div class="dnnFormItem">
   <dnn:label id="plSearchResultsRedirectTabId" runat="server" controlname="ddSearchResultsRedirectTabId" suffix=":" />
   <asp:DropDownList runat="server" ID="ddSearchResultsRedirectTabId" />
 </div>
 <div class="dnnFormItem">
   <dnn:label id="plSearchResultsImmediateRedirectTabId" runat="server" controlname="ddSearchResultsImmediateRedirectTabId" suffix=":" />
   <asp:DropDownList runat="server" ID="ddSearchResultsImmediateRedirectTabId" />
 </div>
</fieldset>





