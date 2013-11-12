<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_CommentList.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_CommentList" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<div class="comment_setting">
<h2 class="setting_page_title"><%=ViewTitle("lblSearchCommentTitle", "Search Comment")%></h2>
<table width="600" id="tbControl" runat="server">
    <tr valign="top">
        <td width="250">
            <div class="form_field">
                <h4><%=ViewTitle("lblBeginDate", "BeginDate", "txtBeginDate")%>:</h4>
                <asp:TextBox ID="txtBeginDate" runat="server" CssClass="input_text :date_au" Width="100px"></asp:TextBox> 
            </div>
        </td>
        <td>
            <div class="form_field">
                <h4><%=ViewTitle("lblEndDate", "EndDate", "txtEndDate")%>:</h4>
                <asp:TextBox ID="txtEndDate" runat="server"  CssClass="input_text :date_au" Width="100px"></asp:TextBox> 
            </div>
        </td>
    </tr>
    <tr valign="top">
        <td>
            <div class="form_field">
                <h4><%=ViewTitle("lblTitle", "Title", "txtTitle")%>:</h4>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="input_text"></asp:TextBox>
            </div>
        </td> 
        <td>
            <div class="form_field">
                <h4><%=ViewTitle("lblUserName", "UserName", "txtUserName")%>:</h4>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="input_text"></asp:TextBox>
                <asp:Button ID="lbSearch" runat="server" CssClass="input_button2" resourcekey="lbSearch"
                OnClick="lbSearch_Click"></asp:Button>
                  <asp:Button ID="lbCancel" runat="server" CssClass="input_button" resourcekey="lbCancel"
                        OnClick="lbCancel_Click"></asp:Button>
            </div>            
        </td>
    </tr>
</table>
<h2 class="setting_page_title"><%=ViewTitle("lblCommentListTitle", "Comment List")%></h2>
<table width="100%">
    
    <tr>
        <td>
            <asp:GridView ID="gvArticleList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvArticleList_RowDataBound"
                Width="100%" CellPadding="6" cellspacing="0" border="0" GridLines="none" CssClass="table table-bordered table-striped" >
                <RowStyle CssClass="td_row" />
                <Columns>
                     <asp:TemplateField HeaderText="User Information"  HeaderStyle-Width="200">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td rowspan="3" style="padding:0px 10px 0px 0px; margin:0px; border:none; background:none;">
                                         <asp:Image runat="server" ID="imgUserPhoto" />
                                    </td>
                                    <td style="padding:0px; margin:0px; border:none; background:none;"><asp:Label runat="server" ID="labUserName"></asp:Label> </td>
                                </tr>
                                <tr>
                                    <td style="padding:0px; margin:0px; border:none; background:none;"><asp:Label runat="server" ID="labUserEmail"></asp:Label></td>                                 
                                </tr>
                                 <tr>
                                    <td style="padding:0px; margin:0px; border:none; background:none;"><asp:Label runat="server" ID="labUserIP"></asp:Label></td>
                                 
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle ></HeaderStyle>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Comment Content" >
                        <ItemTemplate>
                            <table width="100%">
                                
                                   <tr>
                                    <td style="padding:0px; margin:0px; border:none; background:none;">
                                        <asp:Label runat="server" ID="labCommentInfo"></asp:Label>
                                    </td>
                                    <td align="right" style="padding:0px; margin:0px; border:none; background:none; text-align:right;">
                                <%--         <asp:ImageButton ID="imbEdit" runat="server" ToolTip="Edit" OnCommand="imbEdit_Command"
                                            ImageUrl="~/images/edit.gif" />--%>

                                         <asp:LinkButton CssClass="CommandButton" ID="btnUnPending" resourcekey="cmdUnPending" Text="UnPending"  runat="server" OnClick="btnApproved_Click"></asp:LinkButton>
                                         &nbsp;
                                          <asp:LinkButton CssClass="CommandButton" ID="btnApproved" resourcekey="cmdApproved" Text="Approve"  runat="server" OnClick="btnApproved_Click"></asp:LinkButton>
                                         &nbsp;
                                          <asp:LinkButton CssClass="CommandButton" ID="btnSpam" resourcekey="cmdSpam" Text="Spam"  runat="server" OnClick="btnApproved_Click"></asp:LinkButton>
                                         &nbsp;
                                        <asp:ImageButton ID="imbDelete" runat="server" ToolTip="Delete" OnCommand="imbDelete_Command" ImageUrl="~/images/delete.gif" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding:0px; margin:0px; border:none; background:none;">Article:<asp:Label runat="server" ID="labArticle"></asp:Label></td>
                                </tr>
                              <tr>
                                    <td  colspan="2" style="padding:0px; margin:0px; border:none; background:none;">
                                       <asp:Label runat="server" ID="labContentText"></asp:Label>
                                    </td>
                                  
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle ></HeaderStyle>
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
        <td>
            <dnn:PagingControl ID="ctlPagingControl" Width="100%" runat="server"></dnn:PagingControl>
        </td>
    </tr>
</table>
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


