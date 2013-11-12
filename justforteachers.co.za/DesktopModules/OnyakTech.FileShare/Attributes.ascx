<%@ Control Language="c#" CodeBehind="Attributes.ascx.cs" Inherits="OnyakTech.FileShare.Attributes"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:Label ID="lblInfo" runat="server" CssClass="Normal"></asp:Label>
<table cellspacing="0" cellpadding="2" border="0">
    <tr>
        <td class="StepSection SubHead">
            <asp:Label ID="lblAttributes" runat="server" resourcekey="lblAttributes"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SelectionList">
            <asp:DropDownList ID="ddAttributes" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="SelectionList">
            <asp:LinkButton ID="lnkEditSelectedAttribute" resourcekey="lnkEditSelectedAttribute"
                CssClass="CommandButton" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
            <br />
            <asp:LinkButton ID="lnkRemoveAttribute" resourcekey="lnkRemoveAttribute" CssClass="CommandButton"
                BorderStyle="none" runat="server"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="Normal" style="height: 1px">
            
        </td>
    </tr>
    <tr>
        <td class="StepSection SubHead">
            <asp:Label ID="lblEditAttribute" runat="server" resourcekey="lblEditAttribute"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SelectionList">
            <table cellspacing="0" cellpadding="2" border="0">

                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblAttributeName" runat="server" resourcekey="lblAttributeName"></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtName" CssClass="Normal" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblComments" runat="server" resourcekey="lblComments"></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtComments" CssClass="Normal" runat="server" TextMode="MultiLine" Height="50px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblSQL" runat="server" resourcekey="lblSQL"></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtSQL" CssClass="Normal" runat="server" TextMode="MultiLine" Height="80px" Width="300px"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblSQLHelp" resourcekey="lblSQLHelp" CssClass="SmallHelpText" runat="server"></asp:Label>
                        <br />
                        <asp:CheckBox ID="chkIsSqlLoaded" resourcekey="chkIsSqlLoaded" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblValueTypes" runat="server" resourcekey="lblValueTypes"></asp:Label>
                    </td>
                    <td class="Normal">
                        <asp:DropDownList ID="ddTypes" runat="server">
                            <asp:ListItem Selected="True" Text="Textbox" Value="0" />
                            <asp:ListItem Selected="False" Text="Checkbox" Value="1" />
                            <asp:ListItem Selected="False" Text="Radio Button" Value="2" />
                            <asp:ListItem Selected="False" Text="Multi-Line Textbox" Value="3" />
                            <asp:ListItem Selected="False" Text="DropDown Listbox" Value="4" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Normal"></td>
                    <td class="Normal">
                        <asp:LinkButton ID="lnkAddAttribute" resourcekey="lnkAddAttribute" CssClass="CommandButton"
                            BorderStyle="none" runat="server"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
</table>
<hr />
<asp:LinkButton ID="lnkCancel" resourcekey="lnkCancel" CssClass="CommandButton" CausesValidation="False"
    BorderStyle="none" runat="server"></asp:LinkButton>