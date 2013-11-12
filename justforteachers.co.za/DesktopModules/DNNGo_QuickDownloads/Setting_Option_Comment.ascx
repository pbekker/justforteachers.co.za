<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Option_Comment.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_Option_Comment" %>
<div class="article_setting">
    <h2 class="setting_page_title"><%=ViewTitle("lblModuleTitle", "Comment Settings")%></h2>

        <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblBaseSetting", "Basic Settings")%></h3>
        <div class="inside">
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblEnabledComment", "Enable Comment", "rblEnabledComment")%>:</h4>
                <asp:RadioButtonList ID="rblEnabledComment" runat="server" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblLoginComment", "Require login to comment", "rblLoginComment")%>:</h4>
                <asp:RadioButtonList ID="rblLoginComment" runat="server" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblCommentNotification", "Enable Comment Notification", "rblCommentNotification")%>:</h4>
                <asp:RadioButtonList ID="rblCommentNotification" runat="server" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </div>
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblNumberComments", "Number of Comments per page", "txtNumberComments")%>:</h4>
                <asp:TextBox runat="server" ID="txtNumberComments" Width="50px" CssClass="input_text :required :number"></asp:TextBox>
                <%=ViewHelp("lblNumberComments", "items")%>
            </div>

            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblCommentInitialstate", "Comment Initial State", "ddlCommentInitialstate")%>:</h4>
                    <asp:DropDownList  ID="ddlCommentInitialstate" runat="server"></asp:DropDownList>
            </div>
           <div class="form_field"  >
                <h4>
                    <%=ViewTitle("lblEnabledAnti-spamServices", "Enable Anti-spam services", "rblEnabledAnti_spamServices")%>:</h4>
                <asp:RadioButtonList ID="rblEnabledAnti_spamServices" runat="server" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </div>
           
        </div>
    </div>







 
  
        <div class="choose_tags form_field handlediv"  >
        <h3 class="hndle">
            <%=ViewTitle("lblFilterServices", "Anti-spam services")%></h3>
        <div class="inside">
           <asp:Panel runat="server" ID="FilterServicesPanel">
               <div class="form_field">
                    <h4>
                        <%=ViewTitle("lblApiKey", "Api Key", "txtApiKey")%>:</h4>
                        <asp:TextBox runat="server" ID="txtApiKey" Width="250px" CssClass="input_text"></asp:TextBox>
                       <asp:Panel runat="server" ID="palAkismetFilterApiKey" Visible="false">
                         <%=ViewHelp("lblAkismetFilterApiKey", "For many people, <a target='_blank' href='http://akismet.com/'>Akismet</a> will greatly reduce or even completely eliminate the comment and trackback spam you get on your site. If one does happen to get through, simply mark it as \"spam\" on the moderation screen and Akismet will learn from the mistakes. If you don't have an API key yet, you can get one at <a target=\"_blank\" href=\"http://akismet.com/get/\">Akismet.com</a>.")%>
                       </asp:Panel>
                </div>
                <div class="form_field">
                    <h4><%=ViewTitle("lblSiteURL", "Site URL", "txtSiteURL")%>:</h4>
                    <asp:TextBox runat="server" ID="txtSiteURL" Width="250px" CssClass="input_text"></asp:TextBox>
                    <%=ViewHelp("lblSiteURL", "Your blog URL")%>
                </div>
            </asp:Panel>
            <div class="form_field">
               
                 <asp:GridView ID="gvFilterServices" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvFilterServices_RowDataBound"
                                Width="100%" CellPadding="6" CssClass="table table-bordered table-striped"  GridLines="none" >
                                <RowStyle />
                                <Columns>
                                 <asp:TemplateField HeaderText="Enabled"  HeaderStyle-Width="50">
                                        <ItemTemplate>
                                        <asp:CheckBox ID="cbEnabled" runat="server" Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FilterName" HeaderText="Filter Name"  /> 
                                    <asp:BoundField DataField="CheckCount" HeaderText="Check"  /> 
                                    <asp:BoundField DataField="SpamCount" HeaderText="Spam"  /> 
                                    <asp:BoundField DataField="ErrorCount" HeaderText="Error"  /> 
                    
                                    <asp:TemplateField HeaderText="Action"  HeaderStyle-Width="80">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imbEnabled" runat="server" ToolTip="Enabled" OnCommand="imbEnabled_Command"  />
                                             &nbsp;
                                            <asp:ImageButton ID="imbRefresh" runat="server" ToolTip="Refresh" OnCommand="imbRefresh_Command" ImageUrl="~/images/action_refresh.gif" />
                                              
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
            </div>
           
        </div>
    </div>
 
    <p style="text-align: center;">
    <asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
        runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
    <asp:Button CssClass="input_button" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
        Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:Button>&nbsp;
</p>
 </div>