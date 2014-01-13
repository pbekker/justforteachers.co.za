<%@ Control language="vb" Inherits="DotNetNuke.jb_SortOption" CodeBehind="jb_SortOption.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE width="100%" align="center">
		<TR>
			<TD align="left" width="50%">
				<asp:hyperlink id="hplBackLink" resourcekey="[RESX:Nav_PreviousPage].Text" Runat="server" cssclass="NormalBold" Text="< Back to Previous Page"></asp:hyperlink></TD>
			<TD align="right" width="50%">
				<asp:hyperlink id="hplModuleHome" resourcekey="[RESX:Nav_ModuleHome].Text" cssclass="NormalBold" Text="Home" runat="server" Visible="True">Go to Module Home</asp:hyperlink></TD>
		</TR>
	</TABLE>
	<TABLE id="tblPicklist" cellSpacing="5" cellPadding="0" width="100%" runat="server">
		<TR id="trSortOptionMessage" runat="server">
			<TD vAlign="top" align="center">				   	 
			   	<asp:panel id="pnlSortOptionMessage" Runat="server" HorizontalAlign="center">
			   	     <asp:Label id="lbxSortOption" Runat="server" text="Sort Option(s)" CssClass="Normal">
			            <b>Note:</b> The first item on the list below will be set as default sort column.
			            <br />
			             If there is none then listings will be sorted by CreatedDate. 
			            <br />
			            The value must be identical to the name of the sort column.
			        </asp:Label>
			   	</asp:panel>
			</TD>
		</TR>
		<TR>
			<TD vAlign="top" align="center">
				<asp:datagrid id="dgSortOption" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgSortOption_Edit" OnCancelCommand="dgSortOption_Cancel" OnUpdateCommand="dgSortOption_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="True">
							<ItemTemplate>
								<asp:Label ID="lblSortOption_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtSortOption_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtSortOption_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblSortOption_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtSortOption_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtSortOption_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblSortOption_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtSortOption_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtSortOption_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_SortOption" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_SortOption" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_SortOption" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
