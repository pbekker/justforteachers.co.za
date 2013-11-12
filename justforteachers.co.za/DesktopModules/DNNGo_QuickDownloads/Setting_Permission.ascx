<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Permission.ascx.cs"
    Inherits="DNNGo.Modules.QuickDownloads.Setting_Permission" %>
<div class="article_setting">
    <h2 class="setting_page_title">
        <%=ViewTitle("lblModuleTitle", "Module Settings")%></h2>
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblBaseSetting", "Base Settings")%></h3>
        <div class="inside">
            <div class="form_field">
                <%=ViewTitle("lblDisplayCaptcha", "Display Captcha", "cbDisplayCaptcha")%>:
                <asp:CheckBox runat="server" ID="cbDisplayCaptcha" />
            </div>
            <div class="form_field">
                <%=ViewTitle("lblNeedLogin", "Need Login", "cbNeedLogin")%>:
                <asp:CheckBox runat="server" ID="cbNeedLogin" />
            </div>
            <div class="form_field">
                <%=ViewTitle("lblPermissionEnabled", "Permission Enabled", "cbPermissionEnabled")%>:
                <asp:CheckBox runat="server" ID="cbPermissionEnabled" />
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblPermissionList", "Permission List")%>:</h4>
                <asp:GridView ID="gvPermissionList" runat="server" CellPadding="0" Width="600" border="0"
                    CellSpacing="0" CssClass="table table-bordered table-striped" OnRowCancelingEdit="gvPermissionList_RowCancelingEdit"
                    GridLines="none" OnRowEditing="gvPermissionList_RowEditing" AutoGenerateColumns="false"
                    OnRowUpdating="gvPermissionList_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Role Name">
                            <ItemTemplate>
                                <asp:Label ID="LiName" runat="server" Text='<%# Bind("Name") %>' class="SubHead"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="LiName" runat="server" Text='<%# Bind("Name") %>' class="SubHead"></asp:Label>
                            </EditItemTemplate>
                            <ItemStyle Wrap="True" HorizontalAlign="Left" />
                            <HeaderStyle Wrap="False" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Number of Allow Downloads" HeaderStyle-Width="250">
                            <ItemTemplate>
                                <asp:Label ID="LiName" runat="server" Text='<%# Bind("Value") %>' class="SubHead"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:HiddenField ID="hfID" runat="server" Value='<%# Bind("Name") %>' />
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Value") %>' Width="60"
                                    CssClass="NormalTextBox :required :number"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Wrap="True" HorizontalAlign="Left" Width="100" />
                            <HeaderStyle Wrap="False" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="Options" HeaderStyle-HorizontalAlign="Left" ItemStyle-CssClass="SubHead"
                            CancelText="Cancel" DeleteText="Delete" EditText="Edit" UpdateText="Update" ValidationGroup="B"
                            ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
<p style="text-align: center;">
    <asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
        runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
    <asp:Button CssClass="input_button" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
        Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:Button>&nbsp;
</p>
