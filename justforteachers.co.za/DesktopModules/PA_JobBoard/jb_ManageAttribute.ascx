<%@ Import NameSpace="DotNetNuke" %>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<%@ Register TagPrefix="rcs" TagName="AdditionalInfo" Src="~/DesktopModules/PA_JobBoard/rcs_AdditionalInfo.ascx" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageAttribute" CodeBehind="jb_ManageAttribute.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav>
<asp:panel id="pnlItemAttribute" Visible="True" runat="server" HorizontalAlign="Center" Width="100%"
	BorderWidth="0" BorderColor="black">
	<BR>
	<TABLE id="tblItemAttribute" cellSpacing="0" cellPadding="1" width="100%" runat="server">
		<TR>			
			<TD class="Normal" align="center">
				<asp:datagrid id="dgItemAttribute" runat="server" Visible="True" ShowFooter="True" DataKeyField="AttributeID"
					 ItemStyle-HorizontalAlign="Left" AllowPaging="False" PagerStyle-mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev"
					Allowsorting="True" PagerStyle-HorizontalAlign="Right" AutoGenerateColumns="False" Cssclass="Normal" ItemStyle-CssClass="Normal" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
						HeaderStyle-CssClass="JediCss_TableHeader"
					OnEditCommand="dgItemAttribute_Edit" OnCancelCommand="dgItemAttribute_Cancel" OnUpdateCommand="dgItemAttribute_Update">
					<Columns>
						<asp:BoundColumn DataField="AttributeID" ItemStyle-HorizontalAlign="Center" HeaderText="AttributeID"
							Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Attribute" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAttributeName" text='<%# DataBinder.Eval(Container.DataItem, "AttributeName") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAttributeName" Width="150" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "AttributeName") %>' Runat="server" />*
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAttributeName_Add" Width="150" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Description" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblAttributeValue" text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtAttributeValue" Width="150" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue") %>' Runat="server" />*
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtAttributeValue_Add" Width="150" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>
								*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete this specification" runat="server" CausesValidation="False"
									ID="imgBtnDelete_ItemAttribute" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									AlternateText="Add new specification" runat="server" CausesValidation="False" ID="imgBtnAdd_ItemAttribute" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_ItemAttribute" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
        <tr>
            <td class="Normal" align="left">
                <b>Additional Info: </b>
                <rcs:AdditionalInfo ID="additionalInfo1" runat="server" />
            </td>
        </tr>
	</TABLE>
</asp:panel>
