<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_FileList.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_FileList" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<div class="article_list_setting">
    <div class="search_article">
        <h2 class="setting_page_title"><%=ViewTitle("lblSearchFileTitle", "Search File")%></h2>
        <table width="600" id="tbControl" runat="server">
            <tr valign="top">
                <td width="250">

                    <div class="form_field">
                        <h4><%=ViewTitle("lblBeginDate", "BeginDate", "txtBeginDate")%>:</h4>
                        <asp:TextBox ID="txtBeginDate" runat="server" CssClass="input_text :date_au" Width="100px"></asp:TextBox><asp:HyperLink
                        ID="hyBeginDate" runat="server"></asp:HyperLink>
                      
                    </div>
                </td>
                <td>
                    <div class="form_field">
   
                        <h4><%=ViewTitle("lblEndDate", "EndDate", "txtEndDate")%>:</h4>
                        <asp:TextBox ID="txtEndDate" runat="server"  CssClass="input_text :date_au" Width="100px"></asp:TextBox><asp:HyperLink
                            ID="hyEndDate" runat="server"></asp:HyperLink>

                    </div>
                </td>
            </tr>
            <tr>
                <td >
                    <div class="form_field">
                        <h4><%=ViewTitle("lblUserName", "User Name", "txtUserName")%>:</h4>

                        <asp:TextBox ID="txtUserName" runat="server" Width="100px" CssClass="input_text"></asp:TextBox>
                    </div>                    
                </td>
                <td >
                    <div class="form_field">
                        <h4><%=ViewTitle("lblTitle", "Title", "txtTitle")%>:</h4>
         
                        <asp:TextBox ID="txtTitle" runat="server" Width="100px" CssClass="input_text"> </asp:TextBox>
                        <asp:Button ID="lbSearch" runat="server" CssClass="input_button" resourcekey="lbSearch"
                        OnClick="lbSearch_Click"></asp:Button>
                        <asp:Button ID="lbCancel" runat="server" CssClass="input_button" resourcekey="lbCancel"
                        OnClick="lbCancel_Click"></asp:Button>
                    </div>
                </td>
            </tr>
    
        </table>
    </div>
    <div class="article_list">
        <h2 class="setting_page_title"><%=ViewTitle("lblFileListTitle", "File List")%></h2>
        <table width="100%" cellpadding="0" cellspacing="0">
             <tr>
                <td style=" text-align:left; padding-bottom:5px;">
                    
                    <asp:Button ID="cmdPublish" runat="server" CssClass="input_button" resourcekey="cmdPublish" OnClick="cmdPublish_Click" Text="Publish" OnClientClick="return Publishop();" Visible="false"></asp:Button>
                    <asp:Button ID="cmdLock" runat="server" CssClass="input_button" resourcekey="cmdLock" OnClick="cmdLock_Click" Text="Lock" OnClientClick="return Lockop();" Visible="false"></asp:Button>
                    <asp:Button ID="cmdDelete" runat="server" CssClass="input_button" resourcekey="cmdDelete" OnClick="cmdDelete_Click" Text="Delete" OnClientClick="return deleteop();"></asp:Button>
                </td>
                <td style=" text-align:right; padding-bottom:5px;">
                  <%=ViewTitle("lblArticleStatusFilter", "Article Filter")%>:  
                    <asp:HyperLink runat="server" ID="hlAllArticle" CssClass="link_button" ResourceKey="hlAllArticle"></asp:HyperLink> &nbsp;
                    <asp:HyperLink runat="server" ID="hlNormalArticle" CssClass="link_button" ResourceKey="hlNormalArticle"></asp:HyperLink> &nbsp;
                    <asp:HyperLink runat="server" ID="hlPendingArticle" CssClass="link_button" ResourceKey="hlPendingArticle"></asp:HyperLink> &nbsp;
                    <asp:HyperLink runat="server" ID="hlLockArticle" CssClass="link_button" ResourceKey="hlLockArticle"></asp:HyperLink> &nbsp;
                    
                  
                    <!--<dnn:PagingControl ID="ctlPagingControl2" Width="100%" runat="server"></dnn:PagingControl>-->
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="gvArticleList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvArticleList_RowDataBound" OnSorting="gvArticleList_Sorting" AllowSorting="true"
                      OnRowCreated="gvArticleList_RowCreated"  Width="100%" CellPadding="6" cellspacing="0" border="0" CssClass="table table-bordered table-striped"  GridLines="none" >
                        <RowStyle CssClass="td_row" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID"  SortExpression="ID"  /> 
                             <asp:TemplateField HeaderText="Name"  SortExpression="Name" >
                                <ItemTemplate>
                                     <asp:HyperLink Target="_blank" runat="server" ID="HLArticleTitle"></asp:HyperLink>                        
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ClickCount" HeaderText="Click Count" SortExpression="ClickCount" /> 
                            <asp:BoundField DataField="AttachmentCount" HeaderText="Attachment" SortExpression="AttachmentCount"  /> 
                            <asp:BoundField DataField="LastUserID" HeaderText="Last User" SortExpression="LastUserID" /> 
                            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate"  /> 
                            <asp:BoundField DataField="EndTime" HeaderText="EndTime" DataFormatString="{0:yyyy-MM-dd}" SortExpression="EndTime"  />
                           <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"  /> 
                            <asp:TemplateField HeaderText="Action" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="imbEdit" runat="server" ToolTip="Edit" OnCommand="imbEdit_Command"
                                        ImageUrl="~/images/edit.gif" />
                                    <asp:ImageButton ID="imbDelete" runat="server" ToolTip="Delete" OnCommand="imbDelete_Command"
                                        ImageUrl="~/images/delete.gif" />
                                            
                                </ItemTemplate>
                                <HeaderStyle></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Visible="False" />
                        <FooterStyle  />
                        <PagerStyle  />
                        <SelectedRowStyle  />
                        <HeaderStyle  />
                        <AlternatingRowStyle CssClass="alternating_row"  />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                 <td colspan="2">
                    <dnn:PagingControl ID="ctlPagingControl" Width="100%" runat="server"></dnn:PagingControl>
                </td>
            </tr>
        </table>
    </div>
