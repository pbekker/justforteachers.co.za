<%@ Control Language="C#" AutoEventWireup="true" Inherits="ToSIC.Modules.SexyContent.Settings" Codebehind="Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div class="dnnForm dnnEAVEditItem dnnClear">
    <h2 class="dnnFormSectionHead" runat="server" id="dnnSitePanelSexyContentSettings">
        <asp:Label runat="server" ID="lblSettingsHeading" ResourceKey="lblSettingsHeading"></asp:Label></h2>
    <div class="dnnFormItem" runat="server" id="pnlTemplate">
        <dnn:Label ID="lblTemplate" runat="server" ControlName="ddlTemplate" Suffix=":"></dnn:Label>
        <asp:DropDownList runat="server" ID="ddlTemplate" DataTextField="Name" DataValueField="TemplateID"
            AppendDataBoundItems="true">
            <asp:ListItem ResourceKey="ddlTemplateDefaultItem" Value="-1"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="lblContentType" runat="server" ControlName="lblContentType" Suffix=":" />
        <asp:Label ID="lblContentTypeDefaultText" runat="server" ResourceKey="lblContentTypeDefaultText"></asp:Label>
        <asp:Label ID="lblContentTypeText" Visible="false" runat="server"></asp:Label>
    </div>
    <div class="dnnFormItem" runat="server" id="pnlEntities">
        <dnn:Label ID="lblEntityID" runat="server" ControlName="EntityID" Suffix=":" />
        <asp:DropDownList ID="ddlEntities" runat="server" DataTextField="EntityTitle" DataValueField="EntityID"
            AppendDataBoundItems="true">
            <asp:ListItem ResourceKey="ddlEntitiesDefaultItem" Value="-1"></asp:ListItem>
        </asp:DropDownList>
    </div>
</div>
