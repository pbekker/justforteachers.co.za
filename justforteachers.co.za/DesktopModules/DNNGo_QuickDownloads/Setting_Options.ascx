<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Options.ascx.cs"
    Inherits="DNNGo.Modules.QuickDownloads.Setting_Options" %>
    <%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Security.Permissions.Controls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="article_setting">
<h2 class="setting_page_title">
        <%=ViewTitle("lblModuleTitle", "Module Settings")%></h2>
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblBaseSetting", "Base Settings")%></h3>
        <div class="inside">
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblDirectory", "Directory", "txtDirectory")%>:</h4>
                <asp:Label runat="server" ID="lblDirectoryTitle"></asp:Label>
                <asp:TextBox runat="server" ID="txtDirectory" Width="200px" CssClass="input_text"></asp:TextBox>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblFileUnit", "File Unit", "rblFileUnit")%>:</h4>
                <asp:RadioButtonList RepeatDirection="Horizontal" runat="server" CssClass="NormalTextBox"
                    ID="rblFileUnit">
                    <asp:ListItem Text="KB" Value="0"></asp:ListItem>
                    <asp:ListItem Text="MB" Value="1"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblHotValue", "Hot Value", "rblHotValue")%>:</h4>
                <asp:RadioButtonList Font-Size="Medium" RepeatDirection="Horizontal" runat="server"
                    CssClass="NormalTextBox" ID="rblHotValue">
                    <asp:ListItem Text="★" Value="★"></asp:ListItem>
                    <asp:ListItem Text="☆" Value="☆"></asp:ListItem>
                    <asp:ListItem Text="▲" Value="▲"></asp:ListItem>
                    <asp:ListItem Text="△" Value="△"></asp:ListItem>
                    <asp:ListItem Text="◆" Value="◆"></asp:ListItem>
                    <asp:ListItem Text="◇" Value="◇"></asp:ListItem>
                    <asp:ListItem Text="●" Value="●"></asp:ListItem>
                    <asp:ListItem Text="○" Value="○"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblPageSize", "Number of articles per page", "txtPageSize")%>:</h4>
                <asp:TextBox runat="server" ID="txtPageSize" Width="100px" CssClass="input_text :required :number"></asp:TextBox>
            </div>
        
           <div class="form_field">
                <h4>
                    <%=ViewTitle("lblFeedSize", "Syndication feeds show the most recent", "txtFeedSize")%>:</h4>
                <asp:TextBox runat="server" ID="txtFeedSize" Width="50px" CssClass="input_text :required :number"></asp:TextBox>
                <%=ViewHelp("lblFeedSize", "items")%>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblFeedExcerpt", "For each article in a feed, show", "rblFeedExcerpt")%>:</h4>
                <asp:RadioButtonList ID="rblFeedExcerpt" runat="server" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblFriendlyUrl", "Friendly Url", "rblFriendlyUrl")%>:</h4>
                <asp:RadioButtonList ID="rblFriendlyUrl" runat="server" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </div>
             <div class="form_field">
                <h4>
                    <%=ViewTitle("lblSitemapSize", "Synidication sitemap display the latest", "txtSitemapSize")%>:</h4>
                <asp:TextBox runat="server" ID="txtSitemapSize" Width="50px" CssClass="input_text :required :number"></asp:TextBox>
                <div><%=ViewHelp("lblSitemapSize", "")%><asp:Literal ID="liSitemapSize" runat="server"></asp:Literal></div>
            </div>
            <div class="form_field">
                <h4><%=ViewTitle("lblSendMail", "Send Mail", "cbSendMail")%>:</h4>
                <asp:CheckBox runat="server" ID="cbSendMail" />
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblMailTo", "Mail To", "txtMailTo")%>:</h4>
                <asp:TextBox runat="server" ID="txtMailTo" Width="300px" CssClass="input_text :required"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblAuthorSetting", "Author Setting")%></h3>
        <div class="inside">
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblAuthorRoles", "Author Roles", "cblAuthorRoles")%>:</h4>
                    <asp:CheckBoxList ID="cblAuthorRoles" runat="server"></asp:CheckBoxList>
                    <dnn:modulepermissionsgrid id="dgPermissions" runat="server"/>
            </div>
             <div class="form_field">
                <h4>
                    <%=ViewTitle("lblArticleCheck", "review new article", "cbArticleCheck")%>:</h4>
                    <asp:CheckBox ID="cbArticleCheck" runat="server" Checked="true" />
                    <%=ViewHelp("lblArticleCheck", "It needs the administrator to review new article posts.", "cbArticleCheck")%>
            </div>
        </div>
    </div>
 
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblAvatarsSetting", "Avatars Settings")%></h3>
        <div class="inside">
            <div class="form_field">
                <%=ViewHelp("lblAvatarsSetting", "An avatar is an image that follows you from weblog to weblog appearing beside your name when you comment on avatar enabled sites. Here you can enable the display of avatars for people who comment on your site.")%>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblAvatarRating", "Avatar Maximum Rating", "rblAvatarRating")%>:</h4>
                <asp:RadioButtonList ID="rblAvatarRating" runat="server">
                </asp:RadioButtonList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblDefaultAvatar", "Default Avatar", "rblEnabledComment")%>:</h4>
                <asp:RadioButtonList ID="rblDefaultAvatar" runat="server">
                </asp:RadioButtonList>
                <%=ViewHelp("lblDefaultAvatar", "For users without a custom avatar of their own, you can either display a generic logo or a generated one based on their e-mail address.")%>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblAvatarSize", "Avatar Size", "txtAvatarSize")%>:</h4>
                <asp:TextBox runat="server" ID="txtAvatarSize" Width="50px" CssClass="input_text :required :number"></asp:TextBox>
                <%=ViewHelp("lblAvatarSize", "px")%>
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
