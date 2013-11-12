<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="Setting_Logs.ascx.cs"
    Inherits="DNNGo.Modules.QuickDownloads.ViewDownloadLogs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<div class="article_list_setting">
    <div class="search_article">
        <h2 class="setting_page_title">
            <%=ViewTitle("lblSearchLogs", "Search Logs")%></h2>
        <table width="600" id="tbControl" runat="server">
            <tr valign="top">
                <td width="250">

                    <div class="form_field">
                        <h4>
                            <%=ViewTitle("lblBeginDate", "BeginDate", "txtBeginDate")%>:</h4>
                        <asp:TextBox ID="txtBeginDate" runat="server" CssClass="input_text :date_au" Width="100px"></asp:TextBox><asp:HyperLink
                            ID="hyBeginDate" runat="server"></asp:HyperLink>
                   
                    </div>
                </td>
                <td>
                    <div class="form_field">
                      
                        <h4>
                            <%=ViewTitle("lblEndDate", "EndDate", "txtEndDate")%>:</h4>
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="input_text :date_au" Width="100px"></asp:TextBox><asp:HyperLink
                            ID="hyEndDate" runat="server"></asp:HyperLink>
                     
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="form_field">
                        <h4>
                            <%=ViewTitle("lblUserName", "User Name", "txtUserName")%>:</h4>
                       
                        <asp:TextBox ID="txtUserName" runat="server" Width="100px" CssClass="input_text"></asp:TextBox>
                    </div>
                </td>
                <td>
                    <div class="form_field">
                        <h4>
                            <%=ViewTitle("lblTitle", "Title", "txtTitle")%>:</h4>
                   
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
        <h2 class="setting_page_title">
            <%=ViewTitle("lblLogListTitle", "Log List")%></h2>
        <div class="form_field">
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="form_field">
                             <asp:Button ID="cmdDelete" runat="server" CssClass="input_button" resourcekey="cmdDelete"
                            OnClick="cmdDelete_Click" Text ="Delete Logs"  OnClientClick="return deleteop();"></asp:Button>

                             <asp:Button ID="cmdClearLogs" runat="server" CssClass="input_button" resourcekey="cmdClearLogs"
                            OnClick="cmdClearLogs_Click" Text ="Clear All Logs"  OnClientClick="return confirm('You sure you want to clear all data?');"></asp:Button>
                        </div>
                    </td>
                </tr>
 
                <tr>
                    <td>
                        <asp:GridView ID="GridView1"  runat="server" OnRowCreated="GridView1_RowCreated"
                         AutoGenerateColumns="false" Width="100%" CellPadding="0" cellspacing="0" border="0" CssClass="table table-bordered table-striped"  GridLines="none" >
                        <RowStyle CssClass="td_row" />
                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-Wrap="True" HeaderStyle-Wrap="False" />
                                <asp:BoundField HeaderText="UserName" DataField="UserName" ItemStyle-Wrap="True"
                                    HeaderStyle-Wrap="False" />
                                <asp:BoundField HeaderText="Title" DataField="InfoName" ItemStyle-Wrap="True" HeaderStyle-Wrap="False" />
                                <asp:BoundField HeaderText="FileName" DataField="FileName" ItemStyle-Wrap="True"
                                    HeaderStyle-Wrap="False" />
                                <asp:BoundField HeaderText="IP" DataField="IP" ItemStyle-Wrap="True" HeaderStyle-Wrap="False" />
                                <asp:BoundField HeaderText="DownLoadTime" DataField="DownLoadTime" ItemStyle-Wrap="True"
                                    HeaderStyle-Wrap="False" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:PagingControl ID="ctlPagingControl" Width="100%" runat="server">
                        </dnn:PagingControl>
                    </td>
                </tr>
            </table>
        </div>
    </div>
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
            return confirm("<%=DeleteConfirm %>");
        else {

            alert("<%=DeleteTitle %>");
            return false;
        }
    }


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
// -->
</script>
