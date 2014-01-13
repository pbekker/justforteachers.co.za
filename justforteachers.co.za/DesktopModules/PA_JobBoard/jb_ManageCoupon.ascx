<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageCoupon" CodeBehind="jb_ManageCoupon.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<%@ Import NameSpace="DotNetNuke" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav><asp:panel id="pnlModuleContent" Runat="server">
	<asp:panel id="pnlItemInfo" runat="server" BorderColor="black" BorderWidth="0" Width="100%"
		HorizontalAlign="Center" CssClass="Normal" Visible="True">
		<BR>
		<TABLE id="tblItemInfo" cellSpacing="0" cellPadding="1" width="100%" runat="server">
			<TR>
				<TD align="center">
					<asp:datagrid id="dgInfo" runat="server" OnUpdateCommand="dgInfo_Update" OnCancelCommand="dgInfo_Cancel"
						OnEditCommand="dgInfo_Edit" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
						ItemStyle-CssClass="Normal" Cssclass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
						Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
						AllowPaging="False" DataKeyField="InfoID" ShowFooter="True" HeaderStyle-HorizontalAlign="Center"
						EnableViewState="True"  ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
						<Columns>
							<asp:BoundColumn DataField="InfoID" HeaderText="ID" Visible="False"
								ReadOnly="True" />
							<asp:TemplateColumn HeaderText="View<br/>Order">
								<ItemTemplate>
								    <asp:Label ID="lblItemInfo_ViewOrder" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemInfo_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
									<asp:requiredfieldvalidator id="req_txtItemInfo_ViewOrder" runat="server" CssClass="Normal" ControlToValidate="txtItemInfo_ViewOrder"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemInfo_ViewOrder" CssClass="Normal" Runat="server" ControlToValidate="txtItemInfo_ViewOrder"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemInfo_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
										EnableViewState="True"></asp:TextBox>
									<asp:requiredfieldvalidator id="req_txtItemInfo_ViewOrder_Add" runat="server" CssClass="Normal" ControlToValidate="txtItemInfo_ViewOrder_Add"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemInfo_ViewOrder_Add" CssClass="Normal" Runat="server" ControlToValidate="txtItemInfo_ViewOrder_Add"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Coupon Name">
							    <ItemTemplate>
								    <asp:Label ID="lblInfoName" text='<%# DataBinder.Eval(Container.DataItem, "InfoName") %>' Runat="server"/>
							    </ItemTemplate>
							    <EditItemTemplate>
								    <asp:TextBox ID="txtInfoName" Width="150" TextMode="MultiLine" Rows="2" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "InfoName") %>' Runat="server" />*
							    </EditItemTemplate>
							    <FooterTemplate>
								    <asp:TextBox id="txtInfoName_Add" Width="150" TextMode="MultiLine" Rows="2" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>*
							    </FooterTemplate>
						    </asp:TemplateColumn>
						    <asp:TemplateColumn HeaderText="Coupon Description">
							    <ItemTemplate>
								    <asp:Label ID="lblInfoDesc" text='<%# DataBinder.Eval(Container.DataItem, "InfoDesc") %>' Runat="server"/>
							    </ItemTemplate>
							    <EditItemTemplate>
								    <asp:TextBox ID="txtInfoDesc" Width="250" TextMode="MultiLine" Rows="2" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "InfoDesc") %>' Runat="server" />*
							    </EditItemTemplate>
							    <FooterTemplate>
								    <asp:TextBox id="txtInfoDesc_Add" Width="250" TextMode="MultiLine" Rows="2" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>*
							    </FooterTemplate>
						    </asp:TemplateColumn>
						    <asp:TemplateColumn HeaderText="Coupon Code">
							    <ItemTemplate>
								    <asp:Label ID="lblInfoCode" text='<%# DataBinder.Eval(Container.DataItem, "InfoCode") %>' Runat="server"/>
							    </ItemTemplate>
							    <EditItemTemplate>
								    <asp:TextBox ID="txtInfoCode" Width="75" TextMode="MultiLine" Rows="2" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "InfoCode") %>' Runat="server" />
							    </EditItemTemplate>
							    <FooterTemplate>
								    <asp:TextBox id="txtInfoCode_Add" Width="75" TextMode="MultiLine" Rows="2" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>
							    </FooterTemplate>
						    </asp:TemplateColumn>							
							<asp:TemplateColumn HeaderText="Exp. Date">
							    <ItemTemplate>
								    <asp:Label id="lblExpireDate" CssClass="Normal" runat="server" Text='<%# String.Format("{0:d}", Container.DataItem("DateExpired"))%>' />
							    </ItemTemplate>
							    <EditItemTemplate>
								    <asp:textbox id="txtExpires" runat="server" width="75" cssclass="Normal" maxlength="20" columns="20" Text='<%# String.Format("{0:d}", Container.DataItem("DateExpired"))%>'>
								    </asp:textbox>
								    <asp:hyperlink id="cmdCalendar" Runat="server" CssClass="Normal"></asp:hyperlink>
								    <asp:comparevalidator id="valExpiryDate" runat="server" cssclass="Normal" operator="DataTypeCheck" type="Date"
									    display="Dynamic" errormessage="Invalid" controltovalidate="txtExpires"></asp:comparevalidator>
							    </EditItemTemplate>
							    <FooterTemplate>
							        <asp:textbox id="txtExpires_Add" runat="server" width="75" cssclass="Normal" maxlength="20" columns="20">
								    </asp:textbox>
								    <asp:hyperlink id="cmdCalendar_Add" Runat="server" CssClass="Normal"></asp:hyperlink>
								    <asp:comparevalidator id="valExpiryDate_Add" runat="server" cssclass="Normal" operator="DataTypeCheck" type="Date"
									    display="Dynamic" errormessage="Invalid" controltovalidate="txtExpires_Add"></asp:comparevalidator>
							    </FooterTemplate> 
						    </asp:TemplateColumn>
						    <asp:TemplateColumn HeaderText="Never<br/>Expire">
							    <ItemTemplate>
								    <asp:CheckBox ID="chkIsNeverExpiresItem" Checked='<%# DataBinder.Eval(Container, "DataItem.IsNeverExpires") %>' Text="" Runat="server" Enabled="False" />
							    </ItemTemplate>
							    <EditItemTemplate>
								    <asp:CheckBox ID="chkIsNeverExpires" Checked='<%# DataBinder.Eval(Container, "DataItem.IsNeverExpires") %>' Text="" Runat="server" Enabled="True"/>
							    </EditItemTemplate>
							    <FooterTemplate>
									<asp:CheckBox ID="chkIsNeverExpires_Add" Checked="true" Text="" Runat="server" Enabled="True"/>
								</FooterTemplate>
						    </asp:TemplateColumn>
					    	<asp:TemplateColumn HeaderText="Active">
									<ItemTemplate>
										<asp:CheckBox ID="chkIsActiveItem" Checked='<%# DataBinder.Eval(Container, "DataItem.IsActive") %>' Text="" Runat="server" Enabled="False" />
									</ItemTemplate>
									<EditItemTemplate>
										<asp:CheckBox ID="chkIsActive" Checked='<%# DataBinder.Eval(Container, "DataItem.IsActive") %>' Text="" Runat="server" Enabled="True"/>
									</EditItemTemplate>
									<FooterTemplate>
										<asp:CheckBox ID="chkIsActive_Add" Checked="true" Text="" Runat="server" Enabled="True"/>
									</FooterTemplate>
								</asp:TemplateColumn>						   			 
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
										CommandName="delete" AlternateText="Delete this file" runat="server" ID="imgBtnDelete_ItemInfo" />
								</ItemTemplate>
								<FooterTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
										AlternateText="Add new file" runat="server" ID="imgBtnAdd_ItemInfo" />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:EditCommandColumn ButtonType="LinkButton" Visible="True" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
						</Columns>
					</asp:datagrid>
					<asp:Label id="lblMessage_ItemInfo" runat="server" CssClass="NormalRed"></asp:Label>
				</TD>
			</TR>
		</TABLE>
	</asp:panel>
</asp:panel>
