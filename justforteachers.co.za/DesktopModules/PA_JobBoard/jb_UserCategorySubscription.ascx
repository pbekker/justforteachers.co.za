<%@ Import NameSpace="DotNetNuke" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_UserCategorySubscription" CodeBehind="jb_UserCategorySubscription.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlUserCategory" Visible="True" runat="server" HorizontalAlign="Center" Width="100%"
	BorderWidth="0" BorderColor="black">
	<TABLE width="100%" align="center">
		<TR>
			<TD align="left" width="50%">
				<asp:hyperlink id="hplBackLink" resourcekey="[RESX:Nav_PreviousPage].Text" Runat="server" cssclass="NormalBold" Text="< Back to Previous Page"></asp:hyperlink></TD>
			<TD align="right" width="50%">
				<asp:hyperlink id="hplModuleHome" resourcekey="[RESX:Nav_ModuleHome].Text" cssclass="NormalBold" Text="Home" runat="server" Visible="True">Go to Module Home</asp:hyperlink></TD>
		</TR>
	</TABLE>
	<TABLE id="tblUserCategory" cellSpacing="0" cellPadding="1" width="100%" runat="server">
		<TR>
			<TD class="Normal" align="center">
			    <asp:Label id="lbxNote__UserCategory" runat="server" CssClass="Normal">
				        <b>Note:</b> To avoid excessive emails, sub-categories listings of your subscribed categories will not be automatically notified.<br />
						Please explicitly subscribe to specific CategoryIDs you would like to be notified.
				</asp:Label><br /><br />			
				<asp:datagrid id="dgUserCategory" runat="server" Visible="True" OnCancelCommand="dgUserCategory_Cancel"
					OnEditCommand="dgUserCategory_Edit" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
					ItemStyle-HorizontalAlign="Left" ItemStyle-CssClass="Normal" Cssclass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
					Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
					AllowPaging="False" DataKeyField="CategoryID" ShowFooter="True">
					<Columns>
						<asp:BoundColumn DataField="CategoryID" ItemStyle-HorizontalAlign="Center" HeaderText="CategoryID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Subscribed Categories" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:HyperLink CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.GetApplicationPath() & "?tabid=" & Me.TabId  & "&action=cat&parentid=" & DataBinder.Eval(Container.DataItem,"CategoryID") %>' id="hplCategoryName" runat="server">
									<%# DataBinder.Eval(Container.DataItem, "CategoryPath") & " (" & DataBinder.Eval(Container.DataItem, "CategoryID") & ")"  %>
								</asp:HyperLink>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:DropDownList id="ddlUserCategory" runat="server" CssClass="Normal" DataTextField = "CategoryName" DataValueField = "CategoryID" DataSource = '<%# GetDropDownListDataSource("ClassifiedsCat", "CategoryString ASC") %>' SelectedIndex='<%# GetDropDownListSelectedIndex("ClassifiedsCat", "CategoryID", DataBinder.Eval(Container.DataItem, "CategoryID")) %>' />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:DropDownList id="ddlUserCategory_Add" runat="server" CssClass="Normal" EnableViewState="True" DataTextField = "CategoryName" DataValueField = "CategoryID" DataSource = '<%# GetDropDownListDataSource("ClassifiedsCat", "CategoryString ASC")%>' />
							</FooterTemplate>
						</asp:TemplateColumn>					
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" runat="server" CausesValidation="False"
									ID="imgBtnDelete_UserCategory" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									runat="server" CausesValidation="False" ID="imgBtnAdd_UserCategory" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							Visible="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_UserCategory" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
