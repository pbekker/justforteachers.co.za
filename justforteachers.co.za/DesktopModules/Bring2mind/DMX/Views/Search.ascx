<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Search.ascx.vb" Inherits="Bring2mind.DNN.Modules.DMX.Views.Search" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<asp:Panel runat="server" ID="pnlAdvancedSearch" CssClass="advancedSearch">
<table cellspacing="0" cellpadding="5" border="0">
 <tr>
  <td class="DMX_EditTitle SubHead leftAlignLabel">
   <dnn:Label ID="plField" runat="server" />
  </td>
  <td class="DMX_EditTitle SubHead leftAlignLabel">
   <dnn:Label ID="plSelection" runat="server" />
  </td>
  <td class="DMX_EditTitle SubHead leftAlignLabel">
   <dnn:Label ID="plSearchString" runat="server" />
  </td>
  <td class="DMX_EditTitle SubHead leftAlignLabel">
   <dnn:Label ID="plExact" runat="server" Visible="false" />
  </td>
 </tr>
 <tr>
  <td>
   <asp:DropDownList ID="dd1Field" runat="server" DataTextField="Text" DataValueField="Value" />
  </td>
  <td>
   <asp:DropDownList ID="dd1Selection" runat="server">
    <asp:ListItem Value="All" Text="All" resourcekey="optSelectionAll" />
    <asp:ListItem Value="Any" Text="Any" resourcekey="optSelectionAny" />
    <asp:ListItem Value="Exact" Text="Exact" resourcekey="optSelectionExact" />
    <asp:ListItem Value="Without" Text="Without" resourcekey="optSelectionWithout" />
    <asp:ListItem Value="Phrase" Text="Phrase" resourcekey="optSelectionPhrase" />
   </asp:DropDownList>
  </td>
  <td>
   <asp:TextBox runat="server" ID="txt1Search" Width="300" />
  </td>
  <td style="display: none;">
   <asp:CheckBox runat="server" ID="chk1Exact" />
  </td>
 </tr>
 <tr>
  <td>
   <asp:DropDownList ID="dd2Field" runat="server" DataTextField="Text" DataValueField="Value" />
  </td>
  <td>
   <asp:DropDownList ID="dd2Selection" runat="server">
    <asp:ListItem Value="All" Text="All" resourcekey="optSelectionAll" />
    <asp:ListItem Value="Any" Text="Any" resourcekey="optSelectionAny" />
    <asp:ListItem Value="Exact" Text="Exact" resourcekey="optSelectionExact" />
    <asp:ListItem Value="Without" Text="Without" resourcekey="optSelectionWithout" />
    <asp:ListItem Value="Phrase" Text="Phrase" resourcekey="optSelectionPhrase" />
   </asp:DropDownList>
  </td>
  <td>
   <asp:TextBox runat="server" ID="txt2Search" Width="300" />
  </td>
  <td style="display: none;">
   <asp:CheckBox runat="server" ID="chk2Exact" />
  </td>
 </tr>
 <tr>
  <td>
   <asp:DropDownList ID="dd3Field" runat="server" DataTextField="Text" DataValueField="Value" />
  </td>
  <td>
   <asp:DropDownList ID="dd3Selection" runat="server">
    <asp:ListItem Value="All" Text="All" resourcekey="optSelectionAll" />
    <asp:ListItem Value="Any" Text="Any" resourcekey="optSelectionAny" />
    <asp:ListItem Value="Exact" Text="Exact" resourcekey="optSelectionExact" />
    <asp:ListItem Value="Without" Text="Without" resourcekey="optSelectionWithout" />
    <asp:ListItem Value="Phrase" Text="Phrase" resourcekey="optSelectionPhrase" />
   </asp:DropDownList>
  </td>
  <td>
   <asp:TextBox runat="server" ID="txt3Search" Width="300" />
  </td>
  <td style="display: none;">
   <asp:CheckBox runat="server" ID="chk3Exact" />
  </td>
 </tr>
 <tr>
  <td>
   <asp:DropDownList ID="dd4Field" runat="server" DataTextField="Text" DataValueField="Value" />
  </td>
  <td>
   <asp:DropDownList ID="dd4Selection" runat="server">
    <asp:ListItem Value="All" Text="All" resourcekey="optSelectionAll" />
    <asp:ListItem Value="Any" Text="Any" resourcekey="optSelectionAny" />
    <asp:ListItem Value="Exact" Text="Exact" resourcekey="optSelectionExact" />
    <asp:ListItem Value="Without" Text="Without" resourcekey="optSelectionWithout" />
    <asp:ListItem Value="Phrase" Text="Phrase" resourcekey="optSelectionPhrase" />
   </asp:DropDownList>
  </td>
  <td>
   <asp:TextBox runat="server" ID="txt4Search" Width="300" />
  </td>
  <td style="display: none;">
   <asp:CheckBox runat="server" ID="chk4Exact" />
  </td>
 </tr>
 <tr>
  <td class="DMX_EditTitle SubHead">
   <dnn:Label ID="plCombination" runat="server" />
  </td>
  <td>
   <asp:DropDownList ID="ddCombination" runat="server">
    <asp:ListItem Value="OR" Text="OR" resourcekey="optOr" />
    <asp:ListItem Value="AND" Text="AND" resourcekey="optAnd" />
   </asp:DropDownList>
  </td>
  <td class="NormalBold">
   <asp:CheckBox runat="server" ID="chkAllVersions" Text="All Versions" resourcekey="chkAllVersions" />
  </td>
 </tr>
