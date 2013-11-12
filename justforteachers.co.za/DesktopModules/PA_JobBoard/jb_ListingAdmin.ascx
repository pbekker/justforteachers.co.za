<%@ Control language="vb" Inherits="DotNetNuke.jb_ListingAdmin" CodeBehind="jb_ListingAdmin.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE width="100%" align="center">
		<TR>
			<TD align="left" width="50%">
				<asp:hyperlink id="hplBackLink" Runat="server" cssclass="NormalBold" Text="< Back to Previous Page"></asp:hyperlink></TD>
			<TD align="right" width="50%">
				<asp:hyperlink id="hplModuleHome" cssclass="NormalBold" Text="Home" runat="server" Visible="True">Go to Module Home</asp:hyperlink></TD>
		</TR>
	</TABLE>
	<TABLE id="tblItem" cellSpacing="0" cellPadding="0" width="100%" runat="server">
		<TR>
			<TD align="center" width="100%">
				<TABLE cellSpacing="0" cellPadding="0" width="100%">
					<TR>
						<TD class="Normal" id="tdExportToExcel" vAlign="bottom" noWrap align="left" width="20%"
							runat="server"><IMG 
            src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-xls.gif")%>' 
            align=bottom border=0>
							<asp:LinkButton id="lnkBtnExportToExcel" Runat="server" CssClass="Normal">Export to Excel</asp:LinkButton></TD>
						<TD class="Normal" id="tdRss" vAlign="bottom" noWrap align="left" width="20%" runat="server"><IMG 
            src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/rss/ico-feed.gif")%>' 
            align=bottom border=0> <A class=Normal 
             href='<%= BuildRssURL(Me.TabID, Me.ModuleID, -1, Me.strKey, Me.intParam) %>' 
            target=_blank>RSS</A>
						</TD>
						<TD class="Normal" vAlign="bottom" align="center" width="30%">
							<asp:DropDownList id="ddlFilter" Runat="server" CssClass="Normal" EnableViewState="True" AutoPostBack="True">
								<asp:ListItem Value="ADMIN">All Listings</asp:ListItem>
								<asp:ListItem Value="LST_EXPIRED">Expired Listings</asp:ListItem>
								<asp:ListItem Value="LST_WBE7">Expired Listings in 7 days</asp:ListItem>
								<asp:ListItem Value="LST_WBE30">Expired Listings in 30 days</asp:ListItem>
								<asp:ListItem Value="LST_FEATURED">Featured Listings</asp:ListItem>
								<asp:ListItem Value="LST_PRINTAD">Print Ads Listings</asp:ListItem>
								<asp:ListItem Value="LST_HASAPPLICANT">Jobs with applicants</asp:ListItem>								
								<asp:ListItem Value="LST_MY">My Listings</asp:ListItem>
								<asp:ListItem Value="LST_NEWLISTINGS">New Listings</asp:ListItem>
								<asp:ListItem Value="LST_VIEWCOUNT_TOP">Top 10 Most Viewed Listings</asp:ListItem>
								<asp:ListItem Value="LST_VIEWCOUNT_BOTTOM">Top 10 Least Viewed Listings</asp:ListItem>
								<asp:ListItem Value="LST_UNAPPROVED">Unapproved Listings</asp:ListItem>
							</asp:DropDownList></TD>
						<TD class="Normal" vAlign="bottom" align="right" width="40%">
							<asp:Label id="lblMessage_Count" runat="server" CssClass="Normal"></asp:Label></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD align="center" width="100%"><BR>
				<asp:datagrid id="dgItem" runat="server" EnableViewState="True" HeaderStyle-HorizontalAlign="Center"
					ShowFooter="False" DataKeyField="ItemID" PagerStyle-mode="NumericPages"
					PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev" Allowsorting="True" PagerStyle-HorizontalAlign="Right"
					AutoGenerateColumns="False" HeaderStyle-CssClass="JediCss_TableHeader" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem"
					ItemStyle-CssClass="Normal" Cssclass="Normal" OnEditCommand="dgItem_Edit" OnCancelCommand="dgItem_Cancel"
					OnUpdateCommand="dgItem_Update" OnPageIndexChanged="dgItem_Page"  AllowPaging="True" PageSize="10">
					<Columns>
						<asp:TemplateColumn HeaderText="" ItemStyle-Wrap="False">
							<ItemTemplate>
								<asp:HyperLink CssClass="Normal" NavigateUrl='<%# Page.ResolveUrl("Default.aspx") & "?TabID=" & Me.TabId & "&ItemID=" & DataBinder.Eval(Container.DataItem,"ItemID") & "&uc=" & "ia" & "&cpy=" & "true"%>' id="hplCopy" runat="server" text='Copy'>
								</asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn ItemStyle-CssClass="Normal"  Visible="True" ItemStyle-HorizontalAlign="Center">
							<HeaderTemplate>
								Posted
							</HeaderTemplate>
							<ItemTemplate>
								<%# String.Format("{0:d}", Container.DataItem("CreatedDate"))%>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn ItemStyle-CssClass="Normal" ItemStyle-HorizontalAlign="Left"  ItemStyle-Wrap="False">
							<HeaderTemplate>
								Title
							</HeaderTemplate>
							<ItemTemplate>
								<a href = '<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "info", "&ItemID=" & DataBinder.Eval(Container.DataItem, "ItemID"))%>'>
									<%# Container.DataItem("JB_JobTitle") & " (" & DataBinder.Eval(Container.DataItem,"ItemID") & ")" %>
								</a>
								<asp:Image id="PhotoSmallIcon" AlternateText="Photo Available" runat="server" ImageUrl="~/DesktopModules/PA_JobBoard/images/photo.gif"
									Visible="False"></asp:Image>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="CategoryID" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Center" Visible="False">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem,"CategoryID") %>
							</ItemTemplate>
						</asp:TemplateColumn>		
						<asp:TemplateColumn HeaderText="Category" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Left">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem,"CategoryName") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Days to expire" ItemStyle-CssClass="Normal" 
							Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="False">
							<ItemTemplate>
								<%# Container.DataItem("DaysToExpire") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Authorize" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:CheckBox ID="chkAuthed_Item" Checked='<%# DataBinder.Eval(Container, "DataItem.Authed") %>' Text="" Runat="server" Enabled="False" />
							</ItemTemplate>
							<EditItemTemplate>
								<asp:CheckBox ID="chkAuthed_Edit" Checked='<%# DataBinder.Eval(Container, "DataItem.Authed") %>' Text="" Runat="server" Enabled="True"/>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Featured?" ItemStyle-Wrap="False" FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:CheckBox ID="chkFeatured_Item" Checked='<%# DataBinder.Eval(Container, "DataItem.Featured") %>' Text="" Runat="server" Enabled="False" />
							</ItemTemplate>
							<EditItemTemplate>
								<asp:CheckBox ID="chkFeatured_Edit" Checked='<%# DataBinder.Eval(Container, "DataItem.Featured") %>' Text="" Runat="server" Enabled="True"/>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Exp. Date" HeaderStyle-Wrap="False" FooterStyle-Wrap="False" ItemStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label id="lblExpireDate" CssClass="Normal" runat="server" Text='<%# String.Format("{0:d}", Container.DataItem("ExpireDate"))%>' />
							</ItemTemplate>
							<EditItemTemplate>
								<asp:textbox id="txtExpires" runat="server" width="65" cssclass="Normal" maxlength="20" columns="20" Text='<%# String.Format("{0:d}", Container.DataItem("ExpireDate"))%>'>
								</asp:textbox>
								<asp:hyperlink id="cmdCalendar" Runat="server" CssClass="Normal"></asp:hyperlink>
								<asp:comparevalidator id="valExpiryDate" runat="server" cssclass="Normal" operator="DataTypeCheck" type="Date"
									display="Dynamic" errormessage="Invalid" controltovalidate="txtExpires"></asp:comparevalidator>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Applicants" ItemStyle-CssClass="Normal" 
							Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="False">
							<ItemTemplate>
								<%# Container.DataItem("JobAppCnt") %>
							</ItemTemplate>
						</asp:TemplateColumn>
						
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" runat="server" ID="imgBtnDelete_Item" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<TABLE id="tblNote" cellSpacing="5" cellPadding="0" width="100%" runat="server">
					<TR>
						<TD vAlign="top" align="left">
							<UL class="Normal">
								<LI>
								You can leave exp. date blank to make listing never expired.</LI>
								<LI>
									The copy feature will not save to the database until you click "Save as new 
									listing". To avoid confusion, it will only copy main information excluding 
									images, files, etc.
								</LI>
							</UL>
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD align="center" width="100%">
				<asp:Label id="lblMessage_Item" runat="server" CssClass="NormalRed"></asp:Label></TD>
		</TR>
	</TABLE>
</asp:panel>
