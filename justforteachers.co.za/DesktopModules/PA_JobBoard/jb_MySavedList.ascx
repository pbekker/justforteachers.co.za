<%@ Control language="vb" Inherits="DotNetNuke.jb_MySavedList" CodeBehind="jb_MySavedList.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlSavedList" Visible="True" runat="server" HorizontalAlign="Center" Width="100%"
	BorderWidth="0" BorderColor="black">
	<BR>
	<TABLE id="tblSavedList" cellSpacing="0" cellPadding="1" width="100%" runat="server">
		<TR>
			<TD class="Normal" align="center">
				<asp:datagrid id="dgSavedList" runat="server" Visible="True" OnUpdateCommand="dgSavedList_Update"
					OnCancelCommand="dgSavedList_Cancel" OnEditCommand="dgSavedList_Edit" HeaderStyle-CssClass="JediCss_TableHeader"
					AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
					AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
					PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" ItemStyle-HorizontalAlign="Left"
					DataKeyField="ID" ShowFooter="False">
					<Columns>
						<asp:BoundColumn DataField="ID" ItemStyle-HorizontalAlign="Center" HeaderText="ID"
							Visible="False" ReadOnly="True" />
						<asp:BoundColumn DataField="Value3" ItemStyle-HorizontalAlign="Center" HeaderText="Date Saved" DataFormatString="{0:d}"
							Visible="True" ReadOnly="True" ItemStyle-Wrap="True" />
						<asp:TemplateColumn HeaderText="Saved Items" ItemStyle-Wrap="True">
							<ItemTemplate>															
								<asp:HyperLink CssClass="Normal" NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Value1") %>' id="hplValue1" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "Value2") %>'>
		        				</asp:HyperLink>		        				
							</ItemTemplate>						
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete this list" runat="server" CausesValidation="False"
									ID="imgBtnDelete_SavedList" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add new list" runat="server" CausesValidation="False" ID="imgBtnAdd_SavedList" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" Visible="false" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_SavedList" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
