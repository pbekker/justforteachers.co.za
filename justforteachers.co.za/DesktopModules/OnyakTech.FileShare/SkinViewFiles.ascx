<%@ Control Language="c#" Codebehind="SkinViewFiles.ascx.cs" Inherits="OnyakTech.FileShare.SkinViewFiles" TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" AutoEventWireup="false" %>
<%@ Register TagPrefix="radr" Namespace="Telerik.WebControls" Assembly="RadRotator.Net2" %>
<table border="0" id="tblViewFiles" runat="server" >
		<tr>
			<td class="Normal">
				<radr:RadRotator id="rdScrll" ScrollDirection="Left" SmoothScrollDelay="40" runat="server"  FrameTimeout="12000" >
                    <FrameTemplate>                                                                            
                                <radr:RadTicker ID="rdTick" runat="server" class="Normal">
                                <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                </radr:RadTicker><br />               
                        <a href="<%# DataBinder.Eval(Container.DataItem, "URL") %>" > <%# DataBinder.Eval(Container.DataItem, "DatePublished")%></a>                        
                    </FrameTemplate>
                </radr:RadRotator>
			</td>
		</tr>
	</table>