<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Options_Views.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Options_Views" %>
<div class="options_views">
    <h2 class="setting_page_title">
        <%=ViewTitle("lblModuleTitle", "Views Module Options")%></h2>
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblBaseSetting", "Base Settings")%></h3>
        <div class="inside">
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblThemeFile", "Theme File", "ddlThemeFile")%>:</h4>
                <asp:DropDownList ID="ddlThemeFile" runat="server" CssClass="input_text"  OnSelectedIndexChanged="ddlThemeFile_SelectedIndexChanged" AutoPostBack="true" >
                </asp:DropDownList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblXmlName", "Name", "lblXmlName")%>:</h4>
                <asp:Label ID="lblXmlName" runat="server"></asp:Label>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblXmlDescription", "Description", "lblXmlDescription")%>:</h4>
                <asp:Label ID="lblXmlDescription" runat="server"></asp:Label>
            </div>
            <div class="form_field">
                <asp:Label ID="lblMessage" runat="server" CssClass="LI_Message"></asp:Label>
            </div>
        </div>
    </div>
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblThemeSetting", "Theme Settings")%></h3>
        <div class="inside">
            <table>
            <asp:Repeater ID="RepeaterTheme" runat="server" OnItemDataBound="RepeaterTheme_ItemDataBound">
                <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Literal ID="liTitle" runat="server"></asp:Literal>:
                                </td>
                                <td style="white-space: nowrap;">
                                    <asp:PlaceHolder ID="ThemePH" runat="server"></asp:PlaceHolder>
                                    <asp:Literal ID="liHelp" runat="server"></asp:Literal>
                                    <asp:HiddenField ID="hfClientID" runat="server" />
                                    <asp:HiddenField ID="hfCtlID" runat="server" />
                                </td>
                            </tr>
                </ItemTemplate>
            </asp:Repeater>
            </table>
        </div>
    </div>
    <p style="text-align: center;">
        <asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
            runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
        <asp:Button CssClass="input_button" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
            Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:Button>&nbsp;
    </p>
</div>