</div>


 <script type="text/javascript">



     jQuery(function () {
         var dates = jQuery("#<%=txtBeginDate.ClientID %>, #<%=txtEndDate.ClientID %>").datepicker({
              changeMonth: true, changeYear: true,
             onSelect: function (selectedDate) {
                 var option = this.id == "<%=txtBeginDate.ClientID %>" ? "minDate" : "maxDate",
					instance = jQuery(this).data("datepicker"),
					date = jQuery.datepicker.parseDate(
						instance.settings.dateFormat ||
						jQuery.datepicker._defaults.dateFormat,
						selectedDate, instance.settings);
                 dates.not(this).datepicker("option", option, date);
             }
         });
     });

</script>




 <script language="javascript" type="text/javascript">
<!--

     function SelectAll() {
         var e = document.getElementsByTagName("input");
         var IsTrue;
         if (document.getElementById("CheckboxAll").value == "0") {
             IsTrue = true;
             document.getElementById("CheckboxAll").value = "1"
         }
         else {
             IsTrue = false;
             document.getElementById("CheckboxAll").value = "0"
         }
         for (var i = 0; i < e.length; i++) {
             if (e[i].type == "checkbox") {
                 e[i].checked = IsTrue;
             }
         }
     }
     function deleteop() {
         var checkok = false;
         var e = document.getElementsByTagName("input");
         for (var i = 0; i < e.length; i++) {
             if (e[i].type == "checkbox") {
                 if (e[i].checked == true) {
                     checkok = true;
                     break;
                 }
             }
         }
        if (checkok)
            return confirm('<%=ViewResourceText("lblDeletecheckok", "This action can not be undone, are you sure to delete?")%>');
        else {

            alert("<%=ViewResourceText("lblDeletecheckconfirm", "Please select the records needs to be deleted!")%>");
            return false;
        }
     }
     function Publishop() {
         var checkok = false;
         var e = document.getElementsByTagName("input");
         for (var i = 0; i < e.length; i++) {
             if (e[i].type == "checkbox") {
                 if (e[i].checked == true) {
                     checkok = true;
                     break;
                 }
             }
         }
        if (checkok)
            return confirm('<%=ViewResourceText("lblPublishcheckok", "Are you sure to publish?")%>');
        else {

            alert("<%=ViewResourceText("lblPublishcheckconfirm", "Please select the records needs to be published!")%>");
            return false;
        }
     }

     function Lockop() {
         var checkok = false;
         var e = document.getElementsByTagName("input");
         for (var i = 0; i < e.length; i++) {
             if (e[i].type == "checkbox") {
                 if (e[i].checked == true) {
                     checkok = true;
                     break;
                 }
             }
         }
        if (checkok)
            return confirm('<%=ViewResourceText("lblLockcheckok", "Are you sure to lock?")%>');
        else {

            alert("<%=ViewResourceText("lblLockcheckconfirm", "Please select the records needs to be locked!")%>");
            return false;
        }
     }
 
// -->
    </script>