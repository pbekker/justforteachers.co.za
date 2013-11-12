<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageFile" CodeBehind="jb_ManageFile.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<%@ Import NameSpace="DotNetNuke" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav><asp:panel id="pnlModuleContent" Runat="server">
	<asp:panel id="pnlItemFile" runat="server" BorderColor="black" BorderWidth="0" Width="100%"
		HorizontalAlign="Center" CssClass="Normal" Visible="True">
		<BR>
		<TABLE id="tblItemFile" cellSpacing="0" cellPadding="1" width="100%" runat="server">
			<TR>
				<TD align="center">
					<asp:datagrid id="dgFile" runat="server" OnUpdateCommand="dgFile_Update" OnCancelCommand="dgFile_Cancel"
						OnEditCommand="dgFile_Edit" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
						ItemStyle-CssClass="Normal" Cssclass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
						Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
						AllowPaging="False" DataKeyField="FileID" ShowFooter="True" HeaderStyle-HorizontalAlign="Center"
						EnableViewState="True">
						<Columns>
							<asp:BoundColumn DataField="FileID" ItemStyle-HorizontalAlign="Center" HeaderText="ID" Visible="False"
								ReadOnly="True" />
							<asp:TemplateColumn HeaderText="View<br>Order" FooterStyle-Wrap="False">
								<ItemTemplate>
								    <asp:Label ID="lblItemFile_ViewOrder" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemFile_ViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
									<asp:requiredfieldvalidator id="req_txtItemFile_ViewOrder" runat="server" CssClass="Normal" ControlToValidate="txtItemFile_ViewOrder"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemFile_ViewOrder" CssClass="Normal" Runat="server" ControlToValidate="txtItemFile_ViewOrder"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemFile_ViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server"
										EnableViewState="True"></asp:TextBox>
									<asp:requiredfieldvalidator id="req_txtItemFile_ViewOrder_Add" runat="server" CssClass="Normal" ControlToValidate="txtItemFile_ViewOrder_Add"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemFile_ViewOrder_Add" CssClass="Normal" Runat="server" ControlToValidate="txtItemFile_ViewOrder_Add"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Description" FooterStyle-Wrap="False">
								<ItemTemplate>								    
									<asp:Label ID="lblItemFile_Description" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemFile_Description" TextMode="MultiLine" Width="160" Height=38 CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server" />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemFile_Description_Add" TextMode="SingleLine" Width="160" CssClass="Normal"
										Runat="server" EnableViewState="True"></asp:TextBox>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="File(s)" ItemStyle-Wrap="False" FooterStyle-Wrap="False">
								<ItemTemplate>
									<A id="filelink_ItemFile" target="_blank" href='<%# jb_Utility.GetFilePath_File("FILE", Me.ModuleId, DataBinder.Eval(Container.DataItem, "ItemID"), False, False, DataBinder.Eval(Container.DataItem, "FileID"), DataBinder.Eval(Container.DataItem, "ImageFileName"))  %>' runat="server">
									<%# DataBinder.Eval(Container.DataItem, "ImageFileName") %>
									</A>										
								</ItemTemplate>
								<EditItemTemplate>
									<asp:checkbox id="chkItemFile" runat="server" cssclass="Normal" Text="Upload product file (overwrite)" Checked="true" Visible="false"
										EnableViewState="True"></asp:checkbox>									
									<input id="iptItemFile" type="file" size="20" runat="server" class="Normal" />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:checkbox id="chkItemFile_Add" runat="server" cssclass="Normal" Text="Upload product file"
										EnableViewState="True" Checked="True" Enabled="False" Visible="False"></asp:checkbox>
									<input id="iptItemFile_Add" type="file" size="20" runat="server" class="Normal" />*
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Size (KB)" Visible="False">
								<ItemTemplate>
									<asp:Label id="lblFileSize" Text='<%# jb_Utility.GetFormatFileSize(DataBinder.Eval(Container.DataItem,"ImageContentSize")) %>' CssClass="Normal" runat="server" />
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Download" Visible="False">
								<ItemTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/module/btn-download2.gif"
										CommandName="download" AlternateText="Download this file" runat="server" ID="imgBtnDownload" />
								</ItemTemplate>
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
										CommandName="delete" AlternateText="Delete this file" runat="server" ID="imgBtnDelete_ItemFile" />
								</ItemTemplate>
								<FooterTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
										AlternateText="Add new file" runat="server" ID="imgBtnAdd_ItemFile" />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:EditCommandColumn ButtonType="LinkButton" Visible="True" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
						</Columns>
					</asp:datagrid>
					<asp:Label id="lblMessage_ItemFile" runat="server" CssClass="NormalRed"></asp:Label>
				</TD>
			</TR>
		</TABLE>
	</asp:panel>
</asp:panel>
