<%@ Control Language="C#" AutoEventWireup="true" CodeFile="View.ascx.cs" Inherits="Blackhouse.Menu.View" %>
<style>
</style>
<div class="menu">
    <asp:Label runat="server" ID="lblEmptyMenu" Text="The menu contains no links." Visible="false" />
    <div>
        <asp:Repeater runat="server" ID="rptMenuItems" OnItemCreated="rptMenuItems_ItemCreated" OnItemDataBound="rptMenuItems_ItemDataBound">
            <ItemTemplate>
                <div class="btn header-btn">
                    <asp:HyperLink runat="server" ID="hlMenuLink" Text="defaultText" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
