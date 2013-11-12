<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ICON" Src="~/Admin/Containers/Icon.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>

<div class="Container06_style">
  <div class="Container06_top_bg">
    <div class="Container06_top_left">
      <div class="Container06_top_light">
        <div class="c_icon Container06_top_height">
          <dnn:ICON runat="server" id="dnnICON" />
        </div>
        <div class="c_title Container06_top_height">
          <dnn:TITLE runat="server" id="dnnTITLE"  CssClass="c_title_white" />
        </div>
        <div class="Container06_c_menu">
          <dnn:ACTIONS runat="server" id="dnnACTIONS"  ProviderName="DNNMenuNavigationProvider" ExpandDepth="1" PopulateNodesFromClient="True" />
        </div>
        <div class="Container06_c_help">
          <dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON5" CommandName="ModuleHelp.Action" DisplayIcon="True" DisplayLink="False" />
        </div>
        <div class="clear_float"></div>	
      </div>
    </div>
  </div>
  <div class="c_content_style">
    <div id="ContentPane" runat="server" class="Container06_content"></div>
  </div>
  <div class="c_footer">
    <div class="c_footer_l">
      <dnn:ACTIONBUTTON runat="server" ID="dnnACTIONBUTTON1" CommandName="AddContent.Action" DisplayIcon="True" DisplayLink="True" />
    </div>
    <div class="c_footer_r">
      <dnn:ACTIONBUTTON runat="server" ID="dnnACTIONBUTTON2" CommandName="SyndicateModule.Action" DisplayIcon="True" DisplayLink="false" />
      <dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON3" CommandName="PrintModule.Action" DisplayIcon="True" DisplayLink="False" />
      <dnn:ACTIONBUTTON runat="server" ID="dnnACTIONBUTTON4" CommandName="ModuleSettings.Action" DisplayIcon="True" DisplayLink="false" />
    </div>
	<div class="clear_float"></div>
  </div>
</div>
<div class="Container06_shadow_left">
  <div class="Container06_shadow_right">
    <div class="Container06_shadow_center"></div>
  </div>
</div>







