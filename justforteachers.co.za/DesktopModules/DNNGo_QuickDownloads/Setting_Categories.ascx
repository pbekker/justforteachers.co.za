<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Categories.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_Categories" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="asp" Namespace="DNNGo.Modules.QuickDownloads.WebControls" Assembly="DNNGo.Modules.QuickDownloads" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<div class="category_setting">
    <h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Categories")%></h2>
<table cellspacing="2" cellpadding="2" width="100%" summary="Module Settings Design Table"
    border="0">
    <tr valign="top">
        <td class="col_left">
            <%--左边编辑区域--%>
            <table cellspacing="2" cellpadding="2" width="100%" summary="Module Settings Design Table"
                border="0">
                <tr valign="top">
                    <td>
                         <%--  名称  --%>
                        <div class="form_field">
                            <!--<dnn:label id="lblName" runat="server" controlname="txtName" suffix=":"> 
                            </dnn:label>-->
                            <h4><%=ViewTitle("lblName", "Name", "txtName")%>:</h4>
                            <asp:TextBox runat="server" ID="txtName" CssClass="input_text :required" Width="240"></asp:TextBox>
                            <p><%=ViewHelp("lblName", "Enter the category name")%></p>
                        </div>
                        <div class="form_field">
                            <!--<dnn:label id="lblParent" runat="server" controlname="txtParent" suffix=":">
                            </dnn:label>-->
                            <h4><%=ViewTitle("lblParent", "Parent Category", "ddlParent")%>:</h4>
                            <asp:CustDropDownList ID="ddlParent"  runat="server" Width="60%">  </asp:CustDropDownList>
                            <p><%=ViewHelp("lblParent", "Enter the category name")%></p>
                        </div>
                        <div class="form_field">
                            <h4><%=ViewTitle("lblContentText", "Description", "txtContentText")%>:</h4>
                            <!--<dnn:label id="lblContentText" runat="server" controlname="txtContentText" suffix=":">
                            </dnn:label>-->
                            <asp:TextBox runat="server" ID="txtContentText"  Width="240" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            <p><%=ViewHelp("lblContentText", "Describe only part of the theme.")%></p>
                        </div>
                    </td>
                </tr>
                 <tr valign="top">
                   <td align="center">
                                <asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate" runat="server"
                                    Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
                                <asp:Button CssClass="input_button" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
                                    Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:Button>&nbsp;
                                <asp:Button CssClass="input_button" ID="cmdDelete" resourcekey="cmdDelete" runat="server"
                                    Text="Delete"  CausesValidation="False" OnClick="cmdDeleteCategory_Click"></asp:Button>&nbsp;
                   </td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <%--右边列表区域--%>           
             <asp:TreeListView runat="server" ID="tlview" NodeColumnIndex="1" ParentKey="parentID" 
                    ColumnKey="ID" SortKey="ID" cellpadding="6" cellspacing="0" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" ExpendDepth="5" GridLines="none" OnRowDataBound="tlview_RowDataBound" >
                <Columns>
                    <asp:LineNumberField HeaderStyle-Width="25" HeaderText="No.">
                    </asp:LineNumberField> 
                    <asp:BoundField DataField="Name" HeaderText="Name"  ItemStyle-Width="300"/> 
                    <asp:BoundField DataField="ChildCount" HeaderText="Child"  /> 
          
                     <asp:TemplateField HeaderText="Operation" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="130">
                        <ItemTemplate>
                            <asp:HyperLink  CssClass="CommandButton" ID="btnEdit" resourcekey="cmdEdit" runat="server"
                            BorderStyle="none" Text="Edit"></asp:HyperLink>
                    <%--        <asp:LinkButton CssClass="CommandButton" ID="btnEdit" resourcekey="cmdEdit" runat="server"
                            BorderStyle="none" Text="Edit" OnClick="btnEdit_Click"></asp:LinkButton>--%>
                         <%--   &nbsp;&nbsp;
                          <asp:LinkButton CssClass="CommandButton" ID="btnDelete" resourcekey="cmdDelete" runat="server"
                            BorderStyle="none" Text="Delete" OnClick="btnDelete_Click"></asp:LinkButton>--%>
                        </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
            </asp:TreeListView>
        </td>
    </tr>
</table>
</div>
<script type="text/javascript">
 

</script>