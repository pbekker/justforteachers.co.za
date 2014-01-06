<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceBundleAddEdit.ascx.cs" Inherits="Blackhouse.Resources.ResourceBundleAddEdit" %>

<asp:HiddenField runat="server" ID="hidResourceFileId" Value="" />
<div runat="server" id="divSelectBundle">
    <div>
        <asp:Label runat="server" ID="lblBundleId" Text="Please select a bundle: " />
        <asp:DropDownList runat="server" ID="ddBundleId" style="height: 22px" />
    </div>
    <div>
        <asp:LinkButton runat="server" ID="cmdAddResourceToBundle" Text="Add Resource to Bundle" OnClick="cmdAddResourceToBundle_Click" />
        <asp:LinkButton runat="server" ID="cmdAddBundle" Text="Add new Bundle" OnClick="cmdAddBundle_Click" />
        <asp:LinkButton runat="server" ID="cmdCancelResource" Text="Cancel" OnClick="cmdCancelResource_Click" />
    </div>
</div>
<div runat="server" id="divAddBundle" visible="false">
    <div>
        <div>
            <asp:Label runat="server" ID="lblLabelBundleName" Text="Bundle Name: " />
            <asp:TextBox runat="server" ID="txtBundleName" />
        </div>
        <div>
            <asp:Label runat="server" ID="lblBundleDescription" Text="Bundle Description: " />
            <asp:TextBox runat="server" ID="txtBundleDescription" />
        </div>
        <div>
            <asp:LinkButton runat="server" ID="cmdSaveBundle" Text="Save" OnClick="cmdSaveBundle_Click" />
            <asp:LinkButton runat="server" ID="cmdCancelBundle" Text="Cancel" OnClick="cmdCancelBundle_Click" />
        </div>
    </div>
</div>