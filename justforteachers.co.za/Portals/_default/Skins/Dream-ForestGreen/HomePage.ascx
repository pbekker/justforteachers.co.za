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
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<dnn:Meta runat="server" Name="viewport" Content="width=device-width, minimum-scale=1.0, maximum-scale=2.0" />

<div id="ControlPanelWrapper">
  <dnn:CONTROLPANEL runat="server" id="cp" IsDockable="True" />
</div>
<div id="skin_wrap">
  <div class="skin_top">
    <div class="skin_width clearafter">
	  <div class="currentdate_style floatl">
	    <dnn:CURRENTDATE runat="server" id="dnnCURRENTDATE" cssclass="Currentdate" />
	  </div>
	  <div class="language_style">
	    <dnn:LANGUAGE runat="server" id="dnnLANGUAGE"  showMenu="False" showLinks="True" />
	  </div>
	  <div class="search_style">
	    <div id="Search">
		  <dnn:SEARCH runat="server" id="dnnSEARCH" cssClass="searchcss" showWeb="false" showSite="false" UseDropdownlist="false" />
	    </div>
	  </div>
	  <div id="Login">
	    <dnn:USER ID="dnnUser" runat="server" LegacyMode="false" /><dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
      </div>
	</div>  
  </div>
  <div class="skin_header">
    <div class="skin_header_light">
      <div class="skin_width">
	    <div class="skin_header_top clearafter">
	      <div class="logo_style">
	        <dnn:LOGO runat="server" id="dnnLOGO" />
	      </div>
	      <div class="skin_menu">
		    <div class="menu_style">
	          <dnn:MENU MenuStyle="StandardMenu" runat="server"></dnn:MENU>
		    </div>
	      </div>
		</div>
		<div class="banner_style">
	      <div class="bannerpane" id="BannerPane" runat="server" visible="false"></div>
		</div>
	  </div>
	</div>
  </div>
  <div class="skin_header_bottom"></div>
  <div class="skin_width">
    <div class="skin_main_left">
	  <div class="skin_main_right">
	    <div class="skin_main">
		  <div class="skin_content">
		    <div runat="server" id="TopPane" class="h_toppane" visible="false"></div>
		    <div class="clear_float"></div>
			<div class="dnnpanes">
			  <div runat="server" id="TopLeftPane"  class="h_topleftpane floatl" visible="false" ></div>
			  <div runat="server" id="TopCenterPane"  class="h_topcenterpane floatl" visible="false" ></div>
			  <div runat="server" id="TopRightPane"  class="h_toprightpane floatr" visible="false" ></div>
			  <div class="clear_float"></div>
		    </div>
		    <div class="clear_float"></div>
			<div runat="server" id="ContentPane" class="h_contentpane" visible="false"></div>
		    <div class="clear_float"></div>
		    <div class="dnnpanes">
			  <div runat="server" id="LeftPane" class="h_leftpane floatl" visible="false"></div>
			  <div runat="server" id="RightPane" class="h_rightpane floatr" visible="false"></div>
		      <div class="clear_float"></div>
		    </div>
		    <div class="clear_float"></div>
		    <div runat="server" id="ContentPane2" class="h_contentpane2" visible="false"></div>
		    <div class="clear_float"></div>
		    <div class="dnnpanes">
			  <div runat="server" id="BottomLeftPane"  class="h_bottomleftpane floatl" visible="false" ></div>
			  <div runat="server" id="BottomCenterPane"  class="h_bottomcenterpane floatl" visible="false" ></div>
			  <div runat="server" id="BottomRightPane"  class="h_bottomrightpane floatr" visible="false" ></div>
			  <div class="clear_float"></div>
		    </div>
		    <div class="clear_float"></div>
		    <div runat="server" id="BottomPane"  class="h_bottompane" visible="false"></div>
		  </div>
		</div>
	  </div>
    </div>
	<div class="footer_left">
	  <div class="footer_right">
	    <div class="footer_center">
		  <div class="footer_userlink">
            <dnn:USER ID="dnnUser2" runat="server" CssClass="Footer_user" /><dnn:LOGIN ID="dnnLogin2" runat="server" CssClass="Footer_user"/>
          </div>
		</div>
	  </div>
	</div>
	<div class="footer_style">
	  <dnn:COPYRIGHT runat="server" id="dnnCOPYRIGHT" cssclass="Footer" />|<dnn:PRIVACY runat="server" id="dnnPRIVACY" cssclass="Footer" />|<dnn:TERMS runat="server" id="dnnTERMS" cssclass="Footer" />
    </div>
  </div>
  <a style="display: inline;" href="#top" id="top-link" title="Top"></a>
</div>

<dnn:DnnJsInclude runat="server" FilePath="~/Resources/Shared/Scripts/jquery/jquery.hoverIntent.min.js" />
<dnn:DnnJsInclude runat="server" FilePath="StandardMenu/StandardMenu.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.mobile.customized.min.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.easing.1.3.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/scrolltop.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/scrolltop-call.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/camera.min.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.fancybox.min.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.mousewheel-3.0.6.min.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.lavalamp.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/shake.call.js" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/shake.js" PathNameAlias="SkinPath" />
<script type="text/javascript" language="javascript">
  <!--
    // Add Meta to Head:
	jQuery(document).ready(function() {
		$('head').append('<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=2.0"/>');
	});
		//For Fancy lightbox alternative:
	jQuery(document).ready(function() {
	  $(".fancybox").fancybox({
	    openEffect:'elastic',closeEffect:'fade',nextEffect:'fade', prevEffect:'fade'
	  });
    });
	//For Search Value:
	jQuery(document).ready(function(){
      var s="search...";
      $("#dnn_dnnSEARCH_txtSearch").val(s).click(function(){
        var ss=$(this).val();if(ss==s)$(this).val("") }
       )
      .blur(function(){
        var ss=$(this).val();if(ss=="")$(this).val(s) }
       );
     });
	//For Menu Lavalamp:
	jQuery(function() {
	  $("#standardMenu ul.rootMenu").lavaLamp({fx: 'easeOutBack', speed: 600});
    });
	//For Slideshow Banner:
	jQuery(window).load(function(){		
	  $('.camera_wrap').camera({
	    thumbnails: false, cols: 10,rows: 4, transPeriod: 1000, time:6000, pieDiameter:34, pagination: false, navigation:true,  height:"34%",minHeight: "100px",playPause:false
	  });
    });
  -->
</script>



