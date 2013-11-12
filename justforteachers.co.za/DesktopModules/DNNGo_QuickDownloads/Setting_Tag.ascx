<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Tag.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_Tag" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="asp" Namespace="DNNGo.Modules.QuickDownloads.WebControls" Assembly="DNNGo.Modules.QuickDownloads" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<div class="tag_setting">
    <h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Tag Management")%></h2>
<table  cellspacing="2" cellpadding="2" width="100%" summary="Module Settings Design Table"
    border="0">
    <tr valign="top">
        <td class="col_left">
            <table cellspacing="2" cellpadding="2" width="100%" summary="Module Settings Design Table"
                border="0">
              <tr valign="top">
                    <td>
                        <div class="form_field">
                            <!--<dnn:label id="lblContentText" runat="server" controlname="txtContentText" suffix=":">
                            </dnn:label>-->
                            <h4><%=ViewTitle("lblContentText", "Tag Name", "txtContentText")%>:</h4>
                            <asp:TextBox runat="server" ID="txtContentText" CssClass="input_text :required" Width="240"></asp:TextBox>
                            <p><%=ViewHelp("lblContentText", "This will be the name displayed in the label position.")%></p>
                        </div>
                        <div class="form_field">
                            <!--<dnn:label id="lblDescription" runat="server" controlname="txtDescription" suffix=":">
                            </dnn:label>-->
                            <h4><%=ViewTitle("lblDescription", "Description", "txtDescription")%>:</h4>
                            <asp:TextBox runat="server" ID="txtDescription"  Width="240" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            <p><%=ViewHelp("lblDescription", "Describe only part of the theme.")%></p>
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
                <div class="form_field">
                    <!--<dnn:Label ID="lblTitle" runat="server" controlname="txtTitle" suffix=":"></dnn:Label> -->
                    <asp:TextBox ID="txtTitle" runat="server"  Width="270px" CssClass="input_text"></asp:TextBox>
                            <asp:Button ID="lbSearch" runat="server" CssClass="input_button2" resourcekey="lbSearch"
                                OnClick="lbSearch_Click"></asp:Button>
                </div>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                   
                    <tr valign="top">
                        <td>
                            <asp:GridView ID="gvTagList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvTagList_RowDataBound"
                                Width="100%" CellPadding="6" CssClass="table table-bordered table-striped"  GridLines="none" >
                                <RowStyle />
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="Tag ID"  /> 
                                    <asp:BoundField DataField="ContentText" HeaderText="Content"  /> 
                                     <asp:BoundField DataField="Description" HeaderText="Description"  /> 
                                    <asp:TemplateField HeaderText="Action" >
                                        <ItemTemplate>
                                                        <asp:ImageButton ID="imbEdit" runat="server" ToolTip="Edit" OnCommand="imbEdit_Command"
                                                            ImageUrl="~/images/edit.gif" />
                                                        <asp:ImageButton ID="imbDelete" runat="server" ToolTip="Delete" OnCommand="imbDelete_Command"
                                                            ImageUrl="~/images/delete.gif" />
                                        </ItemTemplate>
                                        <HeaderStyle ></HeaderStyle>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Visible="False" />
                                <FooterStyle  />
                                <PagerStyle  />
                                <SelectedRowStyle  />
                                <HeaderStyle  />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dnn:PagingControl ID="ctlPagingControl" Width="100%" runat="server"></dnn:PagingControl>
                        </td>
                    </tr>
                </table>
        </td>
    </tr>
</table>
</div>
 