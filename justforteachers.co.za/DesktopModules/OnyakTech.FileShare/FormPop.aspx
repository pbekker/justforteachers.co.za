<%@ Page Language="vb"  Codebehind="FormPop.aspx.cs" AutoEventWireup="false" Inherits="OnyakTech.FileShare.FormPop" EnableSessionState="True" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html>
<head id="Head" runat="server">
    <asp:placeholder id="CSS" runat="server"></asp:placeholder>
</head>
    <body class="Normal" style="font-size: xx-small; font-family: Verdana;text-align: left"  >
  <script type="text/javascript">
				
				function GetRadWindow()
                {
                    var oWindow = null;
                    if (window.radWindow) oWindow = window.radWindow;
                    else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
                    return oWindow;
                }
                

                //Call a function in the parent page
                function CallFnOnParent()
                    {
                        GetRadWindow().BrowserWindow.confirmCallBackFn(); 
                        GetRadWindow().Close();
                    }

                //Call a function in the parent page
                function CallFnOnParentClose()
                    {                        
                        GetRadWindow().Close();
                    }
                    

                 function RefreshParentPage()
                   {
                       GetRadWindow().BrowserWindow.location.reload();
                   }
                  
                  function RefreshParentPageClose()
                   {
                       GetRadWindow().BrowserWindow.location.reload();
                       GetRadWindow().Close();
                   } 


               </script> 
 
<form id="formnew" runat="server">
<asp:ScriptManager id="ScriptManager" runat="server" />
<telerik:RadAjaxPanel ID="h2ofdAj" runat="server" LoadingPanelID="h2ofdAjaxLoad">
    <asp:label id="lblError" Runat="Server" EnableViewState="false" ForeColor="red"></asp:label>
    &nbsp; &nbsp;

    <table class="Normal" id="tblFormLayoutMain" >
		<tbody >
			<tr>
				<td class="Normal" >
				<asp:placeholder id="plhControls" runat="server"></asp:placeholder>
                    </td>
            </tr>
</tbody></table>
    &nbsp;&nbsp;<br />
&nbsp;
    <asp:Label ID="InjectScript" runat="server"></asp:Label>

     </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel ID="h2ofdAjaxLoad" runat="server" Height="75px" Width="75px" >
                    <asp:Image ID="Image1" runat="server" AlternateText="Loading..."  />
                </telerik:RadAjaxLoadingPanel>  
                    </form>
                    
</body>
</html>