</table>

<asp:LinkButton ID="cmdSearch" runat="server" resourceKey="cmdSearch" CssClass="dnnPrimaryAction" />
</asp:Panel>

<asp:GridView ID="gvResults" runat="server" AllowSorting="True" DataSourceID="odsResults" CssClass="dmxSearchResults" ShowHeader="false"
 GridLines="None" Width="100%" AutoGenerateColumns="false" PagerStyle-CssClass="dmxSearchResultsPager">
 <PagerSettings Mode="NumericFirstLast" />
 <Columns>
  <asp:TemplateField ItemStyle-VerticalAlign="Top">
   <ItemTemplate>
    <%#Bring2mind.DNN.Modules.DMX.UI.Utilities.GetImageHtmlBlock(DataBinder.Eval(Container, "DataItem.Extension.Icon32"), Bring2mind.DNN.Modules.DMX.Common.Globals.GetAString(DataBinder.Eval(Container, "DataItem.Remarks")), "<p class=""dmxicon-32-{0}"" title=""{1}"" style=""padding:0"" />", "<img src=""{0}"" border=""0"" width=""32"" height=""32"" title=""{1}"" />")%>
   </ItemTemplate>
  </asp:TemplateField>
  <asp:TemplateField>
   <ItemTemplate>
    <div>
     <a href='<%#IIF(CStr(DataBinder.Eval(Container.DataItem, "EntryType")).StartsWith("File"), DownloadUrl(DataBinder.Eval(Container, "DataItem.EntryId")), BaseUrl+CStr(DataBinder.Eval(Container.DataItem, "EntryId")))%>' class="SubHead"
      title='<%#DataBinder.Eval(Container.DataItem, "Remarks")%>' style='display: <%#IIF(DataBinder.Eval(Container.DataItem, "EntryType")="Hyperlink", "none", "block")%>'>
      <%# DataBinder.Eval(Container.DataItem, "Title") %>
     </a>
     <a href='<%#DataBinder.Eval(Container.DataItem, "Entry")%>' class="SubHead" title='<%#DataBinder.Eval(Container.DataItem, "Remarks")%>'
      style='display: <%#IIF(DataBinder.Eval(Container.DataItem, "EntryType")="Hyperlink", "block", "none")%>'>
      <%# DataBinder.Eval(Container.DataItem, "Title") %>
     </a>
    </div>
    <div>
     <%# FormatFolder(DataBinder.Eval(Container.DataItem, "CollectionId"), DataBinder.Eval(Container.DataItem, "FolderTitle"))%>
    </div>
    <div>
     <asp:Label ID="lblSummary" runat="server" CssClass="Normal" Text='<%# Server.HtmlDecode(Server.HtmlDecode(DataBinder.Eval(Container.DataItem, "Extract"))) + "<br>" %>'
      />
    </div>
    <div>
     <a href='<%= BaseUrl %><%#DataBinder.Eval(Container.DataItem, "EntryId")%>' class="SubHead">
      <%= BaseUrl %><%#DataBinder.Eval(Container, "DataItem.EntryId")%></a>&nbsp;-
     <asp:Label ID="lblPubDate" runat="server" CssClass="Normal" Text='<%# FormatDate(DataBinder.Eval(Container.DataItem, "LastModified")) %>' />
    </div>
   </ItemTemplate>
  </asp:TemplateField>
  <asp:TemplateField ItemStyle-Width="16" ItemStyle-VerticalAlign="Top">
   <ItemTemplate>
    <a href='<%# DownloadUrl(DataBinder.Eval(Container, "DataItem.EntryId"))%>' class="dmxicon-16-disk_blue-png link"
     style="display: <%#IIF(CStr(DataBinder.Eval(Container, "DataItem.EntryType")).StartsWith("File"), "block", "none")%>"
     title='<%=DotNetNuke.Services.Localization.Localization.GetString("Download.Button", Bring2mind.DNN.Modules.DMX.Common.Globals.glbDMXSharedResourceFile)%>'>
     &nbsp;</a>
   </ItemTemplate>
  </asp:TemplateField>
  <asp:TemplateField ItemStyle-Width="70" ItemStyle-VerticalAlign="Top">
   <ItemTemplate>
    <asp:Label ID="lblSize" runat="server" CssClass="Normal" Text='<%# IIF(DataBinder.Eval(Container, "DataItem.EntryType").StartsWith("File"), Bring2mind.DNN.Modules.DMX.Common.Globals.FormatSize(DataBinder.Eval(Container, "DataItem.FileSize")), "") %>' />
   </ItemTemplate>
  </asp:TemplateField>
 </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="odsResults" runat="server" SelectMethod="GetSearchResults" TypeName="Bring2mind.DNN.Modules.DMX.Views.Search"
 EnablePaging="True" MaximumRowsParameterName="PageSize" SelectCountMethod="GetRowCount"
 StartRowIndexParameterName="StartRow"></asp:ObjectDataSource>
