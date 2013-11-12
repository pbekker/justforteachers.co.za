<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Setting_Option_AddThis.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.Setting_Option_AddThis" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<div class="article_setting">
    <h2 class="setting_page_title">
        <%=ViewTitle("lblModuleTitle", "AddThis Settings")%></h2>
    <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblBaseSetting", "Base Setting")%></h3>
        <div class="inside">
            <div class="form_field">
                <h4>
                    <%=ViewTitle("lblSharingTool", "Choose the sharing tool to display the post", "rblSharingTool")%>:</h4>
                    <asp:RadioButtonList runat="server" ID="rblSharingTool" RepeatDirection="Vertical"></asp:RadioButtonList>
            </div>
            <div class="form_field" style="display:none;" id="CustomSharingTool">
                <%=ViewHelp("lblCustomSharingTool", "This text box allows you to enter any AddThis markup that you wish. To see examples of what you can do, visit <a href='https://www.addthis.com/get/sharing'>AddThis.com Sharing Tools</a> and select any sharing tool. You can also check out our <a href='http://support.addthis.com/customer/portal/articles/381263-addthis-client-api#rendering-decoration'>Client API</a>. For any help you may need, please visit <a href='http://support.addthis.com'>AddThis Support</a>")%>
                 <asp:TextBox runat="server" ID="txtCustomSharingTool" Width="95%" Height="120" TextMode="MultiLine"
                    Rows="8" CssClass=":max_length;2000"></asp:TextBox>
            </div>
        </div>
    </div>
 
  <div class="choose_tags form_field handlediv">
        <h3 class="hndle">
            <%=ViewTitle("lblAnalyticsReports", "analytics reports")%></h3>
        <div class="inside">
         <div class="form_field">
            <%=ViewHelp("lblAnalyticsReports", "<a href='https://www.addthis.com/register?profile=wpp' target='_blank'>Register</a> for free in-depth analytics reports and better understand your site's social traffic.")%>
          </div>
            <div class="form_field">
                <h4><%=ViewTitle("lblAddThisProfileID", "AddThis profile ID", "txtAddThisProfileID")%>:</h4>
                <asp:TextBox runat="server" ID="txtAddThisProfileID" Width="160px" CssClass="input_text"></asp:TextBox>
            </div>
            <!--
            <div class="form_field">
                <h4><%=ViewTitle("lblAddThisUsername", "AddThis email / username", "txtAddThisUsername")%>:</h4>
                <asp:TextBox runat="server" ID="txtAddThisUsername" Width="160px" CssClass="input_text"></asp:TextBox>
            </div>
            <div class="form_field">
                <h4><%=ViewTitle("lblAddThisPassword", "AddThis password", "txtAddThisPassword")%>:</h4>
                <asp:TextBox runat="server" ID="txtAddThisPassword" Width="160px" CssClass="input_text"></asp:TextBox>
                 <%=ViewHelp("lblAddThisPassword", "required for displaying stats")%>
            </div>
            -->
        </div>
    </div>


 
   
</div>
<p style="text-align: center;">
    <asp:Button CssClass="input_button" lang="Submit" ID="cmdUpdate" resourcekey="cmdUpdate"
        runat="server" Text="Update" OnClick="cmdUpdate_Click"></asp:Button>&nbsp;
    <asp:Button CssClass="input_button" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
        Text="Cancel" CausesValidation="False" OnClick="cmdCancel_Click"></asp:Button>&nbsp;
</p>



<script type="text/javascript">
    jQuery(function (q) {
        q("#<%=rblSharingTool.ClientID%> input[type='radio']").each(function (i) {

            q(this).click(function () {
                if (q(this).val() == 0)
                    q("#CustomSharingTool").show();
                else
                    q("#CustomSharingTool").hide();
            });

        });

        if (q("#<%=rblSharingTool.ClientID%> input[type='radio'][checked='checked']").val() == 0)
            q("#CustomSharingTool").show();
        else
            q("#CustomSharingTool").hide();



    });
</script>