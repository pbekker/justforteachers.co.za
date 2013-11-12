<%@ Import NameSpace="DotNetNuke" %>
<%@ Register TagPrefix="nbh" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavBackHome.ascx" %>
<%@ Control language="vb" Inherits="DotNetNuke.jb_ApplyJob" CodeBehind="jb_ApplyJob.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<nbh:topnav id="TopNav" runat="server"></nbh:topnav>

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
		<TR id="trOnlineResume" runat="server" visible="true" >
			<TD class="Normal" width="20%" align="left">Choose Your Online Resume:</TD>
			<TD class="Normal" align="left">
				<asp:radiobuttonlist id="rblOnlineResume" runat="server" CssClass="Normal" DataTextField="rm_FullName" DataValueField="ItemID"  
			        RepeatDirection="Vertical" AutoPostBack="False">
			    </asp:radiobuttonlist> 
			
			</TD>
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
				<asp:requiredfieldvalidator id="val_req_inpResume" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="*" Enabled="false"
					ControlToValidate="inpResume"></asp:requiredfieldvalidator></TD>
		</TR>
		<TR>
			<TD class="Normal" width="20%" align="left">How did you hear about this job opening?</TD>
			<TD class="Normal" align="left">
			    <asp:dropdownlist id="ddlJobLead" runat="server" cssclass="Normal"></asp:dropdownlist>
			</TD>
		</TR>		
		<TR id="trAdmin_NoteInternal" runat="server" visible="false">
			<TD class="Normal" vAlign="top" width="20%" align="left">
				<P>Internal Note: (Admin only)</P>
			</TD>
			<TD class="Normal" align="left">
				<asp:textbox id="txtAdmin_NoteInternal" cssclass="Normal" runat="server" width="255" maxlength="100"
					ToolTip="Enter your message."></asp:textbox>
				<asp:label id="lbxAdmin_NoteInternal" runat="server" CssClass="Normal"></asp:label></TD>
		</TR>
		<TR id="trAdmin_StatusInternal" runat="server" visible="false">
			<TD class="Normal" width="20%" align="left">Internal Status: (Admin only)</TD>
			<TD class="Normal" align="left">
			    <asp:DropDownList id="ddlStatusInternal" runat="server" CssClass="Normal" DataTextField = "PicklistText" DataValueField = "PicklistValue" />
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
<asp:Panel id="pnlViewApplication" Width="100%" Visible="True" runat="server">
    
	<asp:DetailsView ID="dtwJobApplication" runat="server" AutoGenerateRows="False" DataKeyNames="ApplicationID" CssClass="Normal">  
	<Fields>
            <asp:TemplateField HeaderText="ApplicationID:">
                <ItemTemplate>
                    <asp:Label ID="lblApplicationID" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ApplicationID") %>' Runat="server"/>&nbsp;
                    <asp:HyperLink id="hplEdit" CssClass="Normal" NavigateUrl='<%# DotNetNuke.jb_Utility.GetApplicationPath() & "?tabid=" & Me.TabId  & "&uc=apj&mode=6&ItemID=" & DataBinder.Eval(Container.DataItem, "JobID") & "&ApplicationID=" & DataBinder.Eval(Container.DataItem,"ApplicationID") %>' runat="server" text='[Edit]'>
					</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name:" />
            <asp:TemplateField HeaderText="Applicant Email:">
                <ItemTemplate>
                    <asp:Label ID="lblApplicantEmail" CssClass="Normal" text='<%# DotNetNuke.jb_Utility.FormatEmail(DataBinder.Eval(Container.DataItem, "ApplicantEmail")) %>' Runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>           
            <asp:BoundField DataField="SalaryReq" HeaderText="Salary Requirement:" />
             <asp:BoundField DataField="Message" HeaderText="Message from Applicant:" />
            <asp:BoundField DataField="JobLead" HeaderText="How did you hear about this job opening?" />            
            <asp:TemplateField HeaderText="Download Cover Letter" Visible="True">
				<ItemTemplate>
				    <asp:LinkButton ID="lnkBtnDownloadCoverLetter" runat="server" CssClass="Normal" CommandName="DownloadCoverLetter">Open</asp:LinkButton>							
				</ItemTemplate>
			</asp:TemplateField>										
			<asp:TemplateField HeaderText="Download Attached Resume"  Visible="True">
				<ItemTemplate>
				    <asp:LinkButton ID="lnkBtnDownloadResume" runat="server" CssClass="Normal" CommandName="DownloadResume">Open</asp:LinkButton>							
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="View Online Resume" Visible="True">
				<ItemTemplate>
					<asp:HyperLink id="hpylOnline_Resume" Text="View" Target="_blank" runat="server"></asp:HyperLink>										
				</ItemTemplate>
			</asp:TemplateField>			
            <asp:BoundField DataField="StatusInternal" HeaderText="Application Status:" />
            <asp:BoundField DataField="NoteInternal" HeaderText="Internal Note:" />
        </Fields>
    </asp:DetailsView>


</asp:Panel>
<asp:label id="lblMessage_PageOptions" runat="server" CssClass="NormalRed"></asp:label>


