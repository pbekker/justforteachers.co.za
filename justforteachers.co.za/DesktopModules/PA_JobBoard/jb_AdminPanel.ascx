<%@ Control language="vb" Inherits="DotNetNuke.jb_AdminPanel" CodeBehind="jb_AdminPanel.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%--<script type="text/javascript">
    $(document).ready(function() {
        $('span').html(function(foo, oldhtml) {
        var content = oldhtml.replace(/Category has been added./gi, "Added in Turkish");
        content = content.replace(/Category has been updated./gi, "Updated in Turkish");
        content = content.replace(/Category has been deleted./gi, "Deleted in Turkish");
        return content;
        }); 
    }); 
</script>--%>
<asp:panel id="pnlModuleContent" Runat="server">
		<TABLE width="100%" align="center">
			<TR>
				<TD align="left" width="50%">
					<asp:hyperlink id="hplBackLink" Runat="server" Text="< Back to Previous Page" cssclass="NormalBold"></asp:hyperlink></TD>
				<TD align="right" width="50%">
					<asp:hyperlink id="hplModuleHome" Text="Home" cssclass="NormalBold" Visible="True" runat="server">Go to Module Home</asp:hyperlink></TD>
			</TR>
		</TABLE>
		<TABLE id="tblCategory" cellSpacing="0" cellPadding="0" width="100%" runat="server">
			<TR>
				<TD align="center" width="100%"><BR>
				
					<asp:datagrid id="dgCategory" runat="server" OnUpdateCommand="dgCategory_Update" OnCancelCommand="dgCategory_Cancel"
						OnEditCommand="dgCategory_Edit" Cssclass="Normal" ItemStyle-CssClass="Normal" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
						HeaderStyle-CssClass="JediCss_TableHeader" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
						Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
						AllowPaging="False" DataKeyField="CategoryID" ShowFooter="True" HeaderStyle-HorizontalAlign="Center"
						EnableViewState="True">
						<Columns>
							<asp:BoundColumn DataField="CategoryID" ItemStyle-HorizontalAlign="Center" 
								HeaderText="CategoryID" Visible="False" ReadOnly="True" />
							<asp:TemplateColumn HeaderText="Category Path" ItemStyle-HorizontalAlign="Left" FooterStyle-Wrap="true" ItemStyle-Wrap="true">
								<ItemTemplate>
									<asp:Label ID="lblCategoryPath" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "CategoryPath") %>' Runat="server"/>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Total<br>Items" FooterStyle-Wrap="False" ItemStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:Label ID="lblItemsCountAdmin" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ItemsCountAdmin") %>' Runat="server"/>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Active<br>Items" FooterStyle-Wrap="False" ItemStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:Label ID="lblItemsCount" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ItemsCount") %>' Runat="server"/>
								</ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Category Name"   ItemStyle-HorizontalAlign="Left" FooterStyle-Wrap="False" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
								<ItemTemplate>
								    <asp:HyperLink CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.GetApplicationPath() & "?tabid=" & Me.TabId  & "&action=cat&parentid=" & DataBinder.Eval(Container.DataItem,"CategoryID") %>' id="hplCategoryName" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>'>
									</asp:HyperLink>									
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtCategoryName_Edit" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' Runat="server" />
									<asp:requiredfieldvalidator id="req_txtCategoryName_Edit" runat="server" ValidationGroup="CategoryUpdate" Display="Dynamic" CssClass="Normal" ControlToValidate="txtCategoryName_Edit" ErrorMessage="*">
									</asp:requiredfieldvalidator>
								</EditItemTemplate>
								<FooterTemplate> 
									<asp:TextBox id="txtCategoryName_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>
									<asp:requiredfieldvalidator id="req_txtCategoryName_Add" runat="server"  ValidationGroup="CategoryAdd" Display="Dynamic" CssClass="Normal" ControlToValidate="txtCategoryName_Add" ErrorMessage="*">
								    </asp:requiredfieldvalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Parent Category"  ItemStyle-HorizontalAlign="Left"  FooterStyle-Wrap="False">
								<ItemTemplate>
									<asp:Label ID="lblParentID_Item" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ParentName") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:DropDownList id="ddlParentID_Edit" CssClass="Normal" runat="server" DataTextField = "CategoryName" DataValueField = "CategoryID" DataSource = '<%# GetDropDownListDataSource("CATEGORYCOMPLETELIST") %>' SelectedIndex='<%# GetDropDownListSelectedIndex("CATEGORYCOMPLETELIST", "CategoryID", DataBinder.Eval(Container.DataItem, "ParentID")) %>' />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:DropDownList id="ddlParentID_Add" CssClass="Normal" runat="server" EnableViewState="True" DataTextField = "CategoryName" DataValueField = "CategoryID" DataSource = '<%# GetDropDownListDataSource("CATEGORYCOMPLETELIST")%>' />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Payment Required ?"  ItemStyle-Wrap="False" 
								FooterStyle-Wrap="False">
								<ItemTemplate>
									<asp:CheckBox ID="chkPaymentRequired_Item" CssClass="Normal" Checked='<%# DataBinder.Eval(Container.DataItem, "PaymentRequired") %>'  Text="" Runat="server" Enabled="False" />
								</ItemTemplate>
								<EditItemTemplate>
									<asp:CheckBox ID="chkPaymentRequired_Edit" CssClass="Normal" Checked='<%# DataBinder.Eval(Container.DataItem, "PaymentRequired") %>'  Text="" Runat="server" Enabled="True" />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:CheckBox ID="chkPaymentRequired_Add" CssClass="Normal" Text="" Runat="server" Enabled="True" />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Price" HeaderStyle-Wrap="False" FooterStyle-Wrap="False" ItemStyle-Wrap="False">
								<ItemTemplate>
									<asp:Label ID="lblPrice_Item" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Price")).ToString("##0.00") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtPrice_Edit" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Price")).ToString("##0.00") %>' Runat="server" />
									<asp:regularexpressionvalidator id="valCurrencyFormat_Edit" runat="server" CssClass="NormalRed" ErrorMessage="Invalid"
									ControlToValidate="txtPrice_Edit" Display="Dynamic" ValidationExpression="^\d+(?:\.\d{0,2})?$" Enabled="True"></asp:regularexpressionvalidator>
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtPrice_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>
									<asp:regularexpressionvalidator id="valCurrencyFormat_Add" runat="server" CssClass="NormalRed" ErrorMessage="Invalid"
									ControlToValidate="txtPrice_Add" Display="Dynamic" ValidationExpression="^\d+(?:\.\d{0,2})?$" Enabled="True"></asp:regularexpressionvalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Enable<br/>Listings?"  HeaderStyle-Wrap="true" ItemStyle-Wrap="False" FooterStyle-Wrap="False">
								<ItemTemplate>
									<asp:CheckBox ID="chkEnableListings_Item" CssClass="Normal" Checked='<%# DotNetNuke.jb_Uconversion.ConvertBoolean(DataBinder.Eval(Container.DataItem, "EnableListings")) %>'  Text="" Runat="server" Enabled="False" />
								</ItemTemplate>
								<EditItemTemplate>
									<asp:CheckBox ID="chkEnableListings_Edit" CssClass="Normal" Checked='<%# DotNetNuke.jb_Uconversion.ConvertBoolean(DataBinder.Eval(Container.DataItem, "EnableListings")) %>'  Text="" Runat="server" Enabled="True" />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:CheckBox ID="chkEnableListings_Add" CssClass="Normal" Text="" Checked="True" Runat="server" Enabled="True" />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Custom<br/>Icon" ItemStyle-Wrap="true" FooterStyle-Wrap="true" HeaderStyle-Wrap="true">
								<ItemTemplate>
									<img id="imgCategoryImage" border="0" src='<%# jb_Utility.GetItemImagePath("CATEGORY", Me.ModuleId, DataBinder.Eval(Container.DataItem, "CategoryID"), 0, jb_Uconversion.ConvertString(DataBinder.Eval(Container.DataItem, "Thumb_ImageFileName")))  %>' alt='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' runat="server" />
								</ItemTemplate>
								<EditItemTemplate>
									<asp:checkbox id="chkCategoryImage_Edit" runat="server" cssclass="Normal" Text="Overwrite Icon"
										EnableViewState="True"></asp:checkbox><br />
									<input id="iptCategoryImage_Edit" type="file" size="1" runat="server" class="Normal" enctype="multipart/form-data" />
                              		<asp:regularexpressionvalidator id="regex_iptCategoryImage_Edit" runat="server"  ValidationGroup="CategoryUpdate" CssClass="Normal" Display="Dynamic" ControlToValidate="iptCategoryImage_Edit" ErrorMessage="<br>Not a valid file extension" Enabled="false"  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.([jJ][pP][gG]|[gG][iI][fF]|[bB][mM][pP]|[pP][nN][gG]|[jJ][pP][eE]|[jJ][pP][eE][gG])$">
									</asp:regularexpressionvalidator>
								</EditItemTemplate>
								<FooterTemplate>
									<asp:checkbox id="chkCategoryImage_Add" runat="server" cssclass="Normal" Text="Upload item image"
										EnableViewState="True" Checked="True" Enabled="True" Visible="False"></asp:checkbox>
									<input id="iptCategoryImage_Add" type="file" size="1" runat="server" class="Normal" enctype="multipart/form-data" />
									<asp:regularexpressionvalidator id="regex_iptCategoryImage_Add" runat="server"  ValidationGroup="CategoryAdd" CssClass="Normal" Display="Dynamic" ControlToValidate="iptCategoryImage_Add" ErrorMessage="<br>Not a valid file extension" Enabled="false" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.([jJ][pP][gG]|[gG][iI][fF]|[bB][mM][pP]|[pP][nN][gG]|[jJ][pP][eE]|[jJ][pP][eE][gG])$">
									</asp:regularexpressionvalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn>
								<ItemTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
										CommandName="delete" runat="server" ID="imgBtnDelete_Category" />
								</ItemTemplate>
								<FooterTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
										 runat="server" ID="imgBtnAdd_Category" CausesValidation="true" ValidationGroup="CategoryAdd" />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" CausesValidation="true"  ValidationGroup="CategoryUpdate"
								ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False"
								FooterStyle-Wrap="False" />
						</Columns>
					</asp:datagrid>
					<asp:Label id="lblMessage_Category" runat="server" CssClass="NormalRed"></asp:Label><BR>
					<BR>
				</TD>
			</TR>
		</TABLE>
	</asp:panel>
