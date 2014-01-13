<%@ Import NameSpace="DotNetNuke" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_Subscription" CodeBehind="jb_Subscription.ascx.vb" AutoEventWireup="false" Explicit="True" %>
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
<asp:panel id="pnlSubscriptionPlan" Visible="True" HorizontalAlign="Center" Width="100%" BorderWidth="0"
	BorderStyle="Outset" runat="server">
	<BR>
	<asp:Label id="lbxSubscriptionPlan" Runat="server" CssClass="NormalBold" text="Subscription Plan(s)"></asp:Label>
	<BR>
	<asp:datagrid id="dgSubscriptionPlan" runat="server"  HorizontalAlign="Center" Visible="True" CellPadding="5" HeaderStyle-CssClass="JediCss_TableHeader"
		AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
		AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
		PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" DataKeyField="PlanID"
		ShowFooter="False">
		<Columns>
			<asp:BoundColumn DataField="PlanID" ItemStyle-HorizontalAlign="Center" HeaderText="PlanID" Visible="False"
				ReadOnly="True" />
			<asp:TemplateColumn HeaderText="Plan Name" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<asp:Label ID="lblPlanName" text='<%# DataBinder.Eval(Container.DataItem, "PlanName") %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Plan Description" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<asp:Label ID="lblDescription" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Fee" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
					<asp:Label ID="lblFee" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Fee")).ToString("##0.00") %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Period (Days)" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
					<asp:Label ID="lblExpirationPeriod" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ExpirationPeriod") %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="No. of listings" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
					<asp:Label ID="lblLimit" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Limit") %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Subscribe" ItemStyle-HorizontalAlign="Center" Visible="True">
				<ItemTemplate>
					<asp:LinkButton id="lnkBtnSubscribe" CommandName="subscribe" runat="server" text="Subscribe" CausesValidation="False"></asp:LinkButton>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid>
</asp:panel>
<asp:panel id="pnlMySubscription" Visible="True" HorizontalAlign="Center" Width="100%" BorderWidth="0"
	BorderColor="black" runat="server">
	<BR>
	<asp:Label id="lbxMySubscription" Runat="server" CssClass="NormalBold" text="My Subscription/Order History"></asp:Label>
	<BR>
	<TABLE width="100%" align="center" border="0">
		<TR>
			<TD vAlign="top" align="center">
				<asp:datagrid id="dgMySubscription" runat="server" HorizontalAlign="Center" Visible="True" CellPadding="3" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
					PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" DataKeyField="SubscriptionID"
					ShowFooter="False">
					<Columns>
						<asp:TemplateColumn HeaderText="My Subscription" ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="top">
							<ItemTemplate>
								<table border="0" width="100%" class="Normal" cellpadding="3" cellspacing="0">
								    <tr>
										<td class="NormalBold" nowrap>Start Date:</td>
										<td class="Normal" nowrap>&nbsp;<%#String.Format("{0:d}", DataBinder.Eval(Container.DataItem, "DateStart"))%></td>
									</tr>
									<tr>
										<td class="NormalBold" nowrap>End Date:</td>
										<td class="Normal" nowrap>&nbsp;<%#String.Format("{0:d}", DataBinder.Eval(Container.DataItem, "DateEnd"))%></td>
									</tr>
									<tr>
										<td class="NormalBold" nowrap>Renew Date:</td>
										<td class="Normal" nowrap>&nbsp;<%#String.Format("{0:d}", DataBinder.Eval(Container.DataItem, "DateRenew"))%></td>
									</tr>
									<tr>
										<td class="NormalBold" nowrap>Listing Quota:</td>
										<td class="Normal" nowrap>&nbsp;<%#DataBinder.Eval(Container.DataItem, "Limit")%></td>
									</tr>
									<tr>
										<td class="NormalBold" nowrap>Listing Used:</td>
										<td class="Normal" nowrap>&nbsp;<%#DataBinder.Eval(Container.DataItem, "LST_Used")%></td>
									</tr>
									<tr>
										<td class="NormalBold" nowrap>Quick Links:</td>
										<td class="Normal" nowrap>&nbsp;<asp:HyperLink ID="hplLST_MY" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_MY") %>' runat="server">My Listings</asp:HyperLink></td>
									</tr>								
								</table>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid></TD>
			<TD vAlign="top" align="center">
				<asp:datagrid id="dgMyOrders" runat="server" HorizontalAlign="Center" Visible="True" CellPadding="3" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
					PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" DataKeyField="OrderID"
					ShowFooter="False">
					<Columns>
						<asp:BoundColumn DataField="OrderID" ItemStyle-HorizontalAlign="Center" HeaderText="OrderID" Visible="False"
							ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Order Date">
							<ItemTemplate>
								<%# String.Format("{0:d}", Container.DataItem("OrderDate"))%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="txn_id" ItemStyle-HorizontalAlign="Left">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "txn_id") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="payer_email" ItemStyle-HorizontalAlign="Left">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "payer_email") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="mc_gross">
							<ItemTemplate>
								<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "mc_gross")).ToString("##0.00") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Subscribe" Visible="False">
							<ItemTemplate>
								<asp:LinkButton id="lnkBtnViewDetail" CommandName="viewdetail" runat="server" text="View Details"></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid></TD>
		</TR>
	</TABLE>
