<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Themes.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_Themes" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>




<h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Theme List")%></h2>
<div class="form_field">
    <asp:TextBox ID="txtTitle" runat="server" Width="180px" CssClass="input_text"></asp:TextBox>
    <asp:Button ID="lbSearch" runat="server" CssClass="input_button2" resourcekey="lbSearch"
                OnClick="lbSearch_Click"></asp:Button>
</div>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>
            <asp:GridView ID="gvThemeList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvThemeList_RowDataBound"
                Width="100%" CellPadding="0"  GridLines="none" cellspacing="0" border="0" CssClass="table table-bordered table-striped">
                <RowStyle CssClass="Normal" />
                <Columns>
                     <asp:TemplateField HeaderText="Theme Information" >
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td rowspan="4" style=" width:245px; border:none; background:none; padding:0px 10px 0px 0px;">
                                         <asp:Image runat="server" style=" max-width:240px;" ID="imgPicture" />
                                    </td>
                                    <td style="background:none; padding:0px; border:none;"><asp:Label runat="server" ID="labName"></asp:Label>(<asp:Label runat="server" ID="lblAlias"></asp:Label>) </td>
                                </tr>
                                <tr>
                                    <td style="background:none; padding:0px; border:none;"><asp:Label runat="server" ID="labDescription"></asp:Label></td>
                                 
                                </tr>
                                 <tr>
                                    <td style="background:none; padding:0px; border:none;">
                                        <asp:Label runat="server" ID="labVersion"></asp:Label> 
                                        <asp:LinkButton CssClass="CommandButton" ID="btnUpdateVersion" runat="server" BorderStyle="none" OnClick="btnUpdateVersion_Click"></asp:LinkButton> 
                                    </td>
                                </tr>
                                 
                            </table>
                        </ItemTemplate>
                        <HeaderStyle></HeaderStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastUser" HeaderText="User" HeaderStyle-Width="70"  /> 
                    <asp:BoundField DataField="LastTime" HeaderText="Time" HeaderStyle-Width="120"  /> 
                    
                     <asp:TemplateField HeaderText="Action"  HeaderStyle-Width="150">
                        <ItemTemplate>
                                     <asp:LinkButton CssClass="CommandButton" ID="btnExport" resourcekey="cmdExport" runat="server"
                                        BorderStyle="none" Text="Export" OnClick="btnExport_Click"></asp:LinkButton>
                                        &nbsp;
                                         <asp:ImageButton ID="imbEnabled" runat="server" ToolTip="click to enable" OnCommand="imbEnabled_Command"  />
                                        &nbsp;
                                        <asp:ImageButton ID="imbEdit" runat="server" ToolTip="Edit" OnCommand="imbEdit_Command"
                                            ImageUrl="~/images/edit.gif" />
                                        &nbsp;
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


<div id="divInstallTheme">
<h2 class="setting_page_title"><%=ViewTitle("lblInstallTheme", "Install Theme")%></h2>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>
             <asp:GridView ID="gvInstallTheme" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvInstallTheme_RowDataBound"
                Width="100%" CellPadding="6"  GridLines="none" cellspacing="0" border="0" CssClass="table table-bordered table-striped">
                <RowStyle CssClass="Normal" />
                <Columns>
                     <asp:TemplateField HeaderText="Theme Information">
                        <ItemTemplate>
                            <table cellpadding="2" cellspacing="2">
                                <tr>
                                    <td rowspan="4" style=" width:245px; border:none; background:none; padding:0px 10px 0px 0px;">
                                         <asp:Image runat="server" style="max-width:240px;" ID="imgPicture" />
                                    </td>
                                    <td style="border:none; background:none; padding:0px;"><asp:Label runat="server" ID="labName"></asp:Label>(<asp:Label runat="server" ID="lblAlias"></asp:Label>) </td>
                                </tr>
                                <tr>
                                    <td style="border:none; background:none; padding:0px;"><asp:Label runat="server" ID="labDescription"></asp:Label></td>
                                 
                                </tr>
                                 <tr>
                                    <td style="border:none; background:none; padding:0px;"><asp:Label runat="server" ID="labVersion"></asp:Label></td>
                                </tr>
                                 <tr>
                                    <td  style="border:none; background:none; padding:0px;"></td>
                                </tr>
                                 
                            </table>
                        </ItemTemplate>
                        <HeaderStyle></HeaderStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastTime" HeaderText="Time" HeaderStyle-Width="120"  /> 
                     <asp:TemplateField HeaderText="Action"  HeaderStyle-Width="150">
                        <ItemTemplate>
                                     <asp:LinkButton CssClass="CommandButton" ID="btnInstall" resourcekey="cmdInstall" runat="server"
                                        BorderStyle="none" Text="Install Theme" OnClick="btnInstall_Click"></asp:LinkButton>
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
 
</table>

</div>


 


