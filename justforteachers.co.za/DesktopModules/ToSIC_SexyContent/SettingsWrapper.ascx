<%@ Control Language="C#" AutoEventWireup="true" Inherits="ToSIC.Modules.SexyContent.SettingsWrapper" Codebehind="SettingsWrapper.ascx.cs" %>
<%@ Register TagPrefix="SexyContent" TagName="SettingsControl" Src="Settings.ascx" %>

<SexyContent:SettingsControl runat="server" id="SettingsControl" />
<div class="dnnForm">
    <ul class="dnnActions">
        <li>
            <asp:LinkButton runat="server" ID="btnSave" class="dnnPrimaryAction" onclick="btnSave_Click" ResourceKey="btnSave"></asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" class="dnnSecondaryAction" onclick="btnCancel_Click" ResourceKey="btnCancel"></asp:LinkButton>
        </li>
    </ul>
</div>