<%@ Control language="vb" Inherits="DotNetNuke.jb_ClassifiedsSearch" CodeBehind="jb_classifiedssearch.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register Assembly="DnjAjaxControlToolkit" Namespace="DnjAjaxControlToolkit" TagPrefix="cc1" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<DIV id="Div1" runat="server">
		<TABLE width="100%" cellSpacing="0" cellPadding="3">
			<TR>
				<TD id="tdTreeview" vAlign="top" runat="server">
					<asp:panel id="pnlTreeview" runat="server" BorderWidth="0" Visible="true" HorizontalAlign="Left"
						BorderColor="black">
						<LINK href='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/treeview.css")%>' rel="stylesheet">
							<A class="Normal" href="javascript: siteMap_jb.openAll();"></A><A class="Normal" href="javascript: siteMap_jb.closeAll();">
							</A>
							<asp:literal id="Treeview" runat="server"></asp:literal>
							<asp:literal id="SpiderInfo" runat="server"></asp:literal>
					</asp:panel></TD>
				<TD id="tdMain" vAlign="top" align="center" width="100%" runat="server">
					<asp:panel id="pnlAnnouncement" runat="server" Width="100%" Visible="true" HorizontalAlign="Center"
						CssClass="JediCss_AnnouncementPanel">
						<TABLE width="100%" border="0">
							<TR>
								<TD vAlign="top" width="100%" cellspacing="10" cellpadding="10">
									<asp:literal id="announcementmessage" runat="server"></asp:literal>
									<SCRIPT src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/announcementmessage.js")%>'></SCRIPT>
									<ILAYER id="fscrollerns" width="&amp;{fwidth};" height="&amp;{fheight};">
										<LAYER id="fscrollerns_sub" width="&amp;{fwidth};" height="&amp;{fheight};" top="0" left="0"></LAYER>
									</ILAYER></TD>
							</TR>
						</TABLE>
					</asp:panel><!-- pnlQuickSearch BEGIN -->
					<asp:panel id="pnlQuickSearch" runat="server" BorderWidth="0" BorderStyle="Outset" Width="100%"
						Visible="True" HorizontalAlign="Center" CssClass="JediCss_pnlSearch">
						<TABLE id="tblSearchPanel" runat="server" border="0" width="100%">
							<TR id="trSearchCriteria" runat="server" visible="True">
							    <TD id="tdSearchCriteria" runat="server" vAlign="top" width="90%"  nowrap='<%# NOT DotNetNuke.jb_dispatch.dsp_ControlWrap %>'>
									<asp:dropdownlist id="ddlCategoryCompleteList" runat="server" EnableViewState="True" cssclass="Normal"></asp:dropdownlist>									
									<asp:dropdownlist id="ddlLocationSearch" runat="server" cssclass="Normal" EnableViewState="True"></asp:dropdownlist>									
									<asp:textbox id="txtLocation" Runat="server" cssclass="Normal" Width="164px" EnableViewState="True"></asp:textbox>							
							        <asp:DropDownList ID="ddlMile" runat="server" cssclass="Normal" AutoPostBack="False" EnableViewState="true"></asp:DropDownList>
                                    <asp:HyperLink id="hpl_EditMile" runat="server" Visible="false" CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "so", "&picklistgroup=RadiusOptions") %>'>Edit&nbsp;Radius</asp:HyperLink>	
							        <cc1:AutoCompleteExtender  ID="AutoCompleteExtender_txtLocation" runat="server" Enabled="false" 
							        CompletionListCssClass="JediCss_AutoComplete_CompletionListElement" 
                                    CompletionListItemCssClass="JediCss_AutoComplete_ListItem" 
                                    CompletionListHighlightedItemCssClass="JediCss_AutoComplete_HighlightedListItem"
							        ContextKey="CityRegion" ServiceMethod="jb_GetAutoCompletionList" ServicePath="jb_WebService.asmx" TargetControlID="txtLocation" 
							        MinimumPrefixLength="1" CompletionInterval="0" EnableCaching="true"></cc1:AutoCompleteExtender> 
							        <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender_txtLocation" runat="server" TargetControlID="txtLocation" WatermarkText="Location" WatermarkCssClass="Normal" />
        							
									<asp:textbox id="txtSearch" Runat="server" Width="164px" CssClass="Normal" EnableViewState="True"></asp:textbox>
								    <cc1:AutoCompleteExtender  ID="AutoCompleteExtender_txtSearch" runat="server" Enabled="false" 
					                CompletionListCssClass="JediCss_AutoComplete_CompletionListElement" 
                                    CompletionListItemCssClass="JediCss_AutoComplete_ListItem" 
                                    CompletionListHighlightedItemCssClass="JediCss_AutoComplete_HighlightedListItem"
					                ContextKey="Title" ServiceMethod="jb_GetAutoCompletionList" ServicePath="jb_WebService.asmx" TargetControlID="txtSearch" 
					                MinimumPrefixLength="1" CompletionInterval="0" EnableCaching="true"></cc1:AutoCompleteExtender>
								    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender_txtSearch" runat="server" TargetControlID="txtSearch" WatermarkText="Keywords" WatermarkCssClass="Normal" />
								</TD>
								<TD vAlign="top" width="10%" align="left">
									<asp:Button id="btnSearch" runat="server" CssClass="NormalBold" Text="Search" Width="65"></asp:Button>
								</TD>
							</TR>
							<TR id="trMoreSearchOptions" runat="server" visible="True">
								<TD vAlign="top" width="90%">
									<asp:Panel id="pnlAdvancedSearch" Runat="server" Visible="False">
										<TABLE border="0" width="100%">
											<TR>
												<TD class="Normal">
												</TD>
											</TR>
										</TABLE>
									</asp:Panel></TD>
								<TD vAlign="top" width="10%" align="left">
									<asp:HyperLink ID="hplQL_Search" CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "search", "&parentid=" & IIF(DotNetNuke.jb_Uconversion.ConvertString(Request.Params("parentID")) = "", 0, Request.Params("parentID"))) %>' Enabled="True" runat="server" Visible="False">
										More&nbsp;Options
									</asp:HyperLink>
									<asp:LinkButton id="lnkBtnSearchOption" runat="server" Visible="True" CssClass="Normal" CausesValidation="False">More&nbsp;Options</asp:LinkButton></TD>
							</TR>
							<TR id="trSearchResult" runat="server" visible="false">
								<TD height="0%" vAlign="middle" width="90%" align="center">
									<asp:Label id="lblSearchResultCount" runat="server" CssClass="Normal"></asp:Label></TD>
								<TD height="0%" vAlign="middle" width="10%" align="left">
								    <cc1:ModalPopupExtender ID="mpe_Popup_SavedSearch" runat="server"
                                        TargetControlID="lnkBtnSaveSearch"
                                        PopupControlID="pnl_Popup_SavedSearch"
                                        BackgroundCssClass="ModalBackground"
                                        CancelControlID="lnkBtnCancel_SavedSearch"
                                        PopupDragHandleControlID="panEdit">
                                    </cc1:ModalPopupExtender>
								    <asp:LinkButton id="lnkBtnSaveSearch" Runat="server" CssClass="Normal" Enabled="True">Save Search</asp:LinkButton><br />
									<asp:HyperLink id="hplSearchReturnHome" runat="server" Visible="True" CssClass="Normal" Enabled="True">Go Home</asp:HyperLink></TD>

							</TR>
						</TABLE>
					</asp:panel>
					<asp:panel id="Panel1" runat="server" BorderWidth="1" BorderStyle="Outset" Width="100%" Visible="true"
						HorizontalAlign="Center" CssClass="JediCss_ListingsPanel">
						<asp:table id="table1" Runat="server" Width="100%" HorizontalAlign="Center" CellPadding="1"
							CellSpacing="0">
							<asp:TableRow Visible="True" HorizontalAlign="Left">
								<asp:TableCell ID="lblBreadcrumbs" Runat="server"></asp:TableCell>
							</asp:TableRow>
						</asp:table>
						<asp:DataList id=DataList1 runat="server" Width="100%" ShowHeader="False" ShowFooter="False" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="<%# GetDataListRepeatColumns() %>" ItemStyle-Wrap="false" ItemStyle-VerticalAlign="Top">
							<HeaderTemplate>
								<table width="100%">
									<tr>
										<td width="30%" align="left">
											<asp:ImageButton id="btnSearch_Classifieds" Runat="server" Visible="<%# ItemViewListings %>" CommandName="lnkSearch" AlternateText="Job Search" ImageAlign="absmiddle" ImageUrl="images/ico-search.gif">
											</asp:ImageButton>
											<asp:LinkButton id="lnkSearch_Classifieds" Runat="server" CssClass="Normal" Visible="<%# ItemViewListings %>" Name="lnkSearch" CommandName="lnkSearch">Search</asp:LinkButton>
										</td>
										<td width="40%" align="center">
											<asp:ImageButton id="btnAdminPanel_Classifieds" Runat="server" Visible="<%# EditPermission %>" CommandName="lnkAdminPanel" AlternateText="Admin Panel" ImageAlign="absmiddle" ImageUrl="images/ico-user-oper.gif">
											</asp:ImageButton>
											<asp:LinkButton id="lnkAdminPanel_Classifieds" Runat="server" CssClass="Normal" Visible="<%# EditPermission %>" Name="lnkAdminPanel" CommandName="lnkAdminPanel">Admin Panel</asp:LinkButton>
										</td>
										<td width="30%" align="right">
											<asp:ImageButton id=btnAddCategory_Classifieds Runat="server" Visible="<%# EditPermission %>" CommandName="lnkAddCategory"  ImageAlign="absmiddle" ImageUrl="images/ico-category4.gif">
											</asp:ImageButton>
											<asp:LinkButton id=lnkAddCategory_Classifieds Runat="server" CssClass="Normal" Visible="<%# EditPermission %>" Name="lnkAddCategory" CommandName="lnkAddCategory">Add New Category</asp:LinkButton>
										</td>
									</tr>
								</table>
							</HeaderTemplate>
							<ItemTemplate>
								<table width="100%" align="center" height="100%">
									<tr valign="top">
										<td valign="top" Class="JediCss_ParentCategory">
											<table width="100%">
												<tr>
													<td width="0%" id="tdEditCat" runat="server" visible="False">
														<asp:ImageButton Runat="server" ImageUrl="~/DesktopModules/PA_JobBoard/images/ico-edit1.gif" ID="btnEditCat_Classifieds" CommandName="btnEditCat" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CategoryID") %>' Visible="<%# EditPermission %>">
														</asp:ImageButton>
													</td>
													<td width="1%">
													    <%#DotNetNuke.jb_Utility.GetCategoryIcon(Me.ModuleId, DataBinder.Eval(Container.DataItem, "CategoryID"), DataBinder.Eval(Container.DataItem, "Thumb_ImageFileName"), "images/ico-catfolder.gif")%>
												    </td>
													<td align="left" class="Normal">
														<asp:HyperLink CssClass="NormalBold" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&action=cat&parentID=" & DataBinder.Eval(Container.DataItem,"CategoryID"))%>' id="hplParentCategory" runat="server" text='<%# DataBinder.Eval(Container.DataItem,"CategoryName") %>'>HyperLink</asp:HyperLink>
													</td>
													<td align="right" class="Normal">
														<asp:Label ID="lblItemsCount" Runat="server" Visible="True" CssClass="Normal">
													    (<%# IIf(CheckAdmin() = "Yes", DataBinder.Eval(Container.DataItem,"ItemsCountAdmin"), DataBinder.Eval(Container.DataItem,"ItemsCount")) %>)
													    </asp:Label>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr valign="top" Class="JediCss_ChildCategory">
										<td valign="top">
											<table width="100%">
												<tr>
													<td align="left" width="1%">
													</td>
													<td align="left" width="1%">
													</td>
													<td align="left">
														<%# DisplaySubCats(DataBinder.Eval(Container.DataItem,"CategoryID"), "Normal") %>
													</td>
													<td align="right" class="Normal">
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</ItemTemplate>
							<FooterTemplate>
								<table width="100%">
									<tr>
										<td width="30%" align="left">
										</td>
										<td width="40%" align="center">
										</td>
										<td width="30%" align="right">
											<asp:ImageButton id="btnItemAdd_Classifieds" Runat="server" Visible="<%# ItemEdit %>" CommandName="lnkAddItem" AlternateText="Post New Job" ImageAlign="absmiddle" ImageUrl="images/ico-message1.gif">
											</asp:ImageButton>
											<asp:LinkButton id="lnkAddItem_Classifieds" Runat="server" CssClass="Normal" Visible="<%# ItemEdit %>" Name="lnkAddItem" CommandName="lnkAddItem">Post New Job</asp:LinkButton>
										</td>
									</tr>
								</table>
							</FooterTemplate>
						</asp:DataList>
						<TABLE width="100%" border="0">
							<TR>
								<TD>
									<asp:panel id="pnlSort" runat="server" BorderWidth="0" Visible="True" HorizontalAlign="Center"
										BorderColor="black" CssClass="NormalBold">Sort By: 
<asp:DropDownList id="cboSortBy" Runat="server" CssClass="Normal"></asp:DropDownList>
<asp:HyperLink id=hpl_SortOption runat="server" Visible="<%# EditPermission %>" CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "so") %>'>Edit</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Sort Type: 
<asp:DropDownList id="cboSortType" Runat="server" CssClass="Normal" EnableViewState="true">
											<asp:ListItem Value="desc">Descending</asp:ListItem>
											<asp:ListItem Value="asc">Ascending</asp:ListItem>
										</asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<asp:Button id="btnSort" runat="server" CssClass="Normal" Text="Sort" CausesValidation="False"></asp:Button><BR><SPAN class="Normal">Default sorting is by Date Posted, most recent 
            first.</SPAN> </asp:panel></TD>
								<TD>
									<asp:panel id="pnlFilter" runat="server" BorderWidth="0" Visible="True" HorizontalAlign="Center"
										BorderColor="black" CssClass="NormalBold">Filter: 
