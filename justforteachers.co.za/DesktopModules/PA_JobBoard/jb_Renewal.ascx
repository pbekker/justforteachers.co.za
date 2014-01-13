<%@ Import NameSpace="DotNetNuke" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_Renewal" CodeBehind="jb_Renewal.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<TABLE width="100%" align="center">
	<TR>
		<TD align="left" width="50%"><asp:hyperlink id="hplBackLink" resourcekey="[RESX:Nav_PreviousPage].Text" Runat="server" cssclass="NormalBold" Text="< Back to Previous Page"></asp:hyperlink></TD>
		<TD align="right" width="50%"><asp:hyperlink id="hplModuleHome" resourcekey="[RESX:Nav_ModuleHome].Text" Visible="True" runat="server" cssclass="NormalBold" Text="Home">Go to Module Home</asp:hyperlink></TD>
	</TR>
</TABLE>
<asp:panel id="pnlMessage" Runat="server" CssClass="Normal" HorizontalAlign="Center">
	<asp:Label id="lblMessage" Runat="server" CssClass="Normal" EnableViewState="False"></asp:Label>
	<div id="divMessage" runat="server" visible="true">Please
		<asp:HyperLink id="hplLogin" runat="server">log in</asp:HyperLink>&nbsp;to proceed. 		
		<asp:HyperLink id="hplRegister" runat="server" Visible="false">register</asp:HyperLink>
	</div>
</asp:panel>
<asp:panel id="pnlRenewalOption" Visible="True" HorizontalAlign="Center" Width="100%" BorderWidth="0"
	BorderStyle="Outset" runat="server">
	<BR>
	<asp:Label id="lbxRenewalOption" Runat="server" CssClass="NormalBold" text="Renewal Option(s)"></asp:Label>
	<BR>
	<asp:datagrid id="dgRenewalOption" runat="server"  HorizontalAlign="Center" Visible="True" CellPadding="5" HeaderStyle-CssClass="JediCss_TableHeader"
		AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
		AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
		PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" DataKeyField="PlanID"
		ShowFooter="False">
		<Columns>
			<asp:BoundColumn DataField="PlanID" ItemStyle-HorizontalAlign="Center" HeaderText="PlanID" Visible="False" ReadOnly="True" />
			<asp:TemplateColumn HeaderText="View<br/>Order" Visible="false">
				<ItemTemplate>
					<asp:Label ID="lblViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
				</ItemTemplate>									
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Renewal Option" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<asp:Label ID="lblPlanName" text='<%# DataBinder.Eval(Container.DataItem, "PlanName") %>' Runat="server"/>
				</ItemTemplate>									
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Description" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<asp:Label ID="lblDescription" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server"/>
				</ItemTemplate>									
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Renewal Fee<br/>(Per Listing)">
				<ItemTemplate>
					<asp:Label ID="lblFee" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Fee")).ToString("##0.00") %>' Runat="server"/>
				</ItemTemplate>									
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Listing Period<br/>(Days)">
				<ItemTemplate>
					<asp:Label ID="lblListingPeriod" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ListingPeriod") %>' Runat="server"/>
				</ItemTemplate>									
			</asp:TemplateColumn>			
			<asp:TemplateColumn HeaderText="Renew" ItemStyle-HorizontalAlign="Center" Visible="True">
				<ItemTemplate>
					<asp:LinkButton id="lnkBtnRenew" CommandName="renew" runat="server" text="Renew" CausesValidation="False"></asp:LinkButton>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid>
</asp:panel>
