<%@ Control Language="c#" CodeBehind="FileShareEdit.ascx.cs" Inherits="OnyakTech.FileShare.FileShareEdit"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<script type="text/javascript">
    jQuery(document).ready(function () {
        var $answers = $(".content").hide(); // cache this to avoid overhead
        $(".heading").click(function () {
            var $thisA = $(this).next('div.content');
            $answers
                .filter(':visible')
                .not($thisA)
                .slideUp('slow');
            $thisA.slideDown('slow');
        });
    });
</script>
<asp:ImageButton ID="imgOnyakTech" runat="server" ToolTip="OnyakTech LLC - www.OnyakTech.com" /></br>
<asp:Label ID="lblPageHelp" resourcekey="lblPageHelp" runat="server" CssClass="Normal"></asp:Label>
<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="Normal" valign="top">
            <asp:Label ID="lblCurrentCategories" resourcekey="lblCurrentCategories" runat="server" CssClass="Normal"></asp:Label>
            <telerik:radtreeview id="chkCategory" runat="server" checkboxes="False" multipleselect="False"
                sort="Ascending">
            </telerik:radtreeview>
            <asp:LinkButton ID="lnkEditSelected" resourcekey="lnkEditSelected" CssClass="CommandButton"
                BorderStyle="none" runat="server"></asp:LinkButton><br />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="chkCategory"
                ErrorMessage="Please select a category to edit" />
            <br />
            <asp:Label ID="lblCatDetails" runat="server"></asp:Label>
        </td>
        <td class="Normal">
            <table cellspacing="0" cellpadding="2" border="0" summary="FileShare edit design table">
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblInfo" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblAddCategory" resourcekey="lblCurrentCategorieslblAddCategory" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtextbox id="txtCategory" runat="server" emptymessage="Type New Category Name Here"
                            selectiononfocus="SelectAll" skin="Outlook" width="250px">
                        </telerik:radtextbox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCategory"
                            ErrorMessage="***" Font-Bold="True" ValidationGroup="NewCat"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblCategoryDescription" resourcekey="lblCategoryDescription" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:radtextbox id="txtCategoryDescription" runat="server" selectiononfocus="SelectAll"
                            emptymessage="Type a description for this Category here" TextMode="MultiLine"
                            skin="Outlook" width="250px" height="30px">
                        </telerik:radtextbox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblCategoryKeyWords" resourcekey="lblCategoryKeyWords" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:radtextbox id="txtKeyWords" runat="server" selectiononfocus="SelectAll"
                            emptymessage="Type key words specific to this category" TextMode="MultiLine"
                            skin="Outlook" width="250px" height="30px">
                        </telerik:radtextbox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblCategoryImage" resourcekey="lblCategoryImage" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtextbox id="txtCategoryImage" runat="server" emptymessage="Image URL - Or Leave Empty"
                            selectiononfocus="SelectAll" skin="Outlook" width="250px">
                        </telerik:radtextbox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblAWSAccessKeyId" resourcekey="lblAWSAccessKeyId" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtextbox id="txtAWSAccessKeyId" runat="server" emptymessage="Amazon S3 Access Key Id - Or Leave Empty"
                            selectiononfocus="SelectAll" skin="Outlook" width="250px">
                        </telerik:radtextbox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblAWSSecretAccessKey" resourcekey="lblAWSSecretAccessKey" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtextbox id="txtASWSSecretAccessKey" runat="server" emptymessage="Amazon S3 Secret Access Key - Or Leave Empty"
                            selectiononfocus="SelectAll" skin="Outlook" width="250px">
                        </telerik:radtextbox>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblUNCPath" resourcekey="lblUNCPath" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtextbox id="txtUNCPath" runat="server" emptymessage="Network Path (UNC) - Or Leave Empty"
                            selectiononfocus="SelectAll" skin="Outlook" width="250px">
                        </telerik:radtextbox>&nbsp;&nbsp;
                        <asp:LinkButton ID="lnkSetLocalUNCPath" resourcekey="lnkSetLocalUNCPath" CssClass="CommandButton"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Normal"></td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblAuthorizedUsers" resourcekey="lblAuthorizedUsers" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:radtextbox id="txtUserName" runat="server" selectiononfocus="SelectAll"
                            skin="Outlook" width="250px">
                        </telerik:radtextbox>
                        <asp:LinkButton ID="lnkAddUser" resourcekey="lnkAddUser" CssClass="CommandButton"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="lnkClearUsers" resourcekey="lnkClearUsers" CssClass="CommandButton"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUsersCurrentlyAuthorized" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:CheckBox ID="chkEnableEmails" resourcekey="chkEnableEmails" runat="server" Checked="True" />
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblAttributes" resourcekey="lblAttributes" runat="server" CssClass="Normal"></asp:Label>
                        <asp:DropDownList ID="ddAttributes" runat="server">
                        </asp:DropDownList>
                        <asp:LinkButton ID="lnkAddAttribute" resourcekey="lnkAddAttribute"
                            CssClass="CommandButton" CausesValidation="True" ValidationGroup="NewCat" BorderStyle="none" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtreeview id="chkRequiredAttributes" runat="server" checkboxes="True" multipleselect="True"
                            sort="Ascending">
                        </telerik:radtreeview>
                        <asp:LinkButton ID="lnkRemovedSelectedAttributes" resourcekey="lnkRemovedSelectedAttributes"
                            CssClass="CommandButton" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lnkMoveSelectedDown" resourcekey="lnkMoveSelectedDown"
                            CssClass="CommandButton" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lnkMoveSelectedUp" resourcekey="lnkMoveSelectedUp"
                            CssClass="CommandButton" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtreeview id="chkRoles" runat="server" checkboxes="True" multipleselect="True"
                            sort="Ascending">
                        </telerik:radtreeview>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <telerik:radtreeview id="chkSecureRoles" runat="server" checkboxes="True" multipleselect="True"
                            sort="Ascending">
                        </telerik:radtreeview>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:LinkButton ID="cmdAddCategory" resourcekey="cmdAddCategory" CssClass="CommandButton"
                            BorderStyle="none" runat="server" ValidationGroup="NewCat"></asp:LinkButton>
                        <asp:LinkButton ID="lnkUpdateCategory" resourcekey="lnkUpdateCategory" CssClass="CommandButton"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="lnkRemoveCategory" resourcekey="lnkRemoveCategory" CssClass="CommandButton"
                            BorderStyle="none" runat="server"></asp:LinkButton><br />
                        <asp:LinkButton ID="lnkClear" resourcekey="lnkClear" CssClass="CommandButton" BorderStyle="none"
                            runat="server"></asp:LinkButton>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="chkCategory"
                            ErrorMessage="Please select a parent category from the Category Tree on the left of this screen."
                            ValidationGroup="NewCat" />
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblCatURL" runat="server" CssClass="Normal"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:LinkButton ID="cmdCancel" resourcekey="cmdCancel" CssClass="CommandButton" CausesValidation="False"
    BorderStyle="none" runat="server"></asp:LinkButton>
<asp:Label ID="lblRSSFeedURL" resourcekey="lblRSSFeedURL" runat="server" CssClass="Normal" Visible="False"></asp:Label>
<telerik:radtextbox id="txtRSSFeedURL" runat="server" emptymessage="RSS URL - Or Leave Empty"
    selectiononfocus="SelectAll" skin="Outlook" width="250px" Visible="False">
</telerik:radtextbox>
<asp:CheckBox ID="chkIsRSS" resourcekey="chkIsRSS" runat="server" Checked="False"
    Visible="False" />