<%@ Control language="vb" Inherits="DotNetNuke.jb_MessageBox" CodeBehind="jb_MessageBox.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE height="100%" cellSpacing="0" cellPadding="4" width="100%" align="center" border="0">
		<TR>
			<TD align="center">
				<asp:Label id="lblMessage" runat="server"></asp:Label><BR>
			</TD>
		</TR>
		<TR>
			<TD align="center">
				<asp:panel id="pnlReturnNav" Runat="server" Visible="True"><BR>&nbsp; 
<asp:linkbutton id="cmdReturn" resourcekey="[RESX:Nav_PreviousPage].Text" runat="server" CausesValidation="False" Text="Return to previous page"></asp:linkbutton>
<asp:label id="lblEmptySpace" runat="server" Visible="True">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:label>&nbsp; 
<asp:linkbutton id="cmdReturnHome" resourcekey="[RESX:Nav_ModuleHome].Text" runat="server" CausesValidation="False" Text="Return to Job Board Home"></asp:linkbutton></asp:panel></TD>
		</TR>
	</TABLE>
</asp:panel>
