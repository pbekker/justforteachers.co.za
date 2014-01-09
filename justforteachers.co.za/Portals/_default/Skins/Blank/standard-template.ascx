<%@ Control language="vb" CodeBehind="~/admin/Skins/skin.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>

<%@ Register TagPrefix="dnn" TagName="Meta" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CURRENTDATE" Src="~/Admin/Skins/CurrentDate.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/Admin/Skins/controlpanel.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>


<dnn:Meta runat="server" Name="viewport" Content="width=device-width, user-scalable=no, maximum-scale=1.0" />

<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,700' rel='stylesheet'>
<link rel="stylesheet" href="<%=skinpath%>css/screen.css" />



<div class="toolbar">
	<div class="toolbar-inner">
		<dnn:USER ID="dnnUser" runat="server" LegacyMode="false" />
		<dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />		
	</div>
</div>
<div class="navbar">
	<div class="navbar-inner">
		<dnn:LOGO runat="server" id="dnnLOGO" CssClass="logo" />
		<ul class="menu">
			<dnn:MENU MenuStyle="StandardMenu" runat="server"></dnn:MENU>
		</ul>
	</div>
</div>

<div class="header" style="background-image:url(<%=skinpath%>img/03337_bluemountains_3840x2400.jpg)">
	<h1 class="page-title"><%= Server.HtmlEncode(PortalSettings.ActiveTab.TabName) %></h1>
</div>

<div class="content">
	<div class="content-section">
		<div class="content-inner">
			<div id="ContentPane" class="content-pane" runat="server"></div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="RightPane" class="right-pane" runat="server"></div>
			<div id="LeftPane" class="content-pane" runat="server"></div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="BottomPane" class="content-pane" runat="server"></div>
		</div>
	</div>
	<div class="footer">
		<ul class="footer-inner">
			<dnn:MENU MenuStyle="StandardMenu" runat="server"></dnn:MENU>
		</ul>
	</div>
</div>

