<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageVideo" CodeBehind="jb_ManageVideo.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<%@ Import NameSpace="DotNetNuke" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav><asp:panel id="pnlModuleContent" Runat="server">
	<asp:panel id="pnlItemVideo" runat="server" BorderColor="black" BorderWidth="0" Width="100%"
		HorizontalAlign="Center" CssClass="Normal" Visible="True">
		<BR>
		<TABLE id="tblItemVideo" cellSpacing="0" cellPadding="1" width="100%" runat="server">
			<TR>
				<TD align="center">
					<asp:datagrid id="dgVideo" runat="server" OnUpdateCommand="dgVideo_Update" OnCancelCommand="dgVideo_Cancel"
						OnEditCommand="dgVideo_Edit" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
						ItemStyle-CssClass="Normal" Cssclass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
						Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
						AllowPaging="False" DataKeyField="VideoID" ShowFooter="True" HeaderStyle-HorizontalAlign="Center"
						EnableViewState="True">
						<Columns>
							<asp:BoundColumn DataField="VideoID" ItemStyle-HorizontalAlign="Center" HeaderText="VideoID" Visible="False"
								ReadOnly="True" />
							<asp:TemplateColumn HeaderText="Video">
							    <ItemTemplate>
							        <iframe title="YouTube video player" class="youtube-player" type="text/html" width="120" height="90" 
                                    src='<%#DataBinder.Eval(Container.DataItem, "url") %>'  
                                    frameborder="0" allowFullScreen>
                                    </iframe>
							     </ItemTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="View<br>Order" FooterStyle-Wrap="False">
								<ItemTemplate>
								    <asp:Label ID="lblItemVideo_ViewOrder" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemVideo_ViewOrder" Width="30" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
									<asp:requiredfieldvalidator id="req_txtItemVideo_ViewOrder" runat="server" CssClass="Normal" ControlToValidate="txtItemVideo_ViewOrder"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemVideo_ViewOrder" CssClass="Normal" Runat="server" ControlToValidate="txtItemVideo_ViewOrder"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemVideo_ViewOrder_Add" Width="30" CssClass="Normal" text="0" Runat="server"
										EnableViewState="True"></asp:TextBox>
									<asp:requiredfieldvalidator id="req_txtItemVideo_ViewOrder_Add" runat="server" CssClass="Normal" ControlToValidate="txtItemVideo_ViewOrder_Add"
										ErrorMessage="*" Display="Dynamic"></asp:requiredfieldvalidator>
									<asp:comparevalidator id="val_txtItemVideo_ViewOrder_Add" CssClass="Normal" Runat="server" ControlToValidate="txtItemVideo_ViewOrder_Add"
										ErrorMessage="Integer" Operator="DataTypeCheck" Type="Integer" Display="Dynamic"></asp:comparevalidator>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="YouTube Embeded src URL for iframe<br/>Format: http://www.youtube.com/embed/VIDEO_ID" FooterStyle-Wrap="False">
								<ItemTemplate>								    
									<asp:Label ID="lblItemVideo_URL" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "URL") %>' Runat="server"/>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemVideo_URL" TextMode="SingleLine" Width="350" Height=38 CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "URL") %>' Runat="server" />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemVideo_URL_Add" TextMode="SingleLine" Width="350" CssClass="Normal"
										Runat="server" EnableViewState="True"></asp:TextBox>
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Description" FooterStyle-Wrap="False">
								<ItemTemplate>
									<asp:Label ID="lblItemVideo_Description" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server"/>								    
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="txtItemVideo_Description" TextMode="MultiLine" Width="200" Height=38 CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server" />
								</EditItemTemplate>
								<FooterTemplate>
									<asp:TextBox id="txtItemVideo_Description_Add" TextMode="SingleLine" Width="200" CssClass="Normal"
										Runat="server" EnableViewState="True"></asp:TextBox>
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
										CommandName="delete" AlternateText="Delete this file" runat="server" ID="imgBtnDelete_ItemVideo" />
								</ItemTemplate>
								<FooterTemplate>
									<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
										AlternateText="Add new file" runat="server" ID="imgBtnAdd_ItemVideo" />
								</FooterTemplate>
							</asp:TemplateColumn>
							<asp:EditCommandColumn ButtonType="LinkButton" Visible="True" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
						</Columns>
					</asp:datagrid>
					<asp:Label id="lblMessage_ItemVideo" runat="server" CssClass="NormalRed"></asp:Label>
				</TD>
			</TR>
		</TABLE>
	</asp:panel>
</asp:panel>
