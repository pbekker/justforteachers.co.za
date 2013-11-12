<%@ Import NameSpace="DotNetNuke" %>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageReview" CodeBehind="jb_ManageReview.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav>
<asp:panel id="pnlItemReview" Visible="True" runat="server" HorizontalAlign="Center" Width="100%"
	BorderWidth="0" BorderColor="black">
	<BR>
	<TABLE id="tblItemReview" cellSpacing="0" cellPadding="1" width="100%" runat="server">
		<TR>
			<TD align="center">
				<asp:datagrid id="dgItemReview" runat="server" OnUpdateCommand="dgItemReview_Update" OnCancelCommand="dgItemReview_Cancel"
					OnEditCommand="dgItemReview_Edit"  Cssclass="Normal" ItemStyle-CssClass="Normal" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
						HeaderStyle-CssClass="JediCss_TableHeader" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
					Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
					AllowPaging="False" DataKeyField="ReviewID" ShowFooter="False" EnableViewState="True" HeaderStyle-HorizontalAlign="Center">
					<Columns>
						<asp:BoundColumn DataField="ReviewID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top"
							HeaderText="ReviewID" Visible="False" ReadOnly="True" />
						<asp:TemplateColumn HeaderText="Reviewer Info" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False"
							FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lbxNameItem" CssClass="NormalBold" text="Name:" Runat="server" />
								<asp:Label ID="lblName" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' Runat="server"/>
								<br>
								<asp:Label ID="lbxEmailItem" CssClass="NormalBold" text="Email:" Runat="server" />
								<asp:Label ID="lblEmail" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Email") %>' Runat="server"/>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Rating"  ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top"
							FooterStyle-Wrap="False">
							<ItemTemplate>
								<img src='<%# jb_Utility.GetReviewStarPath(DataBinder.Eval(Container.DataItem, "Rating")) %>'>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Review Date/Comment" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="True"
							FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label id="lbxReviewDate" CssClass="NormalBold" runat="server" Text="Review Date: " />
								<asp:Label id="lblReviewDate" CssClass="Normal" runat="server" Text='<%# String.Format("{0:d}", Container.DataItem("CreatedDate"))%>' />
								<br>
								<asp:Label id="lbxComment" CssClass="NormalBold" runat="server" Text="Comment: " />
								<br>
								<asp:Label id="lblComment" CssClass="Normal" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment") %>'>
								</asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Auth" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top"
							FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:CheckBox ID="chkApproveItem" Checked='<%# DataBinder.Eval(Container, "DataItem.Approved") %>' Text="" Runat="server" Enabled="False" />
							</ItemTemplate>
							<EditItemTemplate>
								<asp:CheckBox ID="chkApproveEdit" Checked='<%# DataBinder.Eval(Container, "DataItem.Approved") %>' Text="" Runat="server" Enabled="True"/>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="" Visible="True">
								<ItemTemplate>
									<asp:LinkButton id=lnkBtnAuthorize CommandName="authorizereview" runat="server" text="Authorize" Enabled='<%# IIF( DataBinder.Eval(Container.DataItem, "Approved") = 0, True, False) %>'>
									</asp:LinkButton>									
								</ItemTemplate>
							</asp:TemplateColumn>
						<asp:TemplateColumn  ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top"
							FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete this review" runat="server" ID="imgBtnDelete_ItemReview" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" Visible="False"
							ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_ItemReview" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
