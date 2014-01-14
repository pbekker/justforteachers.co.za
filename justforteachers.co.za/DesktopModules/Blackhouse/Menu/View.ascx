<%@ Control Language="C#" AutoEventWireup="true" CodeFile="View.ascx.cs" Inherits="Blackhouse.Menu.View" %>
<style>
    .box {
        padding: 1px 2px;
        display: inline-block;
        border: 1px solid #E5E5E5;
        color: #3498db;
        text-decoration: none;
        border-radius: 1px;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
        background-color: #ECECEC;
        width: 100%;
        text-align: center;
    }

    .btn {
        padding: 10px 20px;
        display: inline-block;
        border: 1px solid #3498db;
        color: #3498db;
        text-decoration: none;
        border-radius: 4px;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
    }

    .header-btn {
        background: #fff;
        color: #3498db;
        border-color: #fff;
        -webkit-transition: all 0.15s ease-out;
        -moz-transition: all 0.15s ease-out;
        transition: all 0.15s ease-out;
    }

    .header-btn:hover {
          background: #3498db;
          color: #fff;
          border-color: #3498db;
        }
</style>
<div class="box">
    <asp:Label runat="server" ID="lblEmptyMenu" Text="The menu contains no links." Visible="false" />
    <div>
        <asp:Repeater runat="server" ID="rptMenuItems" OnItemDataBound="rptMenuItems_ItemDataBound">
            <ItemTemplate>
                <div class="btn header-btn">
                    <asp:HyperLink runat="server" ID="hlMenuLink" Text="defaultText" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
