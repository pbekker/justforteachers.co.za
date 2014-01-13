<%@ Control language="vb" Inherits="DotNetNuke.jb_PayPalReturnURL" CodeBehind="jb_PayPalReturnURL.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE height="100%" cellSpacing="0" cellPadding="4" width="100%" align="center" border="0">
		<TR>
			<TD align="center">
				<asp:Label id="lblMessage" CssClass="NormalRed" runat="server"></asp:Label><BR>
			</TD>
		</TR>
		<TR>
			<TD align="center"><BR>
				<BR>				
				<asp:linkbutton id="cmdReturnHome" resourcekey="[RESX:Nav_ModuleHome].Text" CssClass="Normal" runat="server" BorderStyle="none" CausesValidation="False"
					Text="Return to Job Board Home"></asp:linkbutton></TD>
		</TR>
	</TABLE>
</asp:panel>
