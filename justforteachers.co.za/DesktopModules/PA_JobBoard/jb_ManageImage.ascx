<%@ Import NameSpace="DotNetNuke" %>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageImage" CodeBehind="jb_ManageImage.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav><asp:panel id="pnlModuleContent" Runat="server">
	<asp:panel id="pnlItemImage" runat="server" BorderColor="black" BorderWidth="0" Width="100%"
		HorizontalAlign="Center" CssClass="Normal" Visible="True">
		<BR>
		<TABLE id="tblItemImage" cellSpacing="0" cellPadding="1" width="100%" runat="server">
			<TR>
				<TD align="center">
					<asp:datagrid id="dgImage" runat="server" OnUpdateCommand="dgImage_Update" OnCancelCommand="dgImage_Cancel"
						OnEditCommand="dgImage_Edit" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
						ItemStyle-CssClass="Normal" Cssclass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
						Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
						AllowPaging="False" DataKeyField="ImageID" ShowFooter="True" HeaderStyle-HorizontalAlign="Center"
						EnableViewState="True">
						<Columns>
							<asp:BoundColumn DataField="ImageID" ItemStyle-HorizontalAlign="Center" HeaderText="ID" Visible="False"
								ReadOnly="True" />
							<asp:TemplateColumn HeaderText="Image Code" FooterStyle-Wrap="False" Visible="False">
								<ItemTemplate>
									<asp:Label ID="lblImageCode" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ImageCode") %>' Runat="server"/>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Image File Name" FooterStyle-Wrap="False" Visible="False">
								<ItemTemplate>
									<asp:Label ID="lblImageFileName" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ImageFileName") %>' Runat="server"/>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="View<br>Order" FooterStyle-Wrap="False">
								<ItemTemplate>
									<asp:Label ID="lblItemImage_ViewOrder" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemImage_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
									<asp:requiredfieldvalidator id="req_txtItemImage_ViewOrder" runat="server" CssClass="Normal" ControlToValidate="txtItemImage_ViewOrder"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemImage_ViewOrder" CssClass="Normal" Runat="server" ControlToValidate="txtItemImage_ViewOrder"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemImage_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
										EnableViewState="True"></asp:TextBox>
									<asp:requiredfieldvalidator id="req_txtItemImage_ViewOrder_Add" runat="server" CssClass="Normal" ControlToValidate="txtItemImage_ViewOrder_Add"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemImage_ViewOrder_Add" CssClass="Normal" Runat="server" ControlToValidate="txtItemImage_ViewOrder_Add"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Description" FooterStyle-Wrap="False">
								<ItemTemplate>
									<asp:Label ID="lblItemImage_Description" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemImage_Description" TextMode="MultiLine" Width="160" Height=38 CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server" />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemImage_Description_Add" TextMode="SingleLine" Width="160" CssClass="Normal"
										Runat="server" EnableViewState="True"></asp:TextBox>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Image(s)" ItemStyle-Wrap="False" FooterStyle-Wrap="False">
								<ItemTemplate>
									<A id="photolink_ItemImage" target="_blank" href='<%# jb_Utility.GetItemImagePath( "Full", Me.ModuleId, DataBinder.Eval(Container.DataItem, "ItemID"),  DataBinder.Eval(Container.DataItem, "ImageID"), DataBinder.Eval(Container.DataItem, "ImageFileName"), DataBinder.Eval(Container.DataItem, "ImageCode")  )  %>' runat="server">
										<IMG id="photoimage_ItemImage" border="0" src='<%# jb_Utility.GetItemImagePath( "ListingGrid", Me.ModuleId, DataBinder.Eval(Container.DataItem, "ItemID"),  DataBinder.Eval(Container.DataItem, "ImageID"), DataBinder.Eval(Container.DataItem, "ImageFileName"), DataBinder.Eval(Container.DataItem, "ImageCode")  )  %>' alt='<%# DataBinder.Eval(Container.DataItem, "Description") %>' runat="server"></A>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:checkbox id="chkItemImage_Image" runat="server" cssclass="Normal" Text="Upload item image (overwrite)" Checked="true" Visible="false"
										EnableViewState="True"></asp:checkbox>
									<input id="iptItemImage_Image" type="file" size="20" runat="server" class="Normal" />
									<asp:regularexpressionvalidator id="valImg_iptItemImage_Image" runat="server" CssClass="Normal" Display="Dynamic" ControlToValidate="iptItemImage_Image" ErrorMessage="<br>Not a valid file extension" Enabled='<%# IIF( CType(Settings("EnableImageFilter"), String) = "1", True, False) %>' ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.([jJ][pP][gG]|[gG][iI][fF]|[bB][mM][pP]|[pP][nN][gG]|[jJ][pP][eE]|[jJ][pP][eE][gG])$">
									</asp:regularexpressionvalidator>
								</EditItemTemplate>
								<FooterTemplate>
									<asp:checkbox id="chkItemImage_Image_Add" runat="server" cssclass="Normal" Text="Upload item image"
										EnableViewState="True" Checked="True" Enabled="False" Visible="False"></asp:checkbox>
									<input id="iptItemImage_Image_Add" type="file" size="20" runat="server" class="Normal" />*
									<asp:regularexpressionvalidator id="valImg_iptItemImage_Image_Add" runat="server" CssClass="Normal" Display="Dynamic" ControlToValidate="iptItemImage_Image_Add" ErrorMessage="<br>Not a valid file extension" Enabled='<%# IIF( CType(Settings("EnableImageFilter"), String) = "1", True, False) %>' ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.([jJ][pP][gG]|[gG][iI][fF]|[bB][mM][pP]|[pP][nN][gG]|[jJ][pP][eE]|[jJ][pP][eE][gG])$">
									</asp:regularexpressionvalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Auth" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							    <ItemTemplate>
								    <asp:CheckBox ID="chkApproveItem" Checked='<%# DataBinder.Eval(Container, "DataItem.IsActive") %>' Text="" Runat="server" Enabled="False" />
							    </ItemTemplate>
							    <EditItemTemplate>
								    <asp:CheckBox ID="chkApproveEdit" Checked='<%# DataBinder.Eval(Container, "DataItem.IsActive") %>' Text="" Runat="server" Enabled="False"/>
							    </EditItemTemplate>
						    </asp:TemplateColumn>
						    <asp:TemplateColumn HeaderText="" Visible="False">
							    <ItemTemplate>
								    <asp:LinkButton id=lnkBtnAuthorize CommandName="authorize" runat="server" text="Authorize<br/>" Enabled='<%# IIF( DataBinder.Eval(Container.DataItem, "IsActive") = 0, True, False) %>' Visible='<%# IIF( DataBinder.Eval(Container.DataItem, "IsActive") = 0, True, False) %>'></asp:LinkButton>
								    <asp:LinkButton id=lnkBtnUnAuthorize CommandName="unauthorize" runat="server" text="Unauthorize" Enabled='<%# IIF( DataBinder.Eval(Container.DataItem, "IsActive") = 0, False, True) %>' Visible='<%# IIF( DataBinder.Eval(Container.DataItem, "IsActive") = 0, False, True) %>'></asp:LinkButton>
							    </ItemTemplate>
						    </asp:TemplateColumn>								
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
										CommandName="delete" AlternateText="Delete this image" runat="server" ID="imgBtnDelete_ItemImage" />
								</ItemTemplate>
								<FooterTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
										AlternateText="Add new image" runat="server" ID="imgBtnAdd_ItemImage" />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:EditCommandColumn ButtonType="LinkButton" Visible="True" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
						</Columns>
					</asp:datagrid>
					<asp:Label id="lblMessage_Image" runat="server" CssClass="NormalRed"></asp:Label>
				</TD>
			</TR>
		</TABLE>
	</asp:panel>
</asp:panel>