<asp:dropdownlist id="ddlEmpType" runat="server" CssClass="Normal" AutoPostBack="True">
											<asp:ListItem Value="ALL">ALL</asp:ListItem>
										</asp:dropdownlist><BR><SPAN class="Normal">Select above to 
            filter by job type.</SPAN> </asp:panel></TD>
							</TR>
						</TABLE>
						<asp:datagrid id="myDataGrid" runat="server" width="100%" BorderWidth="0" BorderStyle="None" BorderColor="Transparent" EnableViewState="True" ShowHeader="False"
							ItemStyle-VerticalAlign="Top" Allowsorting="False" AllowPaging="True" PageSize="5" OnPageIndexChanged="myDataGrid_Page"
							PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-HorizontalAlign="Right"
							PagerStyle-mode="NumericPages" HeaderStyle-CssClass="JediCss_TableHeader" HeaderStyle-HorizontalAlign="Center"
							AutoGenerateColumns="False" Cssclass="Normal" CellPadding=0 CellSpacing=0 >
							<Columns>
								<asp:TemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-BorderWidth="0">
									<ItemTemplate>
										<div>
											<table cellpadding="0" class="JediCss_ItemTop" cellspacing="0" width="100%">
												<tr>
													<td width="100%" height="18" align="left"><a href='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "info", "&ItemID=" & DataBinder.Eval(Container.DataItem, "ItemID"))%>'>
															<%# Container.DataItem("JB_JobTitle") %>
														</a>
													</td>
												</tr>
											</table>
										</div>
										<table border="0" cellpadding="5" cellspacing="0" class="JediCss_ItemBottom" width="100%">
											<tr>
												<td align="left" Class="JediCss_RightDottedLine">
													<div>
														<%#System.Text.RegularExpressions.Regex.Replace(IIf(Len(Container.DataItem("Message").ToString) < 100, Container.DataItem("Message").ToString, Left(Container.DataItem("Message").ToString, 100) & "..."), "<(.|\n)*?>", "")%>
														<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/pt.gif")%>' border="0">
													</div>
													<table border="0" class="JediCss_ItemBottom" cellpadding="1" cellspacing="5" width="100%">
														<tr>
															<td valign="top" class="Normal" align="center" id="tdMainThumbDG" runat="server" Visible='<%# DotNetNuke.jb_Uconversion.ConvertInteger(Settings("EnableCompanyLogo")) >= 1 %>'>
																<asp:Label ID="lblImage" Runat="server" Visible="False" CssClass="JediCss_CompanyName">
																	<%# Container.DataItem("JB_CompanyName") %>
																</asp:Label>
																<A id="photolink" name="photolink" runat="server"><IMG id="photoimage" border="0" name="photoimage" runat="server" /></A>
															</td>
															<td valign="top" align="left">
															<TABLE BORDER="0" class="Normal" CELLSPACING="0" CELLPADDING="1" width="100%">
																<tr id="trEmpType" runat="server" Visible='<%# DotNetNuke.jb_Uconversion.ConvertInteger(Settings("EnableEmpType")) >= 1 %>'>
																	<td><b>Job Type:</b>
																		<%# Container.DataItem("JB_EmpType") %>																	
																	</td>
																</tr>
																<tr id="trSalary" runat="server" Visible='<%# DotNetNuke.jb_Uconversion.ConvertInteger(Settings("EnableSalary")) >= 1 %>'>
																	<td><b>Starting Salary:</b>
																		<%# DotNetNuke.jb_Utility.GetStartingSalary(Container.DataItem("JB_StartingSalary"), Container.DataItem("JB_HourlyRate"), DotNetNuke.jb_Uconversion.ConvertString(Container.DataItem("JB_OtherSalary")))%>																	
																	</td>
																</tr>																
																<tr id="trYearExp" runat="server" Visible='<%# DotNetNuke.jb_Uconversion.ConvertInteger(Settings("EnableYearExp")) >= 1 %>'>
																	<td><b>Years Experience:</b>
																		<%# Container.DataItem("JB_YearExp") %>																	
																	</td>
																</tr>															
																<tr id="trJobCode" runat="server" Visible='<%# DotNetNuke.jb_Uconversion.ConvertInteger(Settings("EnableJobCode")) >= 1 %>'>
																	<td><b>Job Code:</b>
																		<%# Container.DataItem("JB_JobCode") %>																	
																	</td>
																</tr>																
															</TABLE>
															</td>										
														</tr>
													</table>													
												</td>
											</tr>
										</table>
										
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn ItemStyle-VerticalAlign="Top" ItemStyle-BorderWidth="0" ItemStyle-Width="25%">
									<ItemTemplate>
										<table cellpadding="0" class="JediCss_ItemTop" cellspacing="0" width="100%">
											<tr>
											    <td width="45%" align="right">&nbsp;
													<%#DotNetNuke.jb_Utility.ShowFeaturedImage(Container.DataItem("Featured"), Me.TabId)%>
												</td>	
												
												<td width="45%" align="right">&nbsp;
													<%# DotNetNuke.jb_Utility.ShowNewImage(DataBinder.Eval(Container.DataItem,"CreatedDate"), CType(Settings("DaysToShowNew"), Integer)) %>
												</td>
												<td width="5%" align="right">&nbsp;
													<%# DotNetNuke.jb_Utility.ShowStopImage(Container.DataItem("DaysToExpire"), Container.DataItem("Authed")) %>
												</td>
												<td width="5%" align="right">&nbsp;													
													<asp:HyperLink ImageUrl="~/DesktopModules/PA_JobBoard/images/ico-edit1.gif" Visible="True" NavigateUrl='<%# GetEditLink(DataBinder.Eval(Container.DataItem,"ItemID"), DataBinder.Eval(Container.DataItem,"CreatedByUser")) %>' runat="server" ID="Hyperlink4" />
												</td>
											</tr>
										</table>
										<TABLE BORDER="0" class="Normal" CELLSPACING="1" CELLPADDING="1">
											<TR id="trMiles" runat="server" visible="false">
											    <TD align="left" class="JediCss_Miles"><b>Miles:</b></TD>
											    <TD align="left"><asp:Label ID="lblMiles" Runat="server" CssClass="JediCss_Miles" Text="1.00 or less"></asp:Label></TD>
										    </TR>
										    <TR>
												<TD align="left"><b>Listing #:</b></TD>
												<TD align="left">
											        <%# Container.DataItem("ItemID") %>										
											        <asp:HyperLink ID="hplRenewal" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "rnw", "&ItemID=" & DataBinder.Eval(Container.DataItem, "ItemID"))%>' Enabled="True" runat="server">
											        [Renew]
											        </asp:HyperLink>
											    </TD>
											</TR>
											<TR>
												<TD align="left"><b>Posted:</b></TD>
												<TD align="left"><%# DataBinder.Eval(Container.DataItem,"CreatedDate", "{0:d}") %></TD>
											</TR>
											<TR id="trShowViewCount" runat="server" Visible='<%# IIF( CType(Settings("ShowViewCount"), String) = "1", True, False) %>' >
												<TD align="left"><b>View:</b></TD>
												<TD align="left"><%# Container.DataItem("ViewCount") %></TD>
											</TR>
											<TR id="trShowDaysToExpire" runat="server" Visible='<%# IIF( CType(Settings("ShowDaysToExpire"), String) = "1", True, False) %>' >
												<TD align="left"><b>Expires in:</b></TD>
												<TD align="left"><%# IIF(IsDBNull(Container.DataItem("DaysToExpire")),"Never expire", Container.DataItem("DaysToExpire") & " days") %></TD>
											</TR>
											<TR id="trApplicants" runat="server" Visible='<%# DotNetNuke.Security.PortalSecurity.HasEditPermissions(ModuleConfiguration.ModulePermissions) %>' >
												<TD align="left"><b>Applicants:</b></TD>
												<TD align="left"><%# Container.DataItem("JobAppCnt") %></TD>
												
											</TR>
											<TR id="trReviewShowAvgInDG" runat="server" Visible='<%# DotNetNuke.jb_Dispatch.dsp_ReviewShowAvgInDG %>' >
												<TD align="left"><b>Avg. Review:</b></TD>
												<TD align="left"><%#IIf(DotNetNuke.jb_Dispatch.dsp_ReviewShowAvgInDG = True, DotNetNuke.jb_ItemReview.GetAverageReview(Container.DataItem("ItemID"), Container.DataItem("JB_JobTitle"), Me.TabId, DotNetNuke.Services.Localization.Localization.GetString("Review_BeTheFirst.Text", Me.LocalResourceFile)), "")%></TD>
											</TR>
											
										</TABLE>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
					</asp:panel><BR>
					<asp:panel id="pnlNewListings" runat="server" Visible="False" HorizontalAlign="Center">
						<asp:table id="Table3" Runat="server" Width="100%" HorizontalAlign="Center" CssClass="JediCss_TopStrip"
							CellPadding="1" CellSpacing="0">
							<asp:TableRow Visible="True" valign="top"  HorizontalAlign="Left">
								<asp:TableCell CssClass="NormalBold" ID="Tablecell2" Runat="server"><img src='<%= IIf(Request.ApplicationPath = "/", "", Request.ApplicationPath) & "/DesktopModules/PA_JobBoard/images/ico-pin.gif" %>' border="0">&nbsp;New Listings in last <%= CType(Settings("DaysWhatsNew"), String)%> days.</asp:TableCell>
							</asp:TableRow>
						</asp:table>
						<asp:datagrid id="Datagrid1" runat="server" width="100%" EnableViewState="True" Allowsorting="False"
							AllowPaging="False" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-HorizontalAlign="Right"
							PagerStyle-mode="NumericPages" HeaderStyle-CssClass="JediCss_TableHeader" HeaderStyle-HorizontalAlign="Center"
							AutoGenerateColumns="False" Cssclass="Normal" AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem">
							<Columns>
								<asp:BoundColumn HeaderText="Posted" DataField="CreatedDate" DataFormatString="{0:d}" HeaderStyle-Wrap="False" 
									Visible="True"  ItemStyle-CssClass="Normal" HeaderStyle-Cssclass="NormalBold" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
								<asp:TemplateColumn HeaderText="Job Title" HeaderStyle-Wrap="False"  ItemStyle-CssClass="Normal" HeaderStyle-Cssclass="NormalBold" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<a href = '<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "info", "&ItemID=" & DataBinder.Eval(Container.DataItem, "ItemID"))%>'>
											<%# Container.DataItem("JB_JobTitle") %>
										</a>
										<asp:Image id="PhotoWhatsNew" AlternateText="Photo Available" runat="server" ImageUrl="~/DesktopModules/PA_JobBoard/images/photo.gif"
											Visible="False"></asp:Image>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Company" DataField="JB_CompanyName" HeaderStyle-Wrap="False" Visible="True"  ItemStyle-CssClass="Normal" HeaderStyle-Cssclass="NormalBold" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" />
								<asp:BoundColumn HeaderText="Emp. Type" DataField="JB_EmpType" HeaderStyle-Wrap="False" Visible="True"  ItemStyle-CssClass="Normal" HeaderStyle-Cssclass="NormalBold" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
								<asp:TemplateColumn HeaderStyle-Wrap="False"  ItemStyle-CssClass="Normal" HeaderStyle-Cssclass="NormalBold" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
									<HeaderTemplate>
										<%="Salary " & DotNetNuke.jb_Utility.GetCurrencySymbol("pr")%>
									</HeaderTemplate>
									<ItemTemplate>
										<%# DotNetNuke.jb_Utility.GetStartingSalary(Container.DataItem("JB_StartingSalary"), Container.DataItem("JB_HourlyRate"), DotNetNuke.jb_Uconversion.ConvertString(Container.DataItem("JB_OtherSalary")))%>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
					</asp:panel></TD>
				<TD id="tdRightColumn" runat="server"  vAlign="top" width="0%"><!-- COL3: Section B: Manage Listings -->
					<asp:datagrid id="dgManageListings" runat="server" Visible="True" BorderWidth="0px" BorderStyle="None" BorderColor="Transparent" width="100%"
						EnableViewState="True" CellPadding="0" ShowHeader="False" Allowsorting="False" HeaderStyle-CssClass="JediCss_TableHeader"
						HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False" Cssclass="Normal" ItemStyle-CssClass="Normal" GridLines="None">
						<Columns>
							<asp:TemplateColumn ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="top">
								<ItemTemplate>
									<table border="0" width="100%" cellpadding="0" cellspacing="0" >
										<tr id="trQL_Subscription" runat="server" Visible="<%# DotNetNuke.jb_Dispatch.dsp_SubscriptionEnable %>" >
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-subscription1.gif")%>' border="0" />
												<asp:HyperLink ID="hplQL_Subscription" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "sc") %>' Enabled="True" runat="server">
													Subscription
												</asp:HyperLink>
											</td>
										</tr>
										<tr id="trQL_AddItem" runat="server" Visible="<%# ItemEdit %>" >
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-postlisting.gif")%>' border="0">
												<asp:HyperLink ID="hplQL_AddItem" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "ia", "&parentid=" & IIF(DotNetNuke.jb_Uconversion.ConvertString(Request.Params("parentID")) = "", 0, Request.Params("parentID"))& "&ItemID=0") %>' Enabled="True" runat="server">
													Post New Job
												</asp:HyperLink>
											</td>
										</tr>
										<tr id="trQL_PicklistAdmin" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-picklistadmin1.gif")%>' border="0" />
												<asp:HyperLink ID="hplQL_PicklistAdmin" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "picklistadmin")%>' Enabled="True" runat="server">
														Manage Picklists
													</asp:HyperLink>
											</td>
										</tr>
										<tr id="trQL_SortOption" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-sort4.gif")%>' border="0" />
												<asp:HyperLink ID="hplQL_SortOption" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "so")%>' Enabled="True" runat="server">
														Manage Sort Options
													</asp:HyperLink>
											</td>
										</tr>
										<tr id="trQL_AdminPanel_DNN6_2982" runat="server" Visible="<%# DotNetNuke.jb_Dispatch.dsp_ManageCategories %>" >
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-category4.gif")%>' border="0">
												<asp:HyperLink ID="hplQL_AdminPanel_DNN6_2982" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "ap")%>' Enabled="True" runat="server">
													Manage Categories
												</asp:HyperLink>
											</td>
										</tr>
										<tr id="trQL_ManageListings" runat="server" Visible="<%# DotNetNuke.jb_Dispatch.dsp_AuthorizeListings %>">
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-managelistings.gif")%>' border="0" />
												<asp:HyperLink ID="hplQL_ManageListings" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "la")%>' Enabled="True" runat="server">
														Manage Listings
													</asp:HyperLink>
											</td>
										</tr>								
									     <tr id="trQL_ManageJobApplication" runat="server" Visible="<%# EditPermission %>">
										    <td class="Normal">
											    <img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-folder-page.png")%>' border="0" />
											    <asp:HyperLink ID="hplQL_ManageJobApplication" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "mje")%>' Enabled="True" runat="server">
													    Manage Job Applications
												    </asp:HyperLink>
										    </td>
									    </tr>
									    <tr id="trQL_ManageReviews" runat="server" Visible="<%# DotNetNuke.jb_Dispatch.dsp_ReviewAdmin %>">
										    <td class="Normal">
											    <img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-reviewadmin.gif")%>' border="0" />
											    <asp:HyperLink ID="hplQL_ManageReviews" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "ram")%>' Enabled="True" runat="server">
													    Manage Reviews
												    </asp:HyperLink>
										    </td>
									    </tr>									 
										<tr id="trQL_AttributeTemplate" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-template2.gif")%>' border="0" />
												<asp:HyperLink ID="hplQL_AttributeTemplate" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "templateadmin")%>' Enabled="True" runat="server">
														Attribute Template
													</asp:HyperLink>
											</td>
										</tr>	
										<tr id="trHR_Notification" runat="server" Visible="<%# DotNetNuke.jb_Dispatch.dsp_EnableCatSubsNotify %>" >
											<td class="Normal">
												<HR class="JediCss_DashedLine" width="100%" SIZE="1" />
											</td>
										</tr>
										<tr id="trQL_Notification" runat="server" Visible="<%# DotNetNuke.jb_Dispatch.dsp_EnableCatSubsNotify %>">
											<td class="Normal">
												<img src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/ico-emailnotification.gif")%>' border="0" />
												<asp:HyperLink ID="hplQL_Notification" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "ucs")%>' Enabled="True" runat="server">
														Email Notification
													</asp:HyperLink>
											</td>
										</tr>									
										<tr id="trHR1" runat="server" Visible="<%# IIf( Request.IsAuthenticated, True, False)  %>" >
											<td class="Normal">
												<HR class="JediCss_DashedLine" width="100%" SIZE="1" />
											</td>
										</tr>
										<tr id="trLST_MY" runat="server" Visible="<%# IIf( Request.IsAuthenticated, True, False)  %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_MY" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_MY") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_MY") > 0, True, False) %>' runat="server">
													My Listings
												</asp:HyperLink>&nbsp;--&nbsp;(<%# Container.DataItem("COUNT_LST_MY") %>)
											</td>
										</tr>
											<tr id="trLST_MY_SavedList" runat="server" Visible="<%# IIf( Request.IsAuthenticated, True, False)  %>" >
											<td class="Normal">
												<asp:HyperLink resourcekey="hplLST_MYSavedList" ID="hplLST_MYSavedList" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "mysl", "&GroupName=SavedList") %>' Enabled="true" runat="server">My Saved List</asp:HyperLink>
											    &nbsp;--&nbsp;(<%#Container.DataItem("COUNT_LST_MY_SAVED_LIST")%>)
											</td>
										</tr>
										<tr id="trLST_MY_SavedSearch" runat="server" Visible="<%# IIf( Request.IsAuthenticated, True, False)  %>" >
											<td class="Normal">
												<asp:HyperLink resourcekey="hplLST_MYSavedSearch" ID="hplLST_MYSavedSearch" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "mysl", "&GroupName=SavedSearch") %>' Enabled="true" runat="server">My Saved Search</asp:HyperLink>
											    &nbsp;--&nbsp;(<%#Container.DataItem("COUNT_LST_MY_SAVED_SEARCH")%>)
											</td>
										</tr>
										<tr id="trLST_MY_APPLICATION" runat="server" Visible="<%# IIf( Request.IsAuthenticated, True, False)  %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_MY_APPLICATION" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "mju") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_MY_APPLICATION") > 0, True, False) %>' runat="server">
													My Submitted Applications
												</asp:HyperLink>&nbsp;--&nbsp;(<%#Container.DataItem("COUNT_LST_MY_APPLICATION")%>)
											</td>
										</tr>
										<tr id="trLST_MY_HASAPPLICANT" runat="server" Visible="<%# IIf( Request.IsAuthenticated, True, False)  %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_MY_HASAPPLICANT" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_MY_HASAPPLICANT") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_MY_HASAPPLICANT") > 0, True, False) %>' runat="server">
													My Listings with applicants
												</asp:HyperLink>&nbsp;--&nbsp;(<%#Container.DataItem("COUNT_LST_MY_HASAPPLICANT")%>)
											</td>
										</tr>						
										<tr id="trHR2" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<HR class="JediCss_DashedLine" width="100%" SIZE="1" />
											</td>
										</tr>
										<tr id="trLST_EXPIRED" runat="server" Visible="<%# EditPermission %>"  >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_EXPIRED" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_EXPIRED") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_EXPIRED") > 0, True, False) %>' runat="server">
													Expired Listings
												</asp:HyperLink>&nbsp;--&nbsp;(<%# Container.DataItem("COUNT_LST_EXPIRED") %>)
											</td>
										</tr>
										<tr id="trLST_UNAPPROVED" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_UNAPPROVED" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_UNAPPROVED") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_UNAPPROVED") > 0, True, False) %>' runat="server">
													Unapproved Listings
												</asp:HyperLink>&nbsp;--&nbsp;(<%# Container.DataItem("COUNT_LST_UNAPPROVED") %>)
											</td>
										</tr>
										<tr id="trLST_WBE7" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_WBE7" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_WBE7") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_WBE7") > 0, True, False) %>' runat="server" >
													Expires in 7 days
												</asp:HyperLink>&nbsp;--&nbsp;(<%# Container.DataItem("COUNT_LST_WBE7") %>)
											</td>
										</tr>
										<tr id="trLST_WBE30" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_WBE30" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_WBE30") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_WBE30") > 0, True, False) %>' runat="server">
													Expires in 30 days
												</asp:HyperLink>&nbsp;--&nbsp;(<%# Container.DataItem("COUNT_LST_WBE30") %>)
											</td>
										</tr>
										<tr id="trLST_FEATURED" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_FEATURED" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_FEATURED") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_FEATURED") > 0, True, False) %>' runat="server">
													Featured Jobs
												</asp:HyperLink>&nbsp;--&nbsp;(<%# Container.DataItem("COUNT_LST_FEATURED") %>)
											</td>
										</tr>
										<tr id="trHR_LST_HASAPPLICANT" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<HR class="JediCss_DashedLine" width="100%" SIZE="1" />
											</td>
										</tr>
										<tr id="trLST_HASAPPLICANT" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<asp:HyperLink ID="hplLST_HASAPPLICANT" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_HASAPPLICANT") %>' Enabled='<%# IIF( Container.DataItem("COUNT_LST_HASAPPLICANT") > 0, True, False) %>' runat="server">
													Jobs with applicants
												</asp:HyperLink>&nbsp;--&nbsp;(<%# Container.DataItem("COUNT_LST_HASAPPLICANT") %>)
											</td>
										</tr>
										<tr id="trHR_ViewCount" runat="server" Visible="<%# EditPermission %>" >
											<td class="Normal">
												<HR class="JediCss_DashedLine" width="100%" SIZE="1" />
											</td>
										</tr>
										<tr id="trLST_VIEWCOUNT_TOP" runat="server" Visible="<%# EditPermission %>">
											<td clsss="Normal">
												<asp:HyperLink ID="hplLST_VIEWCOUNT_TOP" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_VIEWCOUNT_TOP") %>' runat="server">
											Most Viewed Listings
										</asp:HyperLink>
											</td>
										</tr>
										<tr id="trLST_VIEWCOUNT_BOTTOM" runat="server" Visible="<%# EditPermission %>">
											<td clsss="Normal">
												<asp:HyperLink ID="hplLST_VIEWCOUNT_BOTTOM" Visible="True" NavigateUrl='<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "main", "&filterkey=LST_VIEWCOUNT_BOTTOM") %>' runat="server">
											Least Viewed Listings
										</asp:HyperLink>
											</td>
										</tr>
									</table>
								</ItemTemplate>
							</asp:TemplateColumn>
						</Columns>
					</asp:datagrid> <!-- COL3: Section B: Featured Jobs -->  
					<asp:label id=lblSeparator_EnableFeaturedListings runat="server" CssClass="Normal"></asp:label>
					<asp:panel id="pnlFeaturedListings" runat="server" BorderWidth="1" BorderStyle="Outset" Width="100%"
						Visible="False" HorizontalAlign="Center" CssClass="JediCss_ListingsPanel">
						<asp:table id="tblLIST_FEATURED" Runat="server" Width="100%" HorizontalAlign="Center" CssClass="JediCss_TopStrip"
							CellPadding="1" CellSpacing="0">
							<asp:TableRow Visible="True" valign="top">
								<asp:TableCell CssClass="NormalBold" Wrap="False" ID="Tablecell4" Runat="server"  HorizontalAlign="Left">
									<img src='<%= IIf(Request.ApplicationPath = "/", "", Request.ApplicationPath) & "/DesktopModules/PA_JobBoard/images/ico-pin.gif" %>' border="0">
									<asp:Label ID="lblFEATURED" CssClass="NormalBold" Runat="server">
										&nbsp;Featured Jobs
									</asp:Label>
								</asp:TableCell>
							</asp:TableRow>
						</asp:table>
						<asp:datagrid id="dgFeaturedListings" runat="server" Visible="True" BorderWidth="0" BorderStyle="None" BorderColor="Transparent" width="100%"
							EnableViewState="True" CellPadding="4" ShowHeader="False" Allowsorting="False" HeaderStyle-CssClass="JediCss_TableHeader"
							HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False" Cssclass="Normal">
							<Columns>
								<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-Width="5%">
									<ItemTemplate>
										<img ID="imgBullet" align="middle" vspace="0" runat="server" src="~/DesktopModules/PA_JobBoard/images/Bullets/ico-dot4-tr.gif" />
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Width="95%">
									<ItemTemplate>
										<a href = '<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "info", "&ItemID=" & DataBinder.Eval(Container.DataItem, "ItemID"))%>'>
											<%# Container.DataItem("JB_JobTitle") %>
										</a>
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:datagrid>
					</asp:panel></TD>
			</TR>
		</TABLE>
	</DIV>
</asp:panel>
<asp:Panel ID="pnl_Popup_SavedSearch" runat="server" Height="150px" Width="300px" CssClass="ModalWindow" style="display:none;" BorderWidth="1">
<table width="100%" cellspacing="10">
    <tr>
        <td align="left"><br />	
            <asp:Label id="lbxSavedSearch_Title" runat="server" CssClass="Normal">Enter search title:</asp:Label><br />	
            <asp:textbox id="txtSavedSearch_Title" Runat="server" cssclass="Normal" Width="250px" EnableViewState="True"></asp:textbox><br />	
        </td>
    </tr>    
    <tr>
        <td align="left"><br />	
            <asp:LinkButton ID="lnkBtnSave_SavedSearch" runat="server" CssClass="button" Text="Save" OnClick="lnkBtnSaveSearch_Click" />&nbsp;&nbsp;	 
            <asp:LinkButton ID="lnkBtnCancel_SavedSearch" runat="server" CssClass="button" Text="Cancel"  />
        </td>
    </tr>
</table>        
</asp:Panel>