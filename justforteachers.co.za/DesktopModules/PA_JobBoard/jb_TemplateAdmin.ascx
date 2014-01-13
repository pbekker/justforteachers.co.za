<%@ Control language="vb" Inherits="DotNetNuke.jb_TemplateAdmin" CodeBehind="jb_TemplateAdmin.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE width="100%" align="center">
		<TR>
			<TD width="50%" align="left">
				<asp:hyperlink id="hplBackLink" resourcekey="[RESX:Nav_PreviousPage].Text" Runat="server" cssclass="NormalBold" Text="< Back to Previous Page"></asp:hyperlink></TD>
			<TD width="50%" align="right">
				<asp:hyperlink id="hplModuleHome" resourcekey="[RESX:Nav_ModuleHome].Text" cssclass="NormalBold" Text="Home" runat="server" Visible="True">Go to Module Home</asp:hyperlink></TD>
		</TR>
	</TABLE>
	<TABLE id="tblPicklist" cellSpacing="5" cellPadding="0" width="100%" runat="server">
		<TR>
		    <TD vAlign="top" align="center" id="tdAutoCompleteKeyword" runat="server" visible="true">
				<asp:Label id="lbxAutoCompleteKeyword" Runat="server" CssClass="NormalBold" text="Search Keyword(s)"></asp:Label><BR>
				<asp:datagrid id="dgAutoCompleteKeyword" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False" PagerStyle-mode="NumericPages"
					PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev" Allowsorting="True" PagerStyle-HorizontalAlign="Right"
					AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
					ItemStyle-CssClass="Normal" Cssclass="Normal" OnEditCommand="dgAutoCompleteKeyword_Edit" OnCancelCommand="dgAutoCompleteKeyword_Cancel"
					OnUpdateCommand="dgAutoCompleteKeyword_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblAutoCompleteKeyword_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAutoCompleteKeyword_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAutoCompleteKeyword_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAutoCompleteKeyword_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAutoCompleteKeyword_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAutoCompleteKeyword_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAutoCompleteKeyword_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAutoCompleteKeyword_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAutoCompleteKeyword_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_AutoCompleteKeyword" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_AutoCompleteKeyword" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_AutoCompleteKeyword" runat="server" CssClass="NormalRed"></asp:Label><BR>
			</td>
			<TD vAlign="top" align="center" id="tdAutoCompleteLocation" runat="server" visible="true">
				<asp:Label id="lbxAutoCompleteLocation" Runat="server" CssClass="NormalBold" text="Search Location(s)"></asp:Label><BR>
				<asp:datagrid id="dgAutoCompleteLocation" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False" PagerStyle-mode="NumericPages"
					PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev" Allowsorting="True" PagerStyle-HorizontalAlign="Right"
					AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
					ItemStyle-CssClass="Normal" Cssclass="Normal" OnEditCommand="dgAutoCompleteLocation_Edit" OnCancelCommand="dgAutoCompleteLocation_Cancel"
					OnUpdateCommand="dgAutoCompleteLocation_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblAutoCompleteLocation_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAutoCompleteLocation_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAutoCompleteLocation_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAutoCompleteLocation_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAutoCompleteLocation_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAutoCompleteLocation_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAutoCompleteLocation_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAutoCompleteLocation_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAutoCompleteLocation_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_AutoCompleteLocation" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_AutoCompleteLocation" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_AutoCompleteLocation" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>				
			</TD>
			<TD vAlign="top" align="center" id="tdAttributeTemplate" runat="server" visible="true">
				<asp:Label id="lbxAttributeTemplate" Runat="server" CssClass="NormalBold" text="Predefined Attribute(s)">Predefined Attribute(s)</asp:Label><BR>
				<asp:datagrid id="dgAttributeTemplate" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" DataKeyField="PicklistID" ItemStyle-HorizontalAlign="Left" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgAttributeTemplate_Edit" OnCancelCommand="dgAttributeTemplate_Cancel" OnUpdateCommand="dgAttributeTemplate_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblAttributeTemplate_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAttributeTemplate_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAttributeTemplate_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAttributeTemplate_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAttributeTemplate_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAttributeTemplate_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAttributeTemplate_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAttributeTemplate_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAttributeTemplate_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_AttributeTemplate" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif"
									CommandName="add" AlternateText="Add" runat="server" ID="imgBtnAdd_AttributeTemplate" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_AttributeTemplate" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
