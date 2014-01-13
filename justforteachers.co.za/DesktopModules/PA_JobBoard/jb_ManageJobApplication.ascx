<%@ Control language="vb" Inherits="DotNetNuke.jb_ManageJobApplication" CodeBehind="jb_ManageJobApplication.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Import NameSpace="DotNetNuke.jb_Utility" %>
<%@ Import NameSpace="DotNetNuke.jb_UConversion" %>
<asp:panel id="pnlModuleContent" Runat="server">
	<TABLE width="100%" align="center">
		<TR>
			<TD align="left" width="50%">
				<asp:hyperlink id="hplBackLink" resourcekey="[RESX:Nav_PreviousPage].Text" Runat="server" cssclass="NormalBold" Text="< Back to Previous Page"></asp:hyperlink></TD>
			<TD align="right" width="50%">
				<asp:hyperlink id="hplModuleHome" resourcekey="[RESX:Nav_ModuleHome].Text" cssclass="NormalBold" Text="Home" runat="server" Visible="True">Go to Module Home</asp:hyperlink></TD>
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
						<TD class="Normal" id="tdRss" vAlign="bottom" noWrap align="left" width="20%" runat="server" visible="false"><IMG 
            src='<%= Page.ResolveUrl("DesktopModules/PA_JobBoard/images/rss/ico-feed.gif")%>' 
            align=bottom border=0> <A class=Normal href="" target=_blank>RSS</A>
						</TD>
						<TD class="Normal" id="tdFilter" vAlign="bottom" noWrap align="center" width="30%" runat="server" visible="false">
							<asp:DropDownList id="ddlFilter" Runat="server" CssClass="Normal" EnableViewState="True" AutoPostBack="True">							
							</asp:DropDownList></TD>
						<TD class="Normal" id="tdCount" vAlign="bottom" noWrap  align="right" width="40%"  runat="server" visible="true">
							<asp:Label id="lblMessage_Count" runat="server" CssClass="Normal"></asp:Label></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD align="center" width="100%"><BR>
				<asp:datagrid id="dgJobApplicant" runat="server" Cssclass="Normal" ItemStyle-CssClass="Normal" CellPadding="3"
					AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
					PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" HeaderStyle-CssClass="JediCss_TableHeader"
					DataKeyField="ApplicationID" HeaderStyle-HorizontalAlign="Center" ShowFooter="False" EnableViewState="True"
					OnUpdateCommand="dgJobApplicant_Update" OnCancelCommand="dgJobApplicant_Cancel" OnEditCommand="dgJobApplicant_Edit">
					<Columns>
					    <asp:TemplateColumn HeaderText="" ItemStyle-Wrap="False">
							<ItemTemplate>
								<asp:HyperLink id="hpylViewApplication" CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.GetApplicationPath() & "?tabid=" & Me.TabId  & "&uc=apj&ItemID=" & DataBinder.Eval(Container.DataItem, "JobID")& "&ApplicationID=" & DataBinder.Eval(Container.DataItem,"ApplicationID") %>' runat="server" text='View'>
								</asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn HeaderText="ID" DataField="ApplicationID" ItemStyle-HorizontalAlign="Center" Visible="True"
							ReadOnly="True" />
						<asp:BoundColumn HeaderText="Submitted" DataField="CreatedDate" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center"
							Visible="True" ReadOnly="True" />
						<asp:TemplateColumn ItemStyle-CssClass="Normal" ItemStyle-HorizontalAlign="Left"  ItemStyle-Wrap="False">
							<HeaderTemplate>
								Position applied for
							</HeaderTemplate>
							<ItemTemplate>
								<a href = '<%# DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "info", "&ItemID=" & DataBinder.Eval(Container.DataItem, "JobID"))%>'>
									<%#Container.DataItem("JB_JobTitle") & " (" & DataBinder.Eval(Container.DataItem, "JobID") & ")"%>
								</a>
								<asp:Image id="PhotoSmallIcon" AlternateText="Photo Available" runat="server" ImageUrl="~/DesktopModules/PA_JobBoard/images/photo.gif"
									Visible="False"></asp:Image>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Name" FooterStyle-Wrap="False" Visible="True">
							<ItemTemplate>
								<asp:Label ID="lblJobApplicant_ApplicantName" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ApplicantName") %>' Runat="server"/>
							</ItemTemplate>					
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Email" FooterStyle-Wrap="False" Visible="True">
							<ItemTemplate>
							    <asp:Label ID="lblJobApplicant_ApplicantEmail" CssClass="Normal" text='<%# DotNetNuke.jb_Utility.FormatEmail(DataBinder.Eval(Container.DataItem, "ApplicantEmail")) %>' Runat="server"/>
							</ItemTemplate>							
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Salary" FooterStyle-Wrap="False" Visible="false">
							<ItemTemplate>
								<asp:Label ID="lblJobApplicant_SalaryReq" text='<%# DataBinder.Eval(Container.DataItem, "SalaryReq") %>' Runat="server"/>
							</ItemTemplate>						
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Applicant<br/>Note" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblJobApplicant_Message" text='<%# DataBinder.Eval(Container.DataItem, "Message") %>' Runat="server"/>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Internal<br/>Note" Visible="False">
							<ItemTemplate>
								<asp:Label ID="lblNoteInternal" text='<%# DataBinder.Eval(Container.DataItem, "NoteInternal") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtNoteInternal" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "NoteInternal") %>' Runat="server" />
							</EditItemTemplate>
						</asp:TemplateColumn>					
						<asp:TemplateColumn HeaderText="Application<br/>Status" Visible="True">
							<ItemTemplate>
								<asp:Label ID="lblStatusInternal" text='<%# DataBinder.Eval(Container.DataItem, "StatusInternal") %>' Runat="server"/>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:DropDownList id="ddlStatusInternal" runat="server" CssClass="Normal" DataTextField = "PicklistText" DataValueField = "PicklistValue" DataSource = '<%# GetDropDownListDataSource() %>' SelectedIndex='<%# GetDropDownListSelectedIndex( "PicklistValue", ConvertString(DataBinder.Eval(Container.DataItem, "StatusInternal"))) %>' />
							</EditItemTemplate>
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
				<TABLE id="tblNote" cellSpacing="5" cellPadding="0" width="100%" runat="server">
					<TR>
						<TD vAlign="top" align="left">						
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD align="center" width="100%">
				<asp:Label id="lblMessage_JobApplicant" runat="server" CssClass="NormalRed"></asp:Label></TD>
		</TR>
	</TABLE>
</asp:panel>
