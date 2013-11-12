<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageCategory" CodeBehind="jb_ManageCategory.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<%@ Import NameSpace="DotNetNuke" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav>
<asp:panel id="pnlItemCategory" Visible="True" runat="server" HorizontalAlign="Center" Width="100%"
	BorderWidth="0" BorderColor="black">
	<BR>
	<TABLE id="tblItemCategory" cellSpacing="0" cellPadding="1" width="100%" runat="server">
		<TR>
			<TD class="Normal" align="center">				
				<asp:datagrid id="dgItemCategory" runat="server" Visible="True" ShowFooter="True" DataKeyField="CategoryID"
					AllowPaging="False" PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" Cssclass="Normal"
					ItemStyle-HorizontalAlign="Left" ItemStyle-CssClass="Normal" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" HeaderStyle-CssClass="JediCss_TableHeader"
					OnEditCommand="dgItemCategory_Edit" OnCancelCommand="dgItemCategory_Cancel">
					<Columns>
						<asp:BoundColumn DataField="CategoryID" ItemStyle-HorizontalAlign="Center" HeaderText="CategoryID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Also list under" FooterStyle-Wrap="False">
							<ItemTemplate>							
								<asp:HyperLink CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.GetApplicationPath() & "?tabid=" & Me.TabId  & "&action=cat&parentid=" & DataBinder.Eval(Container.DataItem,"CategoryID") %>' id="hplCategoryName" runat="server">
									<%# DataBinder.Eval(Container.DataItem, "CategoryPath") & " (" & DataBinder.Eval(Container.DataItem, "CategoryID") & ")"  %>
								</asp:HyperLink>				
							</ItemTemplate>
							<EditItemTemplate>
								<asp:DropDownList id="ddlItemCategory" runat="server" CssClass="Normal" DataTextField = "CategoryName" DataValueField = "CategoryID" DataSource = '<%# GetDropDownListDataSource("ClassifiedsCat", "CategoryString ASC") %>' SelectedIndex='<%# GetDropDownListSelectedIndex("ClassifiedsCat", "CategoryID", DataBinder.Eval(Container.DataItem, "CategoryID")) %>' />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:DropDownList id="ddlItemCategory_Add" runat="server" CssClass="Normal" EnableViewState="True" DataTextField = "CategoryName" DataValueField = "CategoryID" DataSource = '<%# GetDropDownListDataSource("ClassifiedsCat", "CategoryString ASC")%>' />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" runat="server" CausesValidation="False"
									ID="imgBtnDelete_ItemCategory" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									runat="server" CausesValidation="False" ID="imgBtnAdd_ItemCategory" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							Visible="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_ItemCategory" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
