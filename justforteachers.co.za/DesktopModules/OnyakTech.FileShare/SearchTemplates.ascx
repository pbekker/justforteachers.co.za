<%@ Control Language="c#" CodeBehind="SearchTemplates.ascx.cs" Inherits="OnyakTech.FileShare.SearchTemplates"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:Label ID="lblInfo" runat="server" CssClass="Normal"></asp:Label>
<table cellspacing="0" cellpadding="2" border="0">
    <tr>
        <td class="StepSection SubHead">
            <asp:Label ID="lblTemplates" runat="server" resourcekey="lblTemplates"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SelectionList">
            <asp:DropDownList ID="ddTemplates" runat="server">
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="lnkEditSelectedTemplate" resourcekey="lnkEditSelectedTemplate"
                CssClass="CommandButton" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
            <br />
            <asp:LinkButton ID="lnkRemoveTemplate" resourcekey="lnkRemoveTemplate" CssClass="CommandButton" CausesValidation="False"
                BorderStyle="none" runat="server"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="height: 1px"></td>
    </tr>
    <tr>
        <td class="StepSection SubHead">
            <asp:Label ID="lblEditTemplate" runat="server" resourcekey="lblEditTemplate"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SelectionList">
            <table cellspacing="0" cellpadding="2" border="0">
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblTemplateName" runat="server" resourcekey="lblTemplateName"></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtName" CssClass="Normal" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblExpectedFileCount" runat="server" resourcekey="lblExpectedFileCount"></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtExpectedFileCount" CssClass="Normal" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" ControlToValidate="txtExpectedFileCount"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblTemplateAttributes" runat="server" resourcekey="lblTemplateAttributes"></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:DropDownList ID="ddAttributesToAdd" runat="server">
                        </asp:DropDownList>
                        <asp:LinkButton ID="lnkAddAttribute" resourcekey="lnkAddAttribute" CssClass="CommandButton" CausesValidation="True"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                        <br />
                        <asp:ListBox ID="lstTemplateAttributes" runat="server" />
                        <br />
                        <asp:LinkButton ID="lnkRemoveSelectedAttribute" resourcekey="lnkRemoveSelectedAttribute" CssClass="CommandButton" CausesValidation="False"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="Normal"></td>
                    <td class="Normal">
                        <asp:LinkButton ID="lnkAddTemplate" resourcekey="lnkAddTemplate" CssClass="CommandButton"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<hr />
<asp:LinkButton ID="lnkCancel" resourcekey="lnkCancel" CssClass="CommandButton" CausesValidation="False"
    BorderStyle="none" runat="server"></asp:LinkButton>