</asp:panel>
<asp:panel id="pnlSubscriptionAdmin" Visible="True" HorizontalAlign="Center" Width="100%" BorderWidth="0"
	BorderColor="black" runat="server">
	<BR>
	<asp:Label id="lbxSubscriptionAdmin" Runat="server" CssClass="NormalBold" text="Override Subscription (Admin only)"></asp:Label>
	<BR>
	<asp:datagrid id="dgSubscriptionAdmin" runat="server" HorizontalAlign="Center" Visible="True" CellPadding="3" HeaderStyle-CssClass="JediCss_TableHeader"
		AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
		AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
		PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" DataKeyField="SubscriptionID"
		ShowFooter="False" OnEditCommand="dgSubscriptionAdmin_Edit" OnCancelCommand="dgSubscriptionAdmin_Cancel"
		OnUpdateCommand="dgSubscriptionAdmin_Update">
		<Columns>
			<asp:BoundColumn DataField="SubscriptionID" ItemStyle-HorizontalAlign="Center" HeaderText="SubscriptionID"
				Visible="False" ReadOnly="True" />
			<asp:BoundColumn DataField="UserID" ItemStyle-HorizontalAlign="Center" HeaderText="UserID" Visible="True"
				ReadOnly="True" />
			<asp:TemplateColumn HeaderText="Name" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>			
					<asp:Label ID="lblName" text='<%# DotNetNuke.jb_Utility.GetUsernameByUserId(DataBinder.Eval(Container.DataItem, "PortalID"),DataBinder.Eval(Container.DataItem, "UserID")) %>' Runat="server"/>								
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="TransactionID" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>
					<asp:Label ID="lblTransactionID" text='<%# DataBinder.Eval(Container.DataItem, "TransactionID") %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="DateCreated">
				<ItemTemplate>
					<asp:Label ID="lblDateCreated" text='<%# String.Format("{0:d}", DataBinder.Eval(Container.DataItem, "DateCreated")) %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="DateStart">
				<ItemTemplate>
					<asp:Label ID="lblDateStart" text='<%# String.Format("{0:d}", DataBinder.Eval(Container.DataItem, "DateStart")) %>' Runat="server"/>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="DateEnd">
				<ItemTemplate>
					<asp:Label ID="lblDateEnd" text='<%# String.Format("{0:d}", DataBinder.Eval(Container.DataItem, "DateEnd")) %>' Runat="server"/>
				</ItemTemplate>
				<EditItemTemplate>
					<asp:TextBox ID="txtDateEnd" Width="60" CssClass="Normal" text='<%# String.Format("{0:d}", DataBinder.Eval(Container.DataItem, "DateEnd")) %>' Runat="server" />
					<asp:requiredfieldvalidator id="req_txtDateEnd" runat="server" Display="Dynamic" CssClass="Normal" ErrorMessage="*"
						ControlToValidate="txtDateEnd"></asp:requiredfieldvalidator>
					<asp:comparevalidator id="comp_txtDateEnd" runat="server" cssclass="Normal" operator="DataTypeCheck" type="Date"
						display="Dynamic" errormessage="Invalid" controltovalidate="txtDateEnd"></asp:comparevalidator>
				</EditItemTemplate>
				<FooterTemplate>
					<asp:TextBox id="txtDateEnd_Add" Width="50" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>
					<asp:hyperlink id="cmdCalendar_Add" Runat="server" CssClass="Normal"></asp:hyperlink>
					<asp:requiredfieldvalidator id="req_txtDateEnd_Add" runat="server" CssClass="Normal" ErrorMessage="*" ControlToValidate="txtDateEnd_Add"></asp:requiredfieldvalidator>
					<asp:comparevalidator id="comp_txtDateEnd_Add" runat="server" operator="DataTypeCheck" type="Date" display="Dynamic"
						errormessage="Invalid" controltovalidate="txtDateEnd_Add"></asp:comparevalidator>
				</FooterTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Limit">
				<ItemTemplate>
					<asp:Label ID="lbxLimit" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Limit") %>' Runat="server"/>
				</ItemTemplate>
				<EditItemTemplate>
					<asp:TextBox ID="txtLimit" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Limit") %>' Runat="server" />
					<asp:requiredfieldvalidator id="req_txtLimit" runat="server" Display="Dynamic" CssClass="Normal" ErrorMessage="*"
						ControlToValidate="txtLimit"></asp:requiredfieldvalidator>
					<asp:CompareValidator id="comPosInt_txtLimit" runat="server" CssClass="Normal" ControlToValidate="txtLimit"
						ErrorMessage="Int > 0" Display="Dynamic" Operator="GreaterThan" Type="Integer" ValueToCompare="0"
						Enabled="True"></asp:CompareValidator>
				</EditItemTemplate>
				<FooterTemplate>
					<asp:TextBox id="txtLimit_Add" Width="35" Runat="server" EnableViewState="True" CssClass="Normal">5</asp:TextBox>*
					<asp:CompareValidator id="comPosInt_txtLimit_Add" runat="server" CssClass="Normal" ControlToValidate="txtLimit_Add"
						ErrorMessage="Int > 0" Display="Dynamic" Operator="GreaterThan" Type="Integer" ValueToCompare="0"
						Enabled="True"></asp:CompareValidator>
				</FooterTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="Active">
				<ItemTemplate>
					<asp:CheckBox ID="chkIsActiveItem" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="False" />
				</ItemTemplate>
				<EditItemTemplate>
					<asp:CheckBox ID="chkIsActive" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="True"/>
				</EditItemTemplate>
				<FooterTemplate>
					<asp:CheckBox ID="chkIsActive_Add" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="True"/>
				</FooterTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn>
				<ItemTemplate>
					<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
						CommandName="delete" AlternateText="Delete this specification" runat="server" CausesValidation="False"
						ID="imgBtnDelete_SubscriptionAdmin" />
				</ItemTemplate>
				<FooterTemplate>
					<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
						AlternateText="Add new specification" runat="server" CausesValidation="False" ID="imgBtnAdd_SubscriptionAdmin" />
				</FooterTemplate>
			</asp:TemplateColumn>
			<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
			<asp:TemplateColumn HeaderText="" ItemStyle-HorizontalAlign="Left">
				<ItemTemplate>			
					<asp:HyperLink ID="hplUserListings" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_MY&SubsUserID=" & DataBinder.Eval(Container.DataItem, "UserID")) %>' runat="server" text="View Listings">						
					</asp:HyperLink>									
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid>
	<asp:Label id="lblMessage_SubscriptionAdmin" runat="server" CssClass="NormalRed"></asp:Label>
	<BR>
</asp:panel>
