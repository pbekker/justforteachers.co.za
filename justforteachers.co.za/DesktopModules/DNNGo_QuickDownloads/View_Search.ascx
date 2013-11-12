<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View_Search.ascx.cs" Inherits="DNNGo.Modules.QuickDownloads.View_Search" %>
<asp:Literal ID="liContent" runat="server"></asp:Literal>
<asp:Button runat="server" ID="SearchButton" OnClick="SearchButton_Click" Visible="false" OnClientClick="CancelValidation();" />