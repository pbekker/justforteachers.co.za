<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="ToSIC.Modules.SexyContent.Installer.View" %>
<asp:Panel runat="server" ID="pnlNotInstalled">
    <p><asp:Label runat="server" ID="lblNotInstalledIntro" ResourceKey="lblNotInstalledIntro"></asp:Label></p>
    <asp:Label runat="server" ID="lblChooseVersion" ResourceKey="lblChooseVersion"></asp:Label> <asp:DropDownList runat="server" ID="ddlSelectVersion" DataTextField="Text" DataValueField="Value" AutoPostBack="true"></asp:DropDownList><br /><br />

    <table>
        <tr>
            <td class="sc-releaseinfo-header"><asp:Label runat="server" ID="lblReleaseTitleHeader" ResourceKey="lblReleaseTitleHeader"></asp:Label></td>
            <td><asp:Label runat="server" ID="lblReleaseTitle"></asp:Label></td>
        </tr>
        <tr>
            <td class="sc-releaseinfo-header"><asp:Label runat="server" ID="lblReleaseTitleVersion" ResourceKey="lblReleaseTitleVersion"></asp:Label></td>
            <td><asp:Label runat="server" ID="lblReleaseVersion"></asp:Label></td>
        </tr>
        <tr>
            <td class="sc-releaseinfo-header"><asp:Label runat="server" ID="lblReleaseTitleStatus" ResourceKey="lblReleaseTitleStatus"></asp:Label></td>
            <td><asp:Label runat="server" ID="lblReleaseDevelopmentStatus"></asp:Label></td>
        </tr>
        <tr>
            <td class="sc-releaseinfo-header"><asp:Label runat="server" id="lblReleaseTitleComments" ResourceKey="lblReleaseTitleComments"></asp:Label></td>
            <td><asp:Label runat="server" ID="lblReleaseDescription"></asp:Label></td>
        </tr>
    </table>

    <h3><asp:Label runat="server" ID="lblCheckRequirements" ResourceKey="lblCheckRequirements"></asp:Label></h3>
    <asp:PlaceHolder ID="phMessages" runat="server"></asp:PlaceHolder>
    <ul class="dnnActions dnnClear">
        <li>
            <asp:LinkButton CssClass="dnnPrimaryAction sc-installbutton" runat="server" ID="btnInstall" OnClick="btnInstall_Click" ResourceKey="btnInstall"></asp:LinkButton>
        </li>
        <li>
            <asp:Hyperlink Target="_blank" CssClass="dnnSecondaryAction" runat="server" ID="hlkInstallManually" ResourceKey="hlkInstallManually"></asp:Hyperlink>
        </li>
    </ul>
    <asp:Label runat="server" ResourceKey="lblLicenseNotes"></asp:Label>
</asp:Panel>
<asp:Panel runat="server" ID="pnlInstalled" Visible="false">
    <div class="dnnFormMessage dnnFormSuccess"><asp:Label runat="server" ID="lblAlreadyInstalledTitle" ResourceKey="lblAlreadyInstalledTitle"></asp:Label></div>
    <h2><asp:Label runat="server" ID="lblAlreadyInstalled" ResourceKey="lblAlreadyInstalled"></asp:Label></h2>
    
    <h3><asp:Label runat="server" ID="lblDiscover" ResourceKey="lblDiscover"></asp:Label></h3>
    <p><asp:Label runat="server" ID="lblDiscoverText" ResourceKey="lblDiscoverText"></asp:Label></p>

    <h3><asp:Label runat="server" ID="lblAddToCommonModulesTitle" ResourceKey="lblAddToCommonModulesTitle"></asp:Label></h3>
    <p>
        <asp:Label ID="Label1" runat="server" ResourceKey="lblAddToCommonModulesNotes"></asp:Label>
        <asp:Label runat="server" ID="lblAlreadyAddedToCommonModules" ResourceKey="lblAlreadyAddedToCommonModules" Visible="false"></asp:Label>
    </p>
    <asp:LinkButton CssClass="dnnPrimaryAction" runat="server" ID="btnAddToCommonModules" ResourceKey="btnAddToCommonModules" OnClick="btnAddToCommonModules_Click"></asp:LinkButton>

    <h3><asp:Label runat="server" ID="lblRecommendedPackagesTitle" ResourceKey="lblRecommendedPackagesTitle"></asp:Label></h3>
    <asp:Repeater runat="server" ID="rptRecommendedPackages">
        <ItemTemplate>
            <div><b><%# Eval("Title") %></b><br /><%# Eval("Description") %><br /><a href='<%# Eval("Url") %>' target="_blank"><asp:Label runat="server" ID="lblDownload" ResourceKey="lblDownload"></asp:Label></a></div><br />
        </ItemTemplate>
    </asp:Repeater>

    <h3><asp:Label runat="server" ID="lblStayTunedTitle" ResourceKey="lblStayTunedTitle"></asp:Label></h3>
    <p><asp:Label runat="server" ID="lblStayTunedText" ResourceKey="lblStayTunedText"></asp:Label></p>

    <asp:LinkButton CssClass="dnnPrimaryAction" runat="server" ID="btnInstallDemoPackage" ResourceKey="btnInstallDemoPackage" OnClick="btnInstallDemoPackage_Click" Visible="false"></asp:LinkButton>
    <asp:LinkButton CssClass="dnnPrimaryAction" runat="server" ID="btnRemoveInstaller" ResourceKey="btnRemoveInstaller" OnClick="btnRemoveInstaller_Click" Visible="false"></asp:LinkButton>
</asp:Panel>
<asp:Panel runat="server" ID="pnlError" Visible="false">
    <div class="dnnFormMessage dnnFormInfo">
        <asp:Label runat="server" ID="lblNotInstalledTitle" ResourceKey="lblNotInstalledTitle"></asp:Label><br /><br />
        <asp:Label runat="server" ID="lblNotInstalledText"></asp:Label>
    </div>
</asp:Panel>