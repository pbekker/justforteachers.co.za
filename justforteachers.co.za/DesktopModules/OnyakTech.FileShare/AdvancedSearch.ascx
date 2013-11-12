<%@ Control Language="c#" CodeBehind="AdvancedSearch.ascx.cs" Inherits="OnyakTech.FileShare.AdvancedSearch"
    TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2011.1.519.35, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<asp:Label ID="lblInfo" runat="server" CssClass="Normal"></asp:Label>
<table cellspacing="0" cellpadding="2" border="0">
    <tr>
        <td class="StepSectionNoBorder SubHead">
            <asp:Label ID="lblAdvancedSearch" runat="server" resourcekey="lblAdvancedSearch"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SelectionList">
            <asp:DropDownList ID="ddTemplates" runat="server">
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="lnkLoadTemplate" resourcekey="lnkLoadTemplate" CssClass="CommandButton" CausesValidation="False"
                BorderStyle="none" runat="server"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <table class="Normal" width="100%" id="tblRunTable" runat="server"></table>
        </td>
    </tr>
    <tr>
        <td class="Normal">
            <asp:Label ID="lblTemplateHeaderInfo" runat="server" CssClass="SubDetails"></asp:Label>
            <asp:LinkButton ID="lnkSearch" resourcekey="lnkSearch" CssClass="searchbutton" CausesValidation="False"
                BorderStyle="none" runat="server"></asp:LinkButton>
        </td>
    </tr>
    <tr id="rwSearchHeader" runat="server">
        <td class="StepSectionNoBorder SubHead" >
            <asp:Label ID="lblSearchFiles" runat="server" resourcekey="lblSearchFiles"></asp:Label>
        </td>
    </tr>
    <tr id="rwSearchResults" runat="server">
        <td class="SelectionList" >
            <table cellspacing="0" cellpadding="2" border="0">
                <tr>
                    <td class="Normal">
                        <telerik:RadGrid ID="grdMain" runat="server" Style="z-index: 0;" AllowFilteringByColumn="False"
                            AllowSorting="False" ShowFooter="False" ShowGroupPanel="False" AllowPaging="False"
                            Skin="WebBlue" CssClass="Normal" AutoGenerateColumns="True">
                            <clientsettings>
                                <Selecting AllowRowSelect="true"></Selecting>
                            </clientsettings>
                            <mastertableview autogeneratecolumns="True" tablelayout="Auto">
                                <Columns>
                                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn"></telerik:GridClientSelectColumn>
                                </Columns>
                            </mastertableview>
                        </telerik:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label ID="lblSaveSearch" runat="server" resourcekey="lblSaveSearch"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Normal">
                        <asp:Label runat="server" ID="lblSearchName" resourcekey="lblSearchName"></asp:Label>
                        <asp:TextBox runat="server" ID="txtSearchName"></asp:TextBox>
                        <asp:DropDownList ID="ddCategory" runat="server"></asp:DropDownList>
                        <br />
                        <asp:LinkButton CssClass="searchbutton" ID="lnkSaveSearch" runat="server" resourcekey="lnkSaveSearch" CausesValidation="False"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<hr />
<asp:LinkButton ID="lnkCancel" resourcekey="lnkCancel" CssClass="CommandButton" CausesValidation="False"
    BorderStyle="none" runat="server"></asp:LinkButton>
