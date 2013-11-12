<%@ Control Language="c#" CodeBehind="FileShareSetting.ascx.cs" Inherits="OnyakTech.FileShare.FileShareSetting"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:ImageButton ID="imgOnyakTech" runat="server" ToolTip="OnyakTech LLC - www.OnyakTech.com" />
<table cellspacing="0" cellpadding="2" border="0" summary="FileShare setting design table">
    <tr>
        <td class="Normal">
            <asp:Label ID="lblCatFilter" runat="server" resourcekey="lblCatFilter"></asp:Label>
            <asp:DropDownList ID="ddCategories" runat="server" AutoPostBack="False">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkEnableSimpleMode" resourcekey="chkEnableSimpleMode" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkEnableAdvancedSearch" resourcekey="chkEnableAdvancedSearch" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkEnableJQueryMobile" resourcekey="chkEnableJQueryMobile" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowDisplayToggle" resourcekey="chkAllowDisplayToggle" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkShowDataGrid" resourcekey="chkShowDataGrid" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkTop40Only" resourcekey="chkTop40Only" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowAttributeSearch" resourcekey="chkAllowAttributeSearch" runat="server" Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkRemovePaging" resourcekey="chkRemovePaging" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkModuleInstanceFilesOnly" resourcekey="chkModuleInstanceFilesOnly" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkShowOnlyCategporiesCreatedWithThisInstance" resourcekey="chkShowOnlyCategporiesCreatedWithThisInstance" runat="server"
                Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkHideCategoryTree" resourcekey="chkHideCategoryTree" runat="server"
                Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkHideCategoryLinks" resourcekey="chkHideCategoryLinks" runat="server"
                Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowEmailSubscriptions" resourcekey="chkAllowEmailSubscriptions"
                runat="server" Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkShowSearch" resourcekey="chkShowSearch" runat="server" Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkEnableEncryption" resourcekey="chkEnableEncryption" runat="server"
                Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkEnableSingleFileDownload" resourcekey="chkEnableSingleFileDownload" runat="server"
                Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkEnableAnonUserSingleFileDownload" resourcekey="chkEnableAnonUserSingleFileDownload" runat="server" Checked="False" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowAnnonRating" resourcekey="chkAllowAnnonRating" runat="server"
                Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowRating" resourcekey="chkAllowRating" runat="server" Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowRecentComments" resourcekey="chkAllowRecentComments" runat="server"
                Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowAnnonComment" resourcekey="chkAllowAnnonComment" runat="server"
                Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowComments" resourcekey="chkAllowComments" runat="server"
                Checked="True" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkMustBeApproved" resourcekey="chkMustBeApproved" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowPublishAcrossPortals" resourcekey="chkAllowPublishAcrossPortals"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkAllowPublishToRoles" resourcekey="chkAllowPublishToRoles" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkHideRSSOutGoing" resourcekey="chkHideRSSOutGoing" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:CheckBox ID="chkShowUserFilesOnly" resourcekey="chkShowUserFilesOnly" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblApprovedEmailSubject" runat="server" controlname="lblApprovedEmailSubject"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtApprovedEmailSubject" runat="server" emptymessage="Email Subject for New Files that have been approved"
                selectiononfocus="SelectAll" skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblApprovedEmail" runat="server" controlname="lblApprovedEmail" suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtApprovedEmail" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="500px" height="300px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblNewFileEmailSubject" runat="server" controlname="lblNewFileEmailSubject"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtNewFileEmailSubject" runat="server" emptymessage="Email Subject for New Files to be approved"
                selectiononfocus="SelectAll" skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblNewFileEmail" runat="server" controlname="lblNewFileEmail"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtNewFileEmail" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="500px" height="300px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblSubscriptionEmailSubject" runat="server" controlname="lblSubscriptionEmailSubject"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtSubscriptionEmailSubject" runat="server" emptymessage="Email Subject for New Files send to subscribers"
                selectiononfocus="SelectAll" skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblSubscriptionEmailBody" runat="server" controlname="lblSubscriptionEmailBody"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtSubscriptionEmailBody" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="500px" height="300px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblCommentEmailSubject" runat="server" controlname="lblCommentEmailSubject"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtCommentEmailSubject" runat="server" emptymessage="Email Subject for New Comments"
                selectiononfocus="SelectAll" skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblCommentEmailBody" runat="server" controlname="lblCommentEmailBody"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtEmailCommentbody" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="500px" height="300px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblDisplayTemplate" runat="server" controlname="lblDisplayTemplate"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtDisplayTemplate" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="500px" height="300px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblDisplayListItemTemplate" runat="server" controlname="lblDisplayListItemTemplate"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtDisplayListItemTemplate" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="500px" height="300px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblCommentTemplate" runat="server" controlname="lblCommentTemplate"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtFileCommentTemplate" runat="server" selectiononfocus="SelectAll"
                TextMode="MultiLine" skin="Outlook" width="500px" height="300px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblSendEmailFromAddress" runat="server" controlname="lblSendEmailFromAddress"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtSendFromAddress" runat="server" emptymessage="Email address to send emails from"
                selectiononfocus="SelectAll" skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblRedirectAfterSubmitURL" runat="server" controlname="lblRedirectAfterSubmitURL"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtNewSubmitURL" runat="server" selectiononfocus="SelectAll"
                skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblMissingImageTemplate" runat="server" controlname="lblMissingImageTemplate"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtMissingImage" runat="server" selectiononfocus="SelectAll"
                skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblEmailDeliveryTemplate" runat="server" controlname="lblEmailDeliveryTemplate"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtOrderEmailTemplate" runat="server" selectiononfocus="SelectAll"
                skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblOrderEmailToTemplate" runat="server" controlname="lblOrderEmailToTemplate"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtOrderEmailToTemplate" runat="server" selectiononfocus="SelectAll"
                skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <dnn:label id="lblCheckOutItemListing" runat="server" controlname="lblCheckOutItemListing"
                suffix=":">
            </dnn:label>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:radtextbox id="txtCheckOutItemListing" runat="server" selectiononfocus="SelectAll"
                skin="Outlook" width="500px">
            </telerik:radtextbox>
        </td>
    </tr>
</table>
<asp:CheckBox ID="chkAllowPublishToUser" resourcekey="chkAllowPublishToUser" runat="server"
    Visible="False" />
<asp:CheckBox ID="chkShowCategorySelection" resourcekey="chkShowCategorySelection"
    runat="server" Checked="True" Visible="false" />

<asp:CheckBox ID="chkAllowFileAttachments" resourcekey="chkAllowFileAttachments"
    runat="server" Checked="True" Visible="false" />
<asp:CheckBox ID="chkRSSApprovalRequired" resourcekey="chkRSSApprovalRequired" runat="server"
    Checked="True" Visible="false" />
<asp:Label ID="lblTemplateTags" runat="server" resourcekey="lblTemplateTags" CssClass="Normal"></asp:Label><br />
<asp:Label ID="lblTemplateSamples" runat="server" CssClass="Normal"></asp:Label>