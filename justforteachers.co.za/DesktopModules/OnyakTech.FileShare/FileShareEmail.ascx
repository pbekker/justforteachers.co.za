<%@ Control Language="c#" CodeBehind="FileShareEmail.ascx.cs" Inherits="OnyakTech.FileShare.FileShareEmail" TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:ImageButton ID="imgOnyakTech" runat="server" ToolTip="OnyakTech LLC - www.OnyakTech.com" />&nbsp;
<table cellspacing="0" cellpadding="2" border="0" summary="XShadow edit design table">
    <tr>
        <td class="StepSection SubHead">
            <asp:Label ID="lblEmailSubscriptions" runat="server" resourcekey="lblEmailSubscriptions"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SelectionList" colspan="2">
            <telerik:RadGrid id="grdEmails" runat="server" allowfilteringbycolumn="True" allowpaging="True"
                allowsorting="True" autogeneratecolumns="False" CssClass="Normal" enableasyncrequests="True"
                gridlines="None" pagesize="15" showfooter="True" showgrouppanel="True" Skin="WebBlue">
                <clientsettings allowcolumnsreorder="True" allowdragtogroup="True" reordercolumnsonclient="True"></clientsettings>
                <mastertableview allowfilteringbycolumn="True" datakeynames="EmailSubscriptionId">
            <Columns>
            <telerik:GridBoundColumn DataField="EmailSubscriptionId" UniqueName="EmailSubscriptionId" HeaderText="#" Display="False" ></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EmailAddress" UniqueName="EmailAddress" HeaderText="EmailAddress"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="UserID" UniqueName="UserID" HeaderText="UserID"  ></telerik:GridBoundColumn>            
            <telerik:GridBoundColumn DataField="DateCreated" UniqueName="DateCreated" HeaderText="Date Created" Display="True" ></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Category" UniqueName="Category" HeaderText="Category" Display="True" ></telerik:GridBoundColumn>
            <telerik:GridTemplateColumn UniqueName="TemplateRemove"><ItemTemplate>
                                            <a runat="server" id="RemoveAnchor" title="Remove">Remove</a>                                         
            </ItemTemplate>
            </telerik:GridTemplateColumn>
            </Columns>          
            </mastertableview>
            </telerik:RadGrid>
        </td>
    </tr>
    <tr>
        <td class="StepSection SubHead">
            <asp:Label ID="lblDisplayOptions" runat="server" resourcekey="lblDisplayOptions"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="SelectionList" colspan="2">
            <uo>
                <li>
                    <asp:LinkButton ID="lnkSetForMobile" resourcekey="lnkSetForMobile" CssClass="Normal" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
                </li>
            </uo>
        </td>
    </tr>
    <tr>
        <td class="SelectionList" colspan="2">
            <uo>
                <li>
                    <asp:LinkButton ID="lnkResetCustomPermissions" resourcekey="lnkResetCustomPermissions" CssClass="Normal" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
                </li>
            </uo>
        </td>
    </tr>
</table>
<br/><br/><br/>
<asp:LinkButton ID="cmdCancel" resourcekey="cmdCancel" CssClass="CommandButton" CausesValidation="False" BorderStyle="none" runat="server"></asp:LinkButton>
