<%@ Control language="vb" Inherits="DotNetNuke.jb_moreinfo" CodeBehind="jb_moreinfo.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register Assembly="DnjAjaxControlToolkit" Namespace="DnjAjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Import NameSpace="DotNetNuke.jb_Utility" %>
<%@ Import NameSpace="DotNetNuke.jb_UConversion" %>
<TABLE cellSpacing="5" cellPadding="5" width="100%" align="center">
	<TR>
		<TD vAlign="top" width="100%" colspan="2" align="left"><asp:hyperlink id="BackLink" cssclass="NormalBold" Text="< Back to Previous Page" Runat="server"></asp:hyperlink></TD>
	</TR>
	<TR>
		<TD vAlign="top" width="90%">
			<!-- COLUMN 1 --><asp:panel id="Panel1" runat="server" Visible="true" HorizontalAlign="Center"
				Width="100%">
				<TABLE id="tblMoreInfoCol1" border="0" cellSpacing="0" cellPadding="3" width="100%" runat="server">
					<TR>
						<TD class="JediCss_MoreInfoTitle" vAlign="top" width="25%" colSpan="2" align="left">
							<TABLE cellSpacing="0" cellPadding="0">
								<TR>
									<TD class="JediCss_MoreInfoTitle" vAlign="top" width="99%" align="left">
										<asp:label id="lblMoreInfoTitle" runat="server"></asp:label></TD>
									<TD class="JediCss_MoreInfoTitle" width="1%" align="right"></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<tr id="trFacebook" runat="server" align="left" visble="false">
				        <td>
			                <asp:panel id="pnlFacebook" runat="server" HorizontalAlign="Left" Visible="true" Width="100%">
                                <iframe src="http://www.facebook.com/plugins/like.php?href=<%= DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "info", "&ItemID=" & Request.Params("ItemID"))%>&amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like&amp;colorscheme=light" scrolling="no" frameborder="0" allowTransparency="true" style="border:none; overflow:hidden;height:60px"></iframe>
			                </asp:panel>             				    
				        </td>				
				    </tr>	
				    <tr id="trSocialBookmarkingScript" runat="server" align="left" visble="true">
				        <td>			             
                              <asp:Literal ID="ltrSocialBookmarkingScript" runat="server"></asp:Literal>		
				        </td>				
				    </tr>		
					<TR id="trAverageReview" runat="server">
						<TD colSpan="2">
							<asp:panel id="pnlAverageReview" Width="100%" HorizontalAlign="left" Visible="False" BorderWidth="0"
								runat="server" BorderColor="black">
								<TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" align="left">
									<TR>
										<TD class="Normal" width="70%" align="left">
											<asp:label id="lblAverageReview" Visible="False" runat="server" CssClass="Normal"></asp:label>
											<A href="#REVIEW">
												<asp:label id="lblBasedOnReview" Visible="False" runat="server" CssClass="Normal"></asp:label></A>
										</TD>
										<TD class="Normal" width="30%" align="right">
											<asp:LinkButton id="lnkBtnAddReview" Visible="False" runat="server" CssClass="JediCss_Button">Write a review</asp:LinkButton></TD>
									</TR>
								</TABLE>
							</asp:panel></TD>
					</TR>
					<TR id="trJobTitle" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Job Title:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblJobTitle" runat="server"></asp:label></TD>
					</TR>
					<TR id="trJobCode" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Job Code:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblJobCode" runat="server"></asp:label></TD>
					</TR>
					<TR id="trItemLocation_Location" runat="server" visible="false">
						<TD class="Normal" vAlign="top" width="15%" align="left">Job Location:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblJobLocation" runat="server"></asp:label></TD>
					</TR>
					<TR id="trItemLocation_Postal" runat="server" visible="false">
						<TD class="Normal" vAlign="top" width="15%" align="left">Zip Code:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblZipCode" runat="server"></asp:label></TD>
					</TR>
					<TR id="trItemLocation_Full" runat="server" visible="false">
						<TD class="Normal" vAlign="top" width="15%" align="left">Address:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblAddress" runat="server"></asp:label>
						    <span id="spanMapOptions" runat="server" visible="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					            <img id="imgMapIcon" align="bottom" vspace="0" runat="server" src="~/DesktopModules/PA_JobBoard/images/ico-map.gif" /> 
                                <asp:HyperLink id="hypDirections" Runat="server" CssClass="Normal" Target="_blank">Map & Directions</asp:HyperLink>
                            </span>
						</TD>
					</TR>
					<TR id="trItemLocation_EmbeddedMap" runat="server" visible="false">
						<TD class="Normal" vAlign="top" align="left"></TD>
						<TD class="Normal" vAlign="top" align="left">
							  <asp:panel id="pnlShowEmbeddedMap" runat="server" HorizontalAlign="Left" Visible="true" Width="100%">
                                <iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                                    width='<%= DotNetNuke.jb_Uconversion.ConvertSetting(Settings("Setting_EmbeddedMapWidth"), "425") %>' 
                                    height='<%= DotNetNuke.jb_Uconversion.ConvertSetting(Settings("Setting_EmbeddedMapHeight"), "350") %>'
                                    src="<%= EmbeddedGoogleMapURL%>&amp;output=embed">
                                </iframe>	
                                <br />
                                <small><a href="<%= EmbeddedGoogleMapURL %>&amp;source=embed" class="Normal">View Larger Map</a></small>
                            </asp:panel>
						</TD>
					</TR>
					<TR id="trPhone" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Phone:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblPhone" runat="server"></asp:label></TD>
					</TR>
					<TR id="trFax" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Fax:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblFax" runat="server"></asp:label></TD>
					</TR>	
					<TR id="trEmpType" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Emp Type:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblEmpType" runat="server"></asp:label></TD>
					</TR>
					<TR id="trEducation" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Required Education:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblReqEducation" runat="server"></asp:label></TD>
					</TR>
					<TR id="trYearExp" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Years of 
							Experience:&nbsp;</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblYearExp" runat="server"></asp:label></TD>
					</TR>
					<TR id="trTravel" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Travel:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblTravel" runat="server"></asp:label></TD>
					</TR>
					<TR id="trStartingSalary" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Starting Salary:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblStartingSalary" runat="server"></asp:label></TD>
					</TR>
					<TR id="trStartDate" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Start Date:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblStartDate" runat="server"></asp:label></TD>
					</TR>
					<TR id="trNumberOpening" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left"># of Openings:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblNumberOpening" runat="server"></asp:label></TD>
					</TR>
					<TR id="trDescription" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Description:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblMessage" runat="server"></asp:label></TD>
					</TR>
					<TR id="trAddReqList" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Requirements:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:DataList id="DatalistAddReqList" Width="100%" HorizontalAlign="Left" runat="server" Cssclass="Normal"
								CellPadding="1" CellSpacing="2" RepeatColumns="3" ItemStyle-HorizontalAlign="Left">
								<ItemTemplate>
									<asp:image id="imgCheckBox" ImageUrl='<%# DotNetNuke.jb_Utility.GetCheckboxPath(LoopString, Container.DataItem, Settings("ShowEmptyCheckbox"))%>' Runat="server" align="absmiddle"></asp:image>
									<%# IIf(DotNetNuke.jb_Uconversion.ConvertString(Settings("ShowEmptyCheckbox")) = "1", DotNetNuke.jb_Utility.GetPicklistValue(Container.DataItem), Container.DataItem) %>
								</ItemTemplate>
							</asp:DataList></TD>
					</TR>
					<TR id="trItemAttribute" runat="server" visible="False">
						<TD vAlign="top" colSpan="2" align="left">
							<asp:label id="lbxItemAttribute" Visible="False" runat="server" CssClass="JediCss_MoreInfoTitle">Additional Information:</asp:label>
							<asp:datagrid id="dgItemAttribute" CellPadding="3" Visible="True" runat="server" CssClass="JediCss_DatagridTable"
								ItemStyle-CssClass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
								Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
								AllowPaging="False" HeaderStyle-CssClass="NormalBold" ShowHeader="False" DataKeyField="AttributeID">
								<Columns>
									<asp:TemplateColumn HeaderText="Specification" FooterStyle-Wrap="False">
										<ItemTemplate>
											<asp:Label ID="lblAttributeName" text='<%# DataBinder.Eval(Container.DataItem, "AttributeName") %>' Runat="server"/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Description" FooterStyle-Wrap="False">
										<ItemTemplate>
											<asp:Label ID="lblAttributeValue" text='<%# DataBinder.Eval(Container.DataItem, "AttributeValue") %>' Runat="server"/>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid></TD>
					</TR>
					<TR>
						<TD class="Normal" height="20" vAlign="top" width="15%" align="left">Attached 
							Document:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:HyperLink id="hpylAttachedDoc" runat="server" CssClass="Normal">Download attached document</asp:HyperLink>
							<asp:label id="lblAttachedDocMessage" Visible="False" runat="server" CssClass="Normal">Not Available</asp:label></TD>
					</TR>
					<TR id="trAttachedDoc" runat="server" visible="true">
						<TD class="Normal" height="20" vAlign="top" width="15%" align="left">Date 
							Posted:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblCreatedDate" runat="server"></asp:label></TD>
					</TR>
					<TR>
						<TD colSpan="2" align="left"> <!-- COL1: pnlItemImage -->  
							<asp:panel id="pnlItemImage" Width="100%" Visible="True" runat="server">
								<BR> <!-- We will use DataList here to show additional images horizontally -->
								<TABLE border="0" cellSpacing="0" cellPadding="3" width="100%">
									<TR>
										<TD class="JediCss_MoreInfoTitle" align="left">Related Images:
										</TD>
									</TR>
									<TR>
										<TD align="left">
											<asp:DataList id="dlItemImage" Width="100%" runat="server" RepeatColumns="3" HeaderStyle-CssClass="SubHead_Info"
												DataKeyField="ImageID" RepeatDirection="Horizontal" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Wrap="False"
												ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="false" RepeatLayout="Table">
												<ItemTemplate>
													<A id="photolink_ItemImage" target="_blank" href='<%# DotNetNuke.jb_Utility.GetItemImagePath( "Full", Me.ModuleId, DataBinder.Eval(Container.DataItem, "ItemID"),  DataBinder.Eval(Container.DataItem, "ImageID"), DataBinder.Eval(Container.DataItem, "ImageFileName"), DataBinder.Eval(Container.DataItem, "ImageCode") )  %>' runat="server">
														<asp:Image id="photoimage_ItemImage" Runat="server" ImageUrl='<%# DotNetNuke.jb_Utility.GetItemImagePath( "MoreImages", Me.ModuleId, DataBinder.Eval(Container.DataItem, "ItemID"),  DataBinder.Eval(Container.DataItem, "ImageID"), DataBinder.Eval(Container.DataItem, "ImageFileName"), DataBinder.Eval(Container.DataItem, "ImageCode")  )  %>' BorderWidth="0" AlternateText='<%# DataBinder.Eval(Container.DataItem, "Description") %>' >
														</asp:Image></A>
												</ItemTemplate>
												<FooterTemplate>
												</FooterTemplate>
											</asp:DataList></TD>
									</TR>
								</TABLE>
							</asp:panel> 
			                <!-- COL1: pnlItemVideo -->
			                <asp:panel id="pnlItemVideo" runat="server" Width="100%" Visible="True">
				                <BR> <!-- We will use Repeater here to show YouTube videos -->
				                <TABLE border="0" cellSpacing="0" cellPadding="3" width="100%">
					                <TR>
						                <TD class="JediCss_MoreInfoTitle" align="left">Related Videos:
						                </TD>
					                </TR>
					                <TR>
						               <TD>
							                  <asp:DataList id="dlItemVideo" runat="server" Width="100%" RepeatColumns="3" DataKeyField="VideoID"
								                HeaderStyle-CssClass="SubHead_Info" RepeatLayout="Table" ItemStyle-Wrap="false" ItemStyle-VerticalAlign="Top"
								                RepeatDirection="Horizontal" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Wrap="False">
								                <ItemTemplate>
								                 <iframe title="YouTube video player" class="youtube-player" type="text/html" 
							                            width='<%#DotNetNuke.jb_Uconversion.ConvertSetting(Settings("Setting_YouTubeVideoWidth"), "480") %>' 
							                            height='<%#DotNetNuke.jb_Uconversion.ConvertSetting(Settings("Setting_YouTubeVideoHeight"), "385") %>'
							                            src='<%#DataBinder.Eval(Container.DataItem, "url") %>?wmode=opaque'  
							                            frameborder="0" allowFullScreen>
							                        </iframe>	
							                        <br />						    
							                        <%#DataBinder.Eval(Container.DataItem, "Description")%>
								                </ItemTemplate>							
							                </asp:DataList>
						                </TD>
					                </TR>
				                </TABLE>
			                </asp:panel>
			                <!-- COL1: pnlItemCoupon -->
			<asp:panel id="pnlItemCoupon" runat="server" Width="100%" Visible="False" BorderWidth="0">
				<BR> 
				<TABLE border="0" cellSpacing="0" cellPadding="3" width="100%">
					<TR>
						<TD class="JediCss_MoreInfoTitle" align="left">Related Coupons:
						</TD>
					</TR>
					<TR>
						<TD>
							  <asp:DataList id="dlItemCoupon" runat="server" Width="50%" RepeatColumns="1" DataKeyField="InfoID"
								HeaderStyle-CssClass="SubHead_Info" RepeatLayout="Table" ItemStyle-Wrap="false" ItemStyle-VerticalAlign="Top"
								RepeatDirection="Horizontal" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Wrap="False">
								<ItemTemplate>	
								       <table class="JediCss_Coupon" border="0" width="50%">
							                <tr>
							                    <td colspan="2" class="JediCss_CouponName"><%#DataBinder.Eval(Container.DataItem, "InfoName")%>&nbsp;</td>
							                </tr> 
							                <tr>
							                    <td colspan="2" class="JediCss_CouponDesc"><%#DataBinder.Eval(Container.DataItem, "InfoDesc")%>&nbsp;</td>
							                </tr> 
							                <tr>
							                    <td align="left" class="JediCss_CouponCode">							                         
							                        <%#DataBinder.Eval(Container.DataItem, "InfoCode")%>&nbsp;
							                    </td>
							                    <td align="right" class="JediCss_CouponCode">&nbsp;							                    
							                        <%#IIf(DataBinder.Eval(Container.DataItem, "IsNeverExpires") = True, "Never Expires", "Exp: " & Container.DataItem("DateExpired"))%>
							                    </td>
							                </tr>
							        </table>
							        <div style="height:5px;">&nbsp;</div> 							        
								</ItemTemplate>							
							</asp:DataList>
						</TD>
					</TR>
				</TABLE>
			</asp:panel>
			<!-- COL1: pnlItemFile -->
							<asp:panel id="pnlItemFile" Width="100%" Visible="True" runat="server">
								<BR> <!-- We will use DataList here to show additional images horizontally -->
								<TABLE border="0" cellSpacing="0" cellPadding="3" width="100%">
									<TR>
										<TD class="JediCss_MoreInfoTitle" align="left">Related Files:
										</TD>
									</TR>
									<TR>
										<TD align="left">
											<asp:datagrid id="dgItemFile" runat="server" CellPadding="3" CssClass="JediCss_DatagridTable" ItemStyle-CssClass="Normal"
												AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
												PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" HeaderStyle-CssClass="NormalBold"
												ShowHeader="True" DataKeyField="FileID" HeaderStyle-HorizontalAlign="Center" ShowFooter="False"
												EnableViewState="True">
												<Columns>
													<asp:BoundColumn DataField="FileID" ItemStyle-HorizontalAlign="Center" HeaderText="ID" Visible="False"
														ReadOnly="True" />
													<asp:BoundColumn DataField="Description" ItemStyle-HorizontalAlign="Left" HeaderText="Description"
														Visible="True" ReadOnly="True" />
													<asp:TemplateColumn HeaderText="Download File(s)" ItemStyle-Wrap="False" FooterStyle-Wrap="False">
														<ItemTemplate>
															<A id="filelink_ItemFile" target="_blank" href='<%# jb_Utility.GetFilePath_File("FILE", Me.ModuleId, DataBinder.Eval(Container.DataItem, "ItemID"), False, False, DataBinder.Eval(Container.DataItem, "FileID"), DataBinder.Eval(Container.DataItem, "ImageFileName"))  %>' runat="server">
																<%# DataBinder.Eval(Container.DataItem, "ImageFileName") %>
															</A>
														</ItemTemplate>
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
												</Columns>
											</asp:datagrid></TD>
									</TR>
								</TABLE>
							</asp:panel></TD>
					</TR>
					<TR>
						<TD class="JediCss_MoreInfoTitle" vAlign="top" colSpan="2" align="left"><BR>
							Company Information</TD>
					</TR>
					<TR id="trCompanyName" runat="server" visible="True">
						<TD class="Normal" vAlign="top" width="15%" align="left">Company Name:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblCompanyName" runat="server"></asp:label></TD>
					</TR>
					<TR id="trCompanyLogo" runat="server" visible="True">
						<TD class="Normal" vAlign="top" width="15%" align="right"></TD>
						<TD class="Normal" vAlign="top" width="85%" align="left"><A id="photolink" name="photolink" target="_blank" runat="server"><IMG id="photoimage" border="0" name="photoimage" runat="server"></A>
							<asp:label id="lblImage" cssclass="Normal" Runat="server"></asp:label></TD>
					</TR>
					<TR id="trBenefitsList" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Benefits:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:DataList id="DatalistBenefitsList" Width="100%" HorizontalAlign="Left" runat="server" CssClass="Normal"
								CellPadding="1" CellSpacing="2" RepeatColumns="3" ItemStyle-HorizontalAlign="Left">
								<ItemTemplate>
									<asp:image id="imgCheckBox2" ImageUrl='<%# DotNetNuke.jb_Utility.GetCheckboxPath(LoopString2, Container.DataItem, Settings("ShowEmptyCheckbox"))%>' Runat="server" align="absmiddle"></asp:image>
									<%# IIf(DotNetNuke.jb_Uconversion.ConvertString(Settings("ShowEmptyCheckbox")) = "1", DotNetNuke.jb_Utility.GetPicklistValue(Container.DataItem), Container.DataItem) %>
								</ItemTemplate>
							</asp:DataList></TD>
					</TR>
					<TR id="trContactInfo" runat="server" visible="true">
						<TD class="Normal" vAlign="top" width="15%" align="left">Attention:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblContactInfo" runat="server"></asp:label></TD>
					</TR>
					<TR id="trViewEmail" runat="server">
						<TD class="Normal" vAlign="top" width="15%" align="left">Contact Email:</TD>
						<TD class="Normal" vAlign="top" width="85%" align="left">
							<asp:label id="lblContactEmail" runat="server"></asp:label></TD>
					</TR>
				</TABLE>
			</asp:panel>
			
			<!-- COL1: pnlItemCategory -->
			<asp:panel id="pnlItemCategory" runat="server" Visible="True"
				Width="100%"><BR> <!-- We will use DataList here to show additional images horizontally -->
				<TABLE border="0" cellSpacing="0" cellPadding="3" width="100%">
					<TR>
						<TD class="JediCss_MoreInfoTitle" align="left">Also listed under:
						</TD>
					</TR>
					<TR>
						<TD align="left">
							<asp:datagrid id="dgItemCategory" Width="100%" BorderWidth="0" Visible="True" runat="server" CssClass="JediCss_DatagridTable"
								ItemStyle-HorizontalAlign="Left" ItemStyle-CssClass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
								Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
								AllowPaging="False" HeaderStyle-CssClass="JediCss_TableHeader" ShowHeader="False" DataKeyField="CategoryID"
								ShowFooter="False">
								<Columns>
									<asp:BoundColumn DataField="CategoryID" ItemStyle-HorizontalAlign="Center" HeaderText="CategoryID"
										Visible="False" ReadOnly="True" />
									<asp:TemplateColumn HeaderText="Also list under" FooterStyle-Wrap="False">
									    <ItemStyle BorderWidth="0" />
										<ItemTemplate>
											<asp:HyperLink CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.GetApplicationPath() & "?tabid=" & Me.TabId  & "&action=cat&parentid=" & DataBinder.Eval(Container.DataItem,"CategoryID") %>' id="hplCategoryName" runat="server">
												<%# DataBinder.Eval(Container.DataItem, "CategoryPath") & " (" & DataBinder.Eval(Container.DataItem, "CategoryID") & ")"  %>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid></TD>
					</TR>
				</TABLE>
			</asp:panel>
			<!-- PAGE OPTIONS -->
			<asp:label id="lblSeparator_pnlPageOptions" runat="server" CssClass="Normal">
				<br>
			</asp:label>
			<asp:panel id="pnlPageOptions" Runat="server" Width="100%" CssClass="Normal" visible="true">
				<TABLE border="0" cellSpacing="0" cellPadding="3" width="100%">
					<TR>
						<TD class="JediCss_MoreInfoTitle" vAlign="top" align="left">
							<asp:Label id="lbxPageOptions" Runat="server" text="Page Options">Page Options</asp:Label></TD>
					</TR>
				</TABLE>
				<asp:panel id="pnlPageOptionsNav" Width="100%" HorizontalAlign="Left" Visible="true" runat="server">
					<asp:table id="tblPageOptionsNav" Runat="server" Width="100%" HorizontalAlign="Center" CellPadding="3"
						CellSpacing="0">
						<asp:TableRow Visible="False">
							<asp:TableCell cssclass="JediCss_MoreInfoTitle" ColumnSpan="3">
							Page Options
						</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow>
							<asp:TableCell>
								<asp:LinkButton Runat="server" ID="lnkApplyJob_classifieds" Enabled="True" CausesValidation="False">Apply Now</asp:LinkButton>
							</asp:TableCell>
							<asp:TableCell>
								<asp:LinkButton Runat="server" ID="lnkEmail_classifieds" Enabled="True" CausesValidation="False">Email this page</asp:LinkButton>
							</asp:TableCell>
							<asp:TableCell>
								<asp:HyperLink Runat="server" ID="lnkPrinter_classifieds">Print this page</asp:HyperLink>
							</asp:TableCell>
							<asp:TableCell Visible="True">
								<asp:LinkButton Runat="server" ID="lnkFavorites_classifieds" CausesValidation="False">Add to My List</asp:LinkButton>
							</asp:TableCell>
							<asp:TableCell Visible="False">
								<asp:LinkButton Runat="server" ID="lnkMakeInquiry_classifieds" CausesValidation="False" Enabled="True">Make an Inquiry</asp:LinkButton>
							</asp:TableCell>
						</asp:TableRow>
					</asp:table>
					<asp:Label ID="lblPageOptions" runat="server" CssClass="NormalRed"></asp:Label>	 
				</asp:panel>
				<asp:Panel id="pnlApplyJob" Width="100%" Visible="False" runat="server">
					<TABLE id="tblApplyJob" cellSpacing="1" cellPadding="1" width="100%" runat="server">
						<TR>
							<TD class="Normal" width="20%" align="left">Applicant Name:</TD>
							<TD class="Normal" align="left">
								<asp:textbox id="txtApplicantName" cssclass="Normal" runat="server" width="255" maxlength="100"></asp:textbox>
								<asp:requiredfieldvalidator id="val_req_txtApplicantName" runat="server" CssClass="NormalRed" Display="Dynamic"
									ErrorMessage="*" ControlToValidate="txtApplicantName"></asp:requiredfieldvalidator></TD>
						</TR>
						<TR>
							<TD class="Normal" width="20%" align="left">Applicant Email:</TD>
							<TD class="Normal" align="left">
								<asp:textbox id="txtApplicantEmail" cssclass="Normal" runat="server" width="255" maxlength="100"></asp:textbox>
								<asp:requiredfieldvalidator id="val_req_txtApplicantEmail" runat="server" CssClass="NormalRed" Display="Dynamic"
									ErrorMessage="*" ControlToValidate="txtApplicantEmail"></asp:requiredfieldvalidator>
								<asp:regularexpressionvalidator id="val_regex_txtApplicantEmail" runat="server" CssClass="NormalRed" Display="Dynamic"
									ErrorMessage="Email Must be Valid." ControlToValidate="txtApplicantEmail" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"></asp:regularexpressionvalidator></TD>
						</TR>
						<TR>
							<TD class="Normal" width="20%" align="left">Salary Requirement:</TD>
							<TD class="Normal" align="left">
								<asp:textbox id="txtSalaryReq" cssclass="Normal" runat="server" width="255" maxlength="100"></asp:textbox></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" vAlign="top" width="20%" align="left">
								<P>Note:</P>
							</TD>
							<TD class="Normal" align="left">
								<asp:textbox id="txtApplicantMessage" cssclass="Normal" runat="server" width="255" maxlength="100"
									ToolTip="Enter your message."></asp:textbox>
								<asp:label id="lbxApplicantMessage" runat="server" CssClass="Normal"></asp:label></TD>
						</TR>
						<TR>
							<TD class="Normal" width="20%" align="left">Upload Cover Letter:</TD>
							<TD class="Normal" align="left"><input id="inpCoverLetter" class="Normal" size="47" type="file" runat="server" />
							</TD>
						</TR>
						<TR>
							<TD class="Normal" width="20%" align="left">Upload Resume:</TD>
							<TD class="Normal" align="left"><input id="inpResume" class="Normal" size="47" type="file" runat="server" />
								<asp:requiredfieldvalidator id="val_req_inpResume" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"
									ControlToValidate="inpResume" Enabled="false"></asp:requiredfieldvalidator></TD>
						</TR>
						<TR>
							<TD class="Normal" width="20%" align="left">How did you hear about this job opening?</TD>
							<TD class="Normal" align="left">
							    <asp:dropdownlist id="ddlJobLead" runat="server" cssclass="Normal"></asp:dropdownlist>
							</TD>
						</TR>					
						<TR>
							<TD class="Normal" width="20%" align="left"></TD>
							<TD class="Normal" align="left">
								<asp:linkbutton id="cmdJob_Apply" Text="Apply" BorderStyle="none" runat="server" CssClass="Normal"></asp:linkbutton>&nbsp;
								<asp:linkbutton id="cmdJob_Cancel" Text="Cancel" BorderStyle="none" runat="server" CssClass="Normal"
									CausesValidation="False"></asp:linkbutton>&nbsp;
							</TD>
						</TR>
					</TABLE>
				</asp:Panel>
				<asp:panel id="pnlEmailFriend" Width="100%" Visible="False" runat="server">
					<TABLE border="0" cellSpacing="1" cellPadding="1" width="100%">
						<TR vAlign="top">
							<TD class="Normal" width="20%" align="left">Your E-Mail:</TD>
							<TD class="Normal" align="left">
								<asp:TextBox id="txtEMail" cssclass="Normal" runat="server" width="255" maxlength="100" ToolTip="Enter your e-mail address."
									columns="40"></asp:TextBox>
								<asp:requiredfieldvalidator id="val_req_txtEmail" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"
									ControlToValidate="txtEmail"></asp:requiredfieldvalidator>
								<asp:regularexpressionvalidator id="val_regex_txtEmail" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="Email Must be Valid."
									ControlToValidate="txtEMail" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"></asp:regularexpressionvalidator></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" width="20%" align="left">Recipient's E-Mail:</TD>
							<TD class="Normal" align="left">
								<asp:TextBox id="txtFriend" cssclass="Normal" Width="255" runat="server" MaxLength="100" ToolTip="Enter your friend's E-Mail address."
									Columns="40"></asp:TextBox>
								<asp:requiredfieldvalidator id="val_req_txtFriend" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"
									ControlToValidate="txtFriend"></asp:requiredfieldvalidator>
								<asp:regularexpressionvalidator id="val_regex_txtFriend" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="Email Must be Valid."
									ControlToValidate="txtFriend" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"></asp:regularexpressionvalidator></TD>
						</TR>
						<TR>
							<TD class="Normal" width="20%" align="left">Your Name:</TD>
							<TD class="Normal" align="left">
								<asp:TextBox id="txtName" cssclass="Normal" runat="server" width="255" maxlength="100" ToolTip="Enter your name."
									columns="40"></asp:TextBox>
								<asp:requiredfieldvalidator id="val_req_txtName" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"
									ControlToValidate="txtName"></asp:requiredfieldvalidator></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" width="20%" align="left">Subject:</TD>
							<TD class="Normal" align="left">
								<asp:TextBox id="txtSubject" cssclass="Normal" runat="server" width="255" maxlength="100" ToolTip="Enter subject."
									columns="40"></asp:TextBox>
								<asp:requiredfieldvalidator id="val_req_txtSubject" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*"
									ControlToValidate="txtSubject"></asp:requiredfieldvalidator></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" width="20%" align="left">Add a personal note:</TD>
							<TD class="Normal" align="left">
								<asp:TextBox id="txtBody" cssclass="Normal" runat="server" Height="67px" TextMode="Multiline"
									width="255" ToolTip="Enter your message." columns="59" Rows="15"></asp:TextBox><BR>
								<asp:LinkButton id="cmdEmail_Submit" class="CommandButton" onclick="SubmitBtn_Click" Text="Submit"
									runat="server" ToolTip="Submit your question.">Submit</asp:LinkButton>&nbsp;
								<asp:linkbutton id="cmdEmail_Cancel" class="CommandButton" Text="Cancel" BorderStyle="none" runat="server"
									CausesValidation="False"></asp:linkbutton></TD>
						</TR>
					</TABLE>
				</asp:panel>
				<asp:panel id="pnlInquiry" Width="100%" Visible="False" runat="server">
					<TABLE id="tblInquiry" border="0" width="100%" runat="server">
						<TR vAlign="top">
							<TD class="Normal" align="left">I would like to:<BR>
								<asp:radiobuttonlist id="optInquiry" runat="server" CssClass="NormalBold" RepeatDirection="Vertical"
									AutoPostBack="True">
									<asp:ListItem Value="inquiry" Selected="True">Make an inquiry</asp:ListItem>
									<asp:ListItem Value="interview">Schedule an interview</asp:ListItem>
								</asp:radiobuttonlist></TD>
						</TR>
						<TR id="trProposedInterview" runat="server" visible="False">
							<TD class="Normal" align="left">
								<asp:label id="lblProposedInterview" Visible="False" runat="server" CssClass="Normal">Proposed Schedule:</asp:label><BR>
								<asp:TextBox id="txtProposedInterview" cssclass="Normal" Visible="False" runat="server" TextMode="MultiLine"
									width="150px" maxlength="100" ToolTip="Proposed Interview" columns="40"></asp:TextBox></TD>
						</TR>
						<TR>
							<TD class="Normal" align="left">Your Name/Company:<BR>
								<asp:TextBox id="txtInquiryName" cssclass="Normal" runat="server" width="150px" maxlength="100"
									ToolTip="Enter your name/company." columns="40"></asp:TextBox></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" align="left">Your E-Mail Address:<BR>
								<asp:TextBox id="txtInquiryEmail" cssclass="Normal" Width="150px" runat="server" MaxLength="100"
									ToolTip="Enter E-Mail address." Columns="40"></asp:TextBox>
								<asp:regularexpressionvalidator id="val_regex_txtInquiryEmail" runat="server" CssClass="NormalRed" Display="Dynamic"
									ErrorMessage="Email Must be Valid." ControlToValidate="txtInquiryEmail" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"></asp:regularexpressionvalidator></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" align="left">Your Phone #:<BR>
								<asp:TextBox id="txtInquiryPhone" cssclass="Normal" runat="server" width="150px" maxlength="100"
									ToolTip="Enter Phone Number." columns="40"></asp:TextBox></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" align="left">
								<asp:label id="lblSendTo" Visible="False" runat="server" CssClass="Normal">Send to:</asp:label><BR>
								<asp:TextBox id="txtInquirySendToEmail" cssclass="Normal" Width="150px" runat="server" MaxLength="100"
									Columns="40" Enabled="False"></asp:TextBox>
								<asp:regularexpressionvalidator id="val_regex_txtInquirySendToEmail" runat="server" CssClass="NormalRed" Display="Dynamic"
									ErrorMessage="Email Must be Valid." ControlToValidate="txtInquirySendToEmail" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"></asp:regularexpressionvalidator></TD>
						</TR>
						<TR vAlign="top">
							<TD class="Normal" align="left">Questions/Comments:<BR>
								<asp:TextBox id="txtQuestionsComments" cssclass="Normal" runat="server" Height="67px" TextMode="Multiline"
									width="150px" ToolTip="Enter your message." columns="59" Rows="15"></asp:TextBox><BR>
								<asp:LinkButton id="lnkBtnInquiry" class="CommandButton" onclick="lnkBtnInquiry_Click" Text="Submit"
									runat="server" ToolTip="Submit your questions/comments.">Submit</asp:LinkButton>&nbsp;
								<asp:linkbutton id="cmdCancelInquiry" class="CommandButton" Text="Cancel" BorderStyle="none" runat="server"
									CausesValidation="False"></asp:linkbutton></TD>
						</TR>
					</TABLE>
				</asp:panel>
				<asp:label id="lblMessage_PageOptions" runat="server" CssClass="NormalRed"></asp:label>
			</asp:panel><br>
			<!-- JOP APPLICANT -->
			<asp:panel id="pnlJobApplicant" Runat="server" Width="100%" CssClass="Normal" visible="true" >
				<TABLE border="0" cellSpacing="0" cellPadding="3" width="100%">
					<TR>
						<TD class="JediCss_MoreInfoTitle" vAlign="top" align="left">
							<asp:Label id="lbxJobApplicant" Runat="server" text="Submitted Application(s)">Submitted Application(s)</asp:Label></TD>
					</TR>
				</TABLE>
				<BR>
				<asp:datagrid id="dgJobApplicant" runat="server" CssClass="JediCss_DatagridTable" ItemStyle-CssClass="Normal" CellPadding="3"
					AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
					PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" HeaderStyle-CssClass="JediCss_TableHeader"
					DataKeyField="ApplicationID" HeaderStyle-HorizontalAlign="Center" ShowFooter="False" EnableViewState="True"
					OnUpdateCommand="dgJobApplicant_Update" OnCancelCommand="dgJobApplicant_Cancel" OnEditCommand="dgJobApplicant_Edit">
					<Columns>
						<asp:BoundColumn DataField="ApplicationID" ItemStyle-HorizontalAlign="Center" HeaderText="ID" Visible="True"
							ReadOnly="True" />
						<asp:BoundColumn HeaderText="Submitted" DataField="CreatedDate" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center"
							Visible="True" />
						<asp:TemplateColumn HeaderText="Name" FooterStyle-Wrap="False" Visible="True">
							<ItemTemplate>
								<asp:Label ID="lblJobApplicant_ApplicantName" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ApplicantName") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtJobApplicant_ApplicantName" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ApplicantName") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtJobApplicant_ApplicantName_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Email" FooterStyle-Wrap="False" Visible="True">
							<ItemTemplate>
								<asp:Label ID="lblJobApplicant_ApplicantEmail" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ApplicantEmail") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtJobApplicant_ApplicantEmail" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ApplicantEmail") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtJobApplicant_ApplicantEmail_Add" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Salary" FooterStyle-Wrap="False">
							<ItemTemplate>
								<asp:Label ID="lblJobApplicant_SalaryReq" text='<%# DataBinder.Eval(Container.DataItem, "SalaryReq") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtJobApplicant_SalaryReq" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "SalaryReq") %>' Runat="server" />
							</EditItemTemplate>
							<FooterTemplate>
								<asp:TextBox id="txtJobApplicant_SalaryReq_Add" Width="35" CssClass="Normal" text="0" Runat="server"
									EnableViewState="True"></asp:TextBox>
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Note" Visible="True">
							<ItemTemplate>
								<asp:Label ID="lblJobApplicant_Message" text='<%# DataBinder.Eval(Container.DataItem, "Message") %>' Runat="server"/>
							</ItemTemplate>
						</asp:TemplateColumn>		
						<asp:TemplateColumn HeaderText="Cover<br/> Letter" Visible="True">
							<ItemTemplate>
							    <asp:LinkButton ID="lnkBtnDownloadCoverLetter" runat="server" CssClass="Normal" CommandName="DownloadCoverLetter" CausesValidation="false" Visible='<%# DataBinder.Eval(Container.DataItem, "ImageContentSize") > 0 %>'>Open</asp:LinkButton>							
							</ItemTemplate>
						</asp:TemplateColumn>											
						<asp:TemplateColumn HeaderText="Attached<br/>Resume"  Visible="True">
							<ItemTemplate>
							    <asp:LinkButton ID="lnkBtnDownloadResume" runat="server" CssClass="Normal" CommandName="DownloadResume" CausesValidation="false" Visible='<%# DataBinder.Eval(Container.DataItem, "ImageContentSize1") > 0 %>'>Open</asp:LinkButton>							
							</ItemTemplate>
						</asp:TemplateColumn>
							<asp:TemplateColumn HeaderText="Online<br/>Resume" Visible="True" HeaderStyle-Wrap="False">
							<ItemTemplate>
								<asp:HyperLink id="hpylOnline_Resume" Text="View" Target="_blank" runat="server" />										
							</ItemTemplate>
						</asp:TemplateColumn>		
						<asp:TemplateColumn>
							<ItemTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
									CommandName="delete" CausesValidation="False" AlternateText="Delete" runat="server" ID="imgBtnDelete_JobApplicant" />
							</ItemTemplate>
							<FooterTemplate>
								<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
									CausesValidation="False" AlternateText="Add" runat="server" ID="imgBtnAdd_JobApplicant" />
							</FooterTemplate>
						</asp:TemplateColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update"
							Visible="False" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25" ItemStyle-Wrap="False" FooterStyle-Wrap="False" />
					</Columns>
				</asp:datagrid>
				<asp:Label id="lblMessage_JobApplicant" runat="server" CssClass="NormalRed"></asp:Label>
			</asp:panel>
			<!-- COL1: pnlDetailedReview -->
            <asp:panel id="pnlDetailedReview" Runat="server" HorizontalAlign="Center" Visible="False" Width="100%">
                 <br /> 
                 <table border="0" cellSpacing="0" cellPadding="3" width="100%">
                  <tr>
                       <td class="JediCss_MoreInfoTitle" align="left">Detailed Reviews:
                       </td>
                  </tr>
                  <tr>
                       <td>
                             <asp:Literal ID="ltrDetailedReview" runat="server"></asp:Literal> 
                       </td>
                  </tr>
              </table>
            </asp:panel> 
			<!-- COL1: pnlReview -->
			<asp:panel id="pnlReview" Runat="server" HorizontalAlign="Center" Visible="False" Width="100%">
			    <br /> 
                <table border="0" cellSpacing="0" cellPadding="3" width="100%">
	                <tr>
		                <td class="JediCss_MoreInfoTitle" align="left">User Reviews:
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <A name="REVIEW"></A>	
				            <asp:datagrid id="dgItemReview" Width="100%" runat="server" BorderWidth="0"
					CssClass="JediCss_DatagridTable" ItemStyle-CssClass="Normal" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right"
					Allowsorting="True" PagerStyle-PrevPageText="Prev" PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages"
					AllowPaging="False" HeaderStyle-CssClass="SubHead_Info" ShowHeader="False" DataKeyField="ReviewID"
					HeaderStyle-HorizontalAlign="Left" ShowFooter="False" EnableViewState="True">
					<Columns>
						<asp:BoundColumn DataField="ReviewID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top"
							HeaderText="ReviewID" Visible="False" ReadOnly="True" ItemStyle-BorderWidth="0" HeaderStyle-BorderWidth="0" />
						<asp:TemplateColumn HeaderText="Customer Reviews" ItemStyle-VerticalAlign="Top" ItemStyle-Wrap="True"
							FooterStyle-VerticalAlign="Top" FooterStyle-Wrap="False" HeaderStyle-CssClass="JediCss_MoreInfoTitle"
							ItemStyle-HorizontalAlign="Left" ItemStyle-BorderWidth="0" HeaderStyle-BorderWidth="0">
							<ItemTemplate>
								<asp:Label id="lbxHelpfulTop" CssClass="Normal" runat="server" Visible='<%# DotNetNuke.jb_Uconversion.ConvertBoolean(Settings("Setting_ReviewHelpful"))%>' Text='<%#  DataBinder.Eval(Container.DataItem,"Helpful_Yes") & " of " & (DataBinder.Eval(Container.DataItem,"Helpful_Yes") + DataBinder.Eval(Container.DataItem,"Helpful_No")) &  " people found the following review helpful:<br>" %>'/>
								<img src='<%# BindRatingImage(DataBinder.Eval(Container.DataItem, "Rating")) %>'>
								<asp:Label id="lbxReviewer" CssClass="NormalBold" runat="server" Text=" Reviewed by: " />
								<asp:Label ID="lblName" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' Runat="server"/>
								<asp:Label id="lbxReviewDate" CssClass="NormalBold" runat="server" Text=" On " />
								<asp:Label id="lblReviewDate" CssClass="Normal" runat="server" Text='<%# String.Format("{0:d}", Container.DataItem("CreatedDate"))%>' />
								<br>
								<asp:Label id="lbxComment" CssClass="Normal" runat="server" Text="" />&nbsp;&nbsp;
								<asp:Label id="lblComment" CssClass="Normal" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment") %>'>
								</asp:Label>
								<br>
								<asp:Label id="lbxHelpfulBottom" CssClass="Normal" Visible='<%# DotNetNuke.jb_Uconversion.ConvertBoolean(Settings("Setting_ReviewHelpful"))%>' runat="server" Text="Was this review helpful? " />
								<asp:ImageButton CssClass="Normal" Visible='<%# DotNetNuke.jb_Uconversion.ConvertBoolean(Settings("Setting_ReviewHelpful"))%>' Enabled="True" ImageUrl="~/DesktopModules/PA_JobBoard/images/module/btn-yes-yellow.gif" CommandName="yes" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReviewID") %>' runat="server" ID="imgBtnYes" />
								<asp:ImageButton CssClass="Normal" Visible='<%# DotNetNuke.jb_Uconversion.ConvertBoolean(Settings("Setting_ReviewHelpful"))%>' Enabled="True" ImageUrl="~/DesktopModules/PA_JobBoard/images/module/btn-no-yellow.gif" CommandName="no" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReviewID") %>' runat="server" ID="imgBtnNo" />
								&nbsp;
								<asp:Label id="lblHelpfulBottom_Message" CssClass="NormalRed" runat="server" Text="" />
							</ItemTemplate>
							<FooterTemplate>
								<table border="0">
									<tr>
										<td valign="top">
											<asp:RadioButtonList id="rblRating_Add" runat="server">
												<asp:ListItem text="Five" value="5" selected="True">
													<img src="DesktopModules/PA_JobBoard/images/review/YellowStars/stars-5-0.gif"></asp:ListItem>
												<asp:ListItem text="Four" value="4">
													<img src="DesktopModules/PA_JobBoard/images/review/YellowStars/stars-4-0.gif"></asp:ListItem>
												<asp:ListItem text="Three" value="3">
													<img src="DesktopModules/PA_JobBoard/images/review/YellowStars/stars-3-0.gif"></asp:ListItem>
												<asp:ListItem text="Two" value="2">
													<img src="DesktopModules/PA_JobBoard/images/review/YellowStars/stars-2-0.gif"></asp:ListItem>
												<asp:ListItem text="One" value="1">
													<img src="DesktopModules/PA_JobBoard/images/review/YellowStars/stars-1-0.gif"></asp:ListItem>
											</asp:RadioButtonList>
										</td>
										<td valign="top">
											<table border="0">
												<tr valign="top">
													<td>
														<asp:Label ID="lbxNameFooter" CssClass="NormalBold" text="Name:" Runat="server" />
														<asp:TextBox ID="txtName_Add" CssClass="Normal" Width="110" text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' Runat="server" />
														<asp:Label ID="lbxEmailFooter" CssClass="NormalBold" text="Email:" Runat="server" />
														<asp:TextBox ID="txtEmail_Add" CssClass="Normal" Width="110" text='<%# DataBinder.Eval(Container.DataItem, "Email") %>' Runat="server" />
													</td>
												</tr>
												<tr valign="top">
													<td align="left" valign="top">
														<asp:Label ID="lbxCommentFooter" CssClass="NormalBold" text="Please enter review below:" Runat="server" /><br>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<asp:TextBox id="txtComment_Add" CssClass="Normal" runat="server" TextMode="MultiLine" Width="200"
															Rows="5"></asp:TextBox>
														<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/review/submitReview.gif"
															CommandName="add" AlternateText="Add Review" runat="server" ID="imgBtnAdd_ItemReview" />
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
										</td>
									</tr>
								</table>
							</FooterTemplate>
						</asp:TemplateColumn>
					</Columns>
				</asp:datagrid>
				            <asp:Label id="lblMessage_ItemReview" runat="server" CssClass="NormalRed"></asp:Label>
			            </td>
	                </tr>
                </table>
			</asp:panel>
		</TD>
		<TD vAlign="top" width="10%">
			<!-- COLUMN 2 --><asp:panel id="pnlEdit" runat="server" CssClass="JediCss_BoxPanel" Visible="true" HorizontalAlign="Center" Width="100%">
				<TABLE class="Normal" border="0" cellSpacing="0" cellPadding="3" width="100%" height="100%">
					<TR id="trItemID_pnlEdit" runat="server">
						<TD align="left">&nbsp;
							<asp:label id="lbxItemID_pnlEdit" runat="server" CssClass="NormalBold">Listing #:</asp:label></TD>
						<TD align="left">&nbsp;
							<asp:label id="lblItemID_pnlEdit" runat="server" CssClass="Normal"></asp:label>&nbsp;&nbsp;&nbsp;
							<asp:hyperlink id="hplEdit" Visible="True" runat="server">[Edit]</asp:hyperlink></TD>
					</TR>
					<TR id="trCreatedDate_pnlEdit" runat="server">
						<TD align="left">&nbsp;
							<asp:label id="lbxCreatedDate_pnlEdit" runat="server" CssClass="NormalBold">Date Created:</asp:label></TD>
						<TD align="left">&nbsp;
							<asp:label id="lblCreatedDate_pnlEdit" runat="server" CssClass="Normal"></asp:label></TD>
					</TR>
					<TR id="trLastUpdate_pnlEdit" runat="server">
						<TD align="left">&nbsp;
							<asp:label id="lbxLastUpdate_pnlEdit" runat="server" CssClass="NormalBold">Last Updated:</asp:label></TD>
						<TD align="left">&nbsp;
							<asp:label id="lblLastUpdate_pnlEdit" runat="server" CssClass="Normal"></asp:label></TD>
					</TR>
					<TR id="trExpiredDate_pnlEdit" runat="server">
						<TD align="left">&nbsp;
							<asp:label id="lbxExpiredDate_pnlEdit" runat="server" CssClass="NormalBold">Date Expired:</asp:label></TD>
						<TD align="left">&nbsp;
							<asp:label id="lblExpiredDate_pnlEdit" runat="server" CssClass="Normal"></asp:label></TD>
					</TR>
					<TR id="trViewCount_pnlEdit" runat="server">
						<TD align="left">&nbsp;
							<asp:label id="lbxViewCount_pnlEdit" runat="server" CssClass="NormalBold">View:</asp:label></TD>
						<TD align="left">&nbsp;
							<asp:label id="lblViewCount_pnlEdit" runat="server" CssClass="Normal"></asp:label></TD>
					</TR>
				    <TR id="trPrintAd_pnlEdit" runat="server" visible="false">
						<TD align="left">&nbsp;
							<asp:label id="lbxPrintAd_pnlEdit" runat="server" resourcekey="[RESX:PrintAd_Label].Text" CssClass="NormalBold">Print Ad:</asp:label></TD>
						<TD align="left">&nbsp;
							<asp:label id="lblPrintAd_pnlEdit" runat="server" CssClass="Normal"></asp:label></TD>
					</TR>
				</TABLE>
			</asp:panel><br />
			<asp:Panel ID="pnlAnonymousEdit" runat="server" CssClass="JediCss_BoxPanel" HorizontalAlign="Center" Visible="true" Width="100%">
                <TABLE height="100%" cellSpacing="0" cellPadding="3" width="100%" border="0">
                    <tr>
                        <td>
                            <asp:label id="lbxAnonymousEdit" resourcekey="[RESX:AnonymousEdit_Label].Text" CssClass="Normal" Runat="server">Verify Edit Password:</asp:label>                 
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:label id="lbxAnonymousEditPassword" CssClass="Normal" Runat="server"></asp:label>
                            <asp:textbox id="txtAnonymousEditPassword" CssClass="Normal" runat="server" Width="120" TextMode="Password" ToolTip="This listing was posted by an unauthenticated user, password is required to edit this listing."></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:button id="btnAnonymousEditLogin" resourcekey="[RESX:AnonymousEdit_Login].Text" CssClass="Normal" runat="server"  Text="Verify"></asp:button>
                            <asp:button id="btnAnonymousEditCancel" resourcekey="[RESX:AnonymousEdit_Cancel].Text" CssClass="Normal" runat="server"  Text="Cancel"></asp:button>
                        </td>           
                    </tr>
                    <tr>
                        <td>
                            <asp:label id="lblxAnonymousEditMessage" CssClass="NormalRed" Runat="server" Visible="false">Incorrect password.</asp:label>
                        </td>
                    </tr>
                </table>       
            </asp:Panel>
		</TD>
	</TR>
</TABLE>
