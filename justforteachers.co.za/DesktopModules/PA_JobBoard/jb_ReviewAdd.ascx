<%@ Import NameSpace="DotNetNuke" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_ReviewAdd" CodeBehind="jb_ReviewAdd.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE id="tblMain" cellSpacing="0" cellPadding="4" width="100%" align="center">
		<TR>
			<TD>
				<asp:label id="lblAddReview" Runat="server" Text="Item Name:" CssClass="Normal"></asp:label></TD>
			<TD>
				<asp:label id="lblItemName" CssClass="Normal" runat="server"></asp:label></TD>
		</TR>
		<TR>
			<TD>
				<asp:Label id="lbxName" Runat="server" CssClass="Normal" text="Your Name:"></asp:Label></TD>
			<TD>
				<asp:TextBox id="txtName_Add" Runat="server" CssClass="Normal" Width="200"></asp:TextBox>
				<asp:requiredfieldvalidator id="req_txtName_Add" CssClass="Normal" runat="server" ControlToValidate="txtName_Add"
					ErrorMessage="*"></asp:requiredfieldvalidator></TD>
		</TR>
		<TR>
			<TD>
				<asp:Label id="lbxEmail" Runat="server" CssClass="Normal" text="Your Email:"></asp:Label></TD>
			<TD>
				<asp:TextBox id="txtEmail_Add" Runat="server" CssClass="Normal" Width="200"></asp:TextBox>
				<asp:requiredfieldvalidator id="req_txtEmail_Add" CssClass="Normal" runat="server" ControlToValidate="txtEmail_Add"
					ErrorMessage="*"></asp:requiredfieldvalidator>
				<asp:regularexpressionvalidator id="regx_txtEmail_Add" CssClass="Normal" runat="server" ControlToValidate="txtEmail_Add"
					ErrorMessage="Not valid" Display="Dynamic" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"></asp:regularexpressionvalidator></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap>
				<asp:Label id="lbxRating" Runat="server" CssClass="Normal" text="Rating:"></asp:Label></TD>
			<TD vAlign="top" noWrap>
				<asp:RadioButtonList id="rblRating_Add" runat="server" Width="100%"></asp:RadioButtonList></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap>
				<asp:Label id="lbxComment" Runat="server" CssClass="Normal" text="Comment:"></asp:Label></TD>
			<TD vAlign="top" noWrap>
				<asp:TextBox id="txtComment_Add" CssClass="Normal" runat="server" Width="300" Rows="8" TextMode="MultiLine"></asp:TextBox>
				<asp:requiredfieldvalidator id="req_txtComment_Add" Enabled="false" CssClass="Normal" runat="server" ControlToValidate="txtComment_Add"
					ErrorMessage="*"></asp:requiredfieldvalidator></TD>
		</TR>
		<TR>
			<TD vAlign="top" noWrap></TD>
			<TD vAlign="top" noWrap>
				<asp:linkbutton id="cmdUpdate" CssClass="Normal" runat="server" text="Add/Update">Add Review</asp:linkbutton>&nbsp;
				<asp:LinkButton id="cmdDelete" CssClass="Normal" runat="server" text="Delete" Visible="False">Delete</asp:LinkButton>&nbsp;
				<asp:linkbutton id="cmdCancel" CssClass="Normal" runat="server" text="Cancel" CausesValidation="False">Cancel</asp:linkbutton></TD>
		</TR>
	</TABLE>
</asp:panel>
<asp:panel id="pnlConfirm" Runat="server" Visible="False">
	<TABLE height="100%" cellSpacing="0" cellPadding="4" width="100%" align="center" border="0">
		<TR>
			<TD align="center">
				<asp:Label id="lblMessage" CssClass="Normal" runat="server"></asp:Label><BR>
			</TD>
		</TR>
		<TR>
			<TD align="center">
				<asp:panel id="pnlReturnNav" Runat="server" Visible="True">&nbsp; 
<asp:linkbutton id="cmdReturn" resourcekey="cmdReturn.Text" Text="Return to listing(s)" runat="server" CausesValidation="False"></asp:linkbutton>
<asp:label id="lblEmptySpace" runat="server" Visible="True">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:label>&nbsp; 
<asp:linkbutton id="cmdReturnHome" resourcekey="cmdReturnHome.Text" Text="Return to Module Home" runat="server" CausesValidation="False"></asp:linkbutton></asp:panel></TD>
		</TR>
	</TABLE>
</asp:panel>
