<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_ThemeImport.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_ThemeImport" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/labelcontrol.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<div class="theme_import_setting">
	<h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Install Theme")%></h2>
	<div class="form_field">
		<!--<dnn:Label id="lblThemeFile" runat="server" controlname="fuThemeFile" suffix=":"></dnn:Label>-->
		<h4><%=ViewTitle("lblThemeFile", "Theme File", "fuThemeFile")%>:</h4>
		<asp:FileUpload runat="server" CssClass=" :required :file;.zip," Width="300" ID="fuThemeFile" />
         <p><%=ViewHelp("lblThemeFile", "If there's duplication when you import themes, system will replace original theme in default.")%></p>
	</div>
	<p>
        <asp:Button cssclass="input_button" lang="Submit" id="cmdUpdate" resourcekey="cmdUpdate" runat="server" text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
        <asp:Button cssclass="input_button" id="cmdCancel" resourcekey="cmdCancel" runat="server" text="Cancel" causesvalidation="False" OnClick="cmdCancel_Click"></asp:Button>
    </p>
</div>


<!--
<h2 class="setting_page_title"><%=ViewTitle("lblThemeListTitle", "Theme List")%></h2>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>
            <asp:GridView ID="gvThemeList" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvThemeList_RowDataBound"
                Width="100%" CellPadding="6"  GridLines="none" cellspacing="0" border="0" CssClass="table table-bordered table-striped">
                <RowStyle CssClass="Normal" />
                <Columns>
                     <asp:TemplateField HeaderText="Theme Information" HeaderStyle-Width="200">
                        <ItemTemplate>
                            <table cellpadding="2" cellspacing="2">
                                <tr>
                                    <td rowspan="3" style=" width:70px; height:70px; border:none; background:none; padding:0px 10px 0px 0px;">
                                         <asp:Image runat="server" style=" max-height:60px; max-width:60px;" ID="imgPicture" />
                                    </td>
                                    <td style="border:none; background:none; padding:0px;"><asp:Label runat="server" ID="labName"></asp:Label>(<asp:Label runat="server" ID="lblAlias"></asp:Label>) </td>
                                </tr>
                                <tr>
                                    <td style="border:none; background:none; padding:0px;"><asp:Label runat="server" ID="labDescription"></asp:Label></td>
                                 
                                </tr>
                                 <tr>
                                    <td style="border:none; background:none; padding:0px;"><asp:Label runat="server" ID="labVersion"></asp:Label></td>
                                </tr>
                                 
                            </table>
                        </ItemTemplate>
                        <HeaderStyle></HeaderStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastTime" HeaderText="Time" HeaderStyle-Width="100"  /> 
                    <asp:BoundField DataField="Name" HeaderText="Status" HeaderStyle-Width="80"  />
                     <asp:TemplateField HeaderText="Action"  HeaderStyle-Width="90">
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
-->