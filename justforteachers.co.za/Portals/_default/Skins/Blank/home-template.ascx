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

<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,700'>
<link rel="stylesheet" href="<%=skinpath%>css/screen.css" />
<div class="toolbar homepage">
	<div class="toolbar-inner">
		<dnn:USER ID="dnnUser" runat="server" LegacyMode="false" />
		<dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />		
	</div>
</div>
<div class="navbar homepage">
	<div class="navbar-inner">
		<dnn:LOGO runat="server" id="dnnLOGO" CssClass="logo" />
		<ul class="menu">
			<dnn:MENU MenuStyle="StandardMenu" runat="server"></dnn:MENU>
		</ul>
	</div>
</div>

<div class="header homepage" style="background-image:url(<%=skinpath%>img/03337_bluemountains_3840x2400.jpg)">
	<div class="header-blurb">
		<h1><%= Server.HtmlEncode(PortalSettings.ActiveTab.TabName) %></h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
		<a href="#" class="btn header-btn">Register</a>
		<a href="#" class="btn header-btn">Sign In</a>
	</div>
</div>

<div class="content">
	<div class="content-section">
		<div class="content-inner">
			<div class="feature-block">
				<span data-icon="&#xe608;" class="feature-icon"></span>
				<h2 class="feature-title">Teaching Jobs</h2>
				<p class="feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="feature-block">
				<span data-icon="&#xe607;" class="feature-icon"></span>
				<h2 class="feature-title">Resources</h2>
				<p class="feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="feature-block">
				<span data-icon="&#xe602;" class="feature-icon"></span>
				<h2 class="feature-title">Community</h2>

				<p class="feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="feature-block">
				<span data-icon="&#xe608;" class="feature-icon"></span>
				<h2 class="feature-title">Teaching Jobs</h2>
				<p class="feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="feature-block">
				<span data-icon="&#xe607;" class="feature-icon"></span>
				<h2 class="feature-title">Resources</h2>
				<p class="feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="feature-block">
				<span data-icon="&#xe602;" class="feature-icon"></span>
				<h2 class="feature-title">Community</h2>

				<p class="feature-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="TopPane" class="content-pane" runat="server"></div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="TopRightPane" class="right-pane" runat="server"></div>
			<div id="TopLeftPane" class="left-pane" runat="server"></div>
			<div id="TopCenterPane" class="content-pane" runat="server"></div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="ContentPane" class="content-pane" runat="server">
			</div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="LeftPane" class="half-pane" runat="server"></div>
			<div id="LRightPane" class="half-pane" runat="server"></div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="ContentPane2" class="content-pane" runat="server">
			</div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="BottomRightPane" class="right-pane" runat="server"></div>
			<div id="BottomLeftPane" class="left-pane" runat="server"></div>
			<div id="BottomCenterPane" class="content-pane" runat="server"></div>
		</div>
	</div>
	<div class="content-section">
		<div class="content-inner">
			<div id="BottomPane" runat="server">
			</div>
		</div>
	</div>
	<div class="footer">
		<ul class="footer-inner">
			<dnn:MENU MenuStyle="StandardMenu" runat="server"></dnn:MENU>
		</ul>
	</div>
</div>

