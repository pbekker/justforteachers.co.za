<%@ Control language="vb" Inherits="DotNetNuke.jb_PicklistAdmin" CodeBehind="jb_PicklistAdmin.ascx.vb" AutoEventWireup="false" Explicit="True" %>
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
		<TR>
			<TD vAlign="top" align="center">
				<asp:Label id="lbxEmpType" Runat="server" CssClass="NormalBold">Dropdownlist: Employment Type</asp:Label><BR>
				<asp:datagrid id="dgEmpType" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgEmpType_Edit" OnCancelCommand="dgEmpType_Cancel" OnUpdateCommand="dgEmpType_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblEmpType_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtEmpType_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtEmpType_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblEmpType_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtEmpType_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtEmpType_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblEmpType_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtEmpType_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtEmpType_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_EmpType" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_EmpType" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_EmpType" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<asp:Label id="lbxTravel" Runat="server" CssClass="NormalBold">Dropdownlist: Travel Option</asp:Label><BR>
				<asp:datagrid id="dgTravel" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgTravel_Edit" OnCancelCommand="dgTravel_Cancel" OnUpdateCommand="dgTravel_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblTravel_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtTravel_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtTravel_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblTravel_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtTravel_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtTravel_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblTravel_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtTravel_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtTravel_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_Travel" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_Travel" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_Travel" runat="server" CssClass="NormalRed"></asp:Label></TD>
			<TD vAlign="top" align="center">
				<asp:Label id="lbxEducation" Runat="server" CssClass="NormalBold">Dropdownlist: Education</asp:Label><BR>
				<asp:datagrid id="dgEducation" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgEducation_Edit" OnCancelCommand="dgEducation_Cancel" OnUpdateCommand="dgEducation_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblEducation_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtEducation_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtEducation_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblEducation_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtEducation_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtEducation_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblEducation_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtEducation_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtEducation_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_Education" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_Education" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_Education" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
			<TD vAlign="top" align="center">
				<asp:Label id="lbxCheckboxFeature" Runat="server" CssClass="NormalBold">Checkbox: Requirements</asp:Label><BR>
				<asp:datagrid id="dgCheckboxFeature" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgCheckboxFeature_Edit" OnCancelCommand="dgCheckboxFeature_Cancel" OnUpdateCommand="dgCheckboxFeature_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblCheckboxFeature_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtCheckboxFeature_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtCheckboxFeature_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblCheckboxFeature_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtCheckboxFeature_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtCheckboxFeature_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblCheckboxFeature_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtCheckboxFeature_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtCheckboxFeature_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_CheckboxFeature" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_CheckboxFeature" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_CheckboxFeature" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
			<TD vAlign="top" align="center">
				<asp:Label id="lbxCheckboxBenefit" Runat="server" CssClass="NormalBold">Checkbox: Benefits</asp:Label><BR>
				<asp:datagrid id="dgCheckboxBenefit" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgCheckboxBenefit_Edit" OnCancelCommand="dgCheckboxBenefit_Cancel" OnUpdateCommand="dgCheckboxBenefit_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblCheckboxBenefit_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtCheckboxBenefit_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtCheckboxBenefit_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblCheckboxBenefit_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtCheckboxBenefit_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtCheckboxBenefit_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblCheckboxBenefit_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtCheckboxBenefit_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtCheckboxBenefit_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_CheckboxBenefit" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_CheckboxBenefit" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_CheckboxBenefit" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
				<asp:Label id="lbxJobLead" Runat="server" CssClass="NormalBold">Dropdownlist: Job Lead</asp:Label><BR>
				<asp:datagrid id="dgJobLead" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgJobLead_Edit" OnCancelCommand="dgJobLead_Cancel" OnUpdateCommand="dgJobLead_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblJobLead_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtJobLead_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtJobLead_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblJobLead_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtJobLead_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtJobLead_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblJobLead_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtJobLead_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtJobLead_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_JobLead" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_JobLead" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_JobLead" runat="server" CssClass="NormalRed"></asp:Label>
				<br /><br />
				<asp:Label id="lbxStatusInternal" Runat="server" CssClass="NormalBold">Dropdownlist: Application Status</asp:Label><BR>
				<asp:datagrid id="dgStatusInternal" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="True" ItemStyle-HorizontalAlign="Left" DataKeyField="PicklistID" AllowPaging="False"
					PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					OnEditCommand="dgStatusInternal_Edit" OnCancelCommand="dgStatusInternal_Cancel" OnUpdateCommand="dgStatusInternal_Update">
					<Columns>
						<asp:BoundColumn DataField="PicklistID" ItemStyle-HorizontalAlign="Center" HeaderText="PicklistID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Text" FooterStyle-Wrap="False" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblStatusInternal_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtStatusInternal_Text" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistText") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtStatusInternal_Text_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Value" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblStatusInternal_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtStatusInternal_Value" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PicklistValue") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtStatusInternal_Value_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="View Order" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblStatusInternal_ViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtStatusInternal_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtStatusInternal_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete" runat="server" ID="imgBtnDelete_StatusInternal" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add" runat="server" ID="imgBtnAdd_StatusInternal" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_StatusInternal" runat="server" CssClass="NormalRed"></asp:Label>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
