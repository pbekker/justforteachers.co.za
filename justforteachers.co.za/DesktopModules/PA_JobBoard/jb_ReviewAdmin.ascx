<%@ Control language="vb" Inherits="DotNetNuke.jb_ReviewAdmin" CodeBehind="jb_ReviewAdmin.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE width="100%" align="center">
		<TR>
			<TD align="left" width="50%">
				<asp:hyperlink id="hplBackLink" Runat="server" cssclass="NormalBold" Text="< Back to Previous Page"></asp:hyperlink></TD>
			<TD align="right" width="50%">
				<asp:hyperlink id="hplModuleHome" cssclass="NormalBold" Text="Home" runat="server" Visible="True">Go to Module Home</asp:hyperlink></TD>
		</TR>
	</TABLE>
<TABLE id="tblItemReview" cellSpacing="0" cellPadding="1" width="100%" runat="server">
		<TR>
			<TD align="center">
				<asp:datagrid id="dgItemReview" runat="server" HeaderStyle-HorizontalAlign="Center" EnableViewState="True"
					ShowFooter="False" DataKeyField="ReviewID" AllowPaging="False" PagerStyle-mode="NumericPages"
					PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev" Allowsorting="True" PagerStyle-HorizontalAlign="Right"
					AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
					ItemStyle-CssClass="Normal" Cssclass="Normal" OnEditCommand="dgItemReview_Edit" OnCancelCommand="dgItemReview_Cancel"
					OnUpdateCommand="dgItemReview_Update">
					<Columns>
						<asp:BoundColumn DataField="ReviewID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top"
							HeaderText="ReviewID" Visible="True" ReadOnly="True" />
						<asp:BoundColumn DataField="ItemID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top"
							HeaderText="ItemID" Visible="True" ReadOnly="True" />	
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
						<asp:TemplateColumn HeaderText="Rating" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							<ItemTemplate>
								<img src='<%# DotNetNuke.jb_Utility.GetReviewStarPath(DataBinder.Eval(Container.DataItem, "Rating")) %>'>
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
						<asp:TemplateColumn HeaderText="Auth" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:CheckBox ID="chkApproveItem" Checked='<%# DataBinder.Eval(Container.DataItem, "Approved") %>' Text="" Runat="server" Enabled="False" />
							</ItemTemplate>
							<EditItemTemplate>
								<asp:CheckBox ID="chkApproveEdit" Checked='<%# DataBinder.Eval(Container.DataItem, "Approved") %>' Text="" Runat="server" Enabled="True"/>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="" Visible="True">
							<ItemTemplate>
								<asp:LinkButton id=lnkBtnAuthorize CommandName="authorizereview" runat="server" text="Authorize" Enabled='<%# IIF( DataBinder.Eval(Container.DataItem, "Approved") = 0, True, False) %>'>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" AlternateText="Delete this review" runat="server" ID="imgBtnDelete_ItemReview" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							Visible="False" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top"
							FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_ItemReview" runat="server" CssClass="NormalRed"></asp:Label><BR>
				<BR>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
