<%@ Control language="vb" Inherits="DotNetNuke.jb_AddItem" CodeBehind="jb_additem.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="Portal" TagName="Address" Src="~/DesktopModules/PA_JobBoard/jb_Address.ascx"%>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="nei" TagName="TopNav" Src="~/DesktopModules/PA_JobBoard/jb_NavItemEdit.ascx" %>
<nei:topnav id="TopNav" runat="server"></nei:topnav><asp:panel id="pnlModuleContent" Runat="server">
	<TABLE height="100%" cellSpacing="0" cellPadding="4" width="100%" align="center" border="0">
		<TR vAlign="top" height="100%">
			<TD align="center">				
				<TABLE id="tblEditClassifieds" cellSpacing="1" cellPadding="1" width="100%" runat="server">
					<TR id="trCategoryID" runat="server" visible="False">
						<TD class="Normal" vAlign="top" align="left" width="20%">Job Category ID:</TD>
						<TD align="left" width="80%">
							<asp:label id="lblCategoryID" runat="server" cssclass="Normal"></asp:label></TD>
					</TR>
					<TR id="trCategoryPath" runat="server" visible="False">
						<TD class="Normal" vAlign="top" align="left" width="20%">Job Type:</TD>
						<TD align="left" width="80%">
							<asp:label id="lblCategoryPath" runat="server" cssclass="Normal"></asp:label></TD>
					</TR>
					<TR id="trCategoryCompleteList" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Job Category:</TD>
						<TD align="left" width="80%">
							<asp:dropdownlist id="ddlCategoryCompleteList" runat="server" cssclass="Normal">
								<asp:ListItem Text="-- Please Select Category --" Value="" />
							</asp:dropdownlist>
							<asp:requiredfieldvalidator id="req_ddlCategoryCompleteList" runat="server" ControlToValidate="ddlCategoryCompleteList"
								ErrorMessage="Required" CssClass="NormalRed"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR id="trCompanyName" runat="server" visible="true">
						<TD class="Normal" align="left" width="20%" height="24">Company Name:</TD>
						<TD align="left" width="80%" height="24">
							<asp:textbox id="txtCompanyName" runat="server" cssclass="Normal" Width="390px" MaxLength="255"></asp:textbox>
							<asp:requiredfieldvalidator id="req_txtCompanyName" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Required"
								CssClass="NormalRed" Display="Dynamic"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR id="trJobTitle" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Job Title:</TD>
						<TD align="left" width="80%">
							<asp:textbox id="txtJobTitle" runat="server" cssclass="Normal" Width="390px" MaxLength="255"></asp:textbox>
							<asp:requiredfieldvalidator id="req_txtJobTitle" runat="server" ControlToValidate="txtJobTitle" ErrorMessage="Required"
								CssClass="NormalRed"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR id="trJobCode" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Job Code:</TD>
						<TD align="left" width="80%">
							<asp:textbox id="txtJobCode" runat="server" cssclass="Normal" Width="180px" MaxLength="50"></asp:textbox>
							<asp:requiredfieldvalidator id="req_txtJobCode" runat="server" ControlToValidate="txtJobCode" ErrorMessage="Required"
								CssClass="NormalRed"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR id="trItemLocation_Location" runat="server" visible="false">
						<TD class="Normal" vAlign="top" align="left" width="20%">Job Location (City, 
							State/Province):</TD>
						<TD align="left" width="80%">
							<asp:textbox id="txtJobLocation" runat="server" cssclass="Normal" Width="180px" MaxLength="50"></asp:textbox></TD>
					</TR>					
					<TR id="trItemLocation_Postal" runat="server" visible="false">
						<TD class="Normal" width="20%" align="left">Zip Code:</TD>
						<TD width="80%" align="left">
							<asp:textbox id="txtZipCode" runat="server" cssclass="Normal" MaxLength="50" Width="100" TextMode="SingleLine"></asp:textbox>
							<asp:regularexpressionvalidator id="RegEx_txtZipCode" runat="server" CssClass="NormalRed" ErrorMessage="Not a valid zip code"
								ControlToValidate="txtZipCode" Display="Dynamic" Enabled="False" ValidationExpression="^\d{5}$"></asp:regularexpressionvalidator>
						</TD>
					</TR>
					<TR id="trItemLocation_Full" runat="server" visible="false">
						<TD class="Normal" width="20%" align="left">Location:</TD>
						<TD width="80%" align="left">
						    <portal:address id="Address1" runat="server" ControlColumnWidth="250" LabelColumnWidth="100" EnableViewState="True"></portal:address>
						</TD>
					</TR>
					<TR id="trEmpType" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Emp Type:</TD>
						<TD align="left" width="80%">
							<asp:dropdownlist id="ddlEmpType" runat="server" cssclass="Normal"></asp:dropdownlist></TD>
					</TR>
					<TR id="trEducation" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Education:</TD>
						<TD align="left" width="80%">
							<asp:dropdownlist id="ddlReqEducation" runat="server" cssclass="Normal"></asp:dropdownlist></TD>
					</TR>
					<TR id="trYearExp" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Years of Experience:</TD>
						<TD align="left" width="80%">
							<asp:textbox id="txtYearExp" runat="server" cssclass="Normal" Width="67px" MaxLength="10"></asp:textbox>
							<asp:comparevalidator id="CompareValidator2" runat="server" ControlToValidate="txtYearExp" ErrorMessage="Must be integer"
								CssClass="NormalRed" Operator="DataTypeCheck" Type="Integer"></asp:comparevalidator>
							<asp:requiredfieldvalidator id="req_txtYearExp" runat="server" ControlToValidate="txtYearExp" ErrorMessage="Required"
								CssClass="NormalRed"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR id="trTravel" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Travel:</TD>
						<TD align="left" width="80%">
							<asp:dropdownlist id="ddlTravel" runat="server" cssclass="Normal"></asp:dropdownlist></TD>
					</TR>
					<TR id="trSalaryHourlyRate" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%"></TD>
						<TD align="left" width="80%">
							<asp:radiobuttonlist id="rdoSalaryHourlyRate" runat="server" cssclass="Normal" RepeatDirection="Horizontal"
								AutoPostBack="True" EnableViewState="true">
								<asp:ListItem Value="Salary">Starting Salary</asp:ListItem>
								<asp:ListItem Value="HourlyRate">Hourly Rate</asp:ListItem>
								<asp:ListItem Value="Others">Others (such as DOE, salary range, negotiable, etc.)</asp:ListItem>
							</asp:radiobuttonlist></TD>
					</TR>
					<TR id="trStartingSalary" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">
							<asp:label id="lblStartingSalary" runat="server" cssclass="Normal">Salary:</asp:label></TD>
						<TD align="left" width="80%">
							<asp:textbox id="txtStartingSalary" runat="server" cssclass="Normal" Width="180px" MaxLength="50"></asp:textbox>
							<asp:comparevalidator id="ComparevalidatorSalary" runat="server" ControlToValidate="txtStartingSalary"
								ErrorMessage="Must be integer (e.g. 45000).  " CssClass="NormalRed" Display="Dynamic" Operator="DataTypeCheck"
								Type="Integer"></asp:comparevalidator>
							<asp:comparevalidator id="ComparevalidatorHourlyRate" runat="server" ControlToValidate="txtStartingSalary"
								ErrorMessage="Must be Currency." CssClass="NormalRed" Display="Dynamic" Operator="DataTypeCheck"
								Type="Currency" Enabled="False"></asp:comparevalidator>
							<asp:regularexpressionvalidator id="RegularexpressionvalidatorStartingSalary" runat="server" ControlToValidate="txtStartingSalary"
								ErrorMessage="Value must > 0.  " CssClass="NormalRed" Display="Dynamic" ValidationExpression="(^\d*\.?\d*[1-9]+\d*$)|(^[1-9]+\d*\.\d*$)"></asp:regularexpressionvalidator>
							<asp:requiredfieldvalidator id="req_txtStartingSalary" runat="server" ControlToValidate="txtStartingSalary"
								ErrorMessage="Required" CssClass="NormalRed"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR id="trStartDate" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Start Date:</TD>
						<TD align="left" width="80%">
							<asp:textbox id="txtStartDate" runat="server" cssclass="Normal" Width="180px" MaxLength="50"></asp:textbox>
							<asp:hyperlink id="cmdCalendarStartDate" Runat="server" CssClass="Normal"></asp:hyperlink>
							<asp:requiredfieldvalidator id="req_txtStartDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Required"
								CssClass="NormalRed" Enabled="true"></asp:requiredfieldvalidator>
							<asp:comparevalidator id="comp_txtStartDate" runat="server" cssclass="NormalRed" controltovalidate="txtStartDate"
								errormessage="Invalid" display="Dynamic" type="Date" operator="DataTypeCheck"></asp:comparevalidator></TD>
					</TR>
					<TR id="trNumberOpening" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%"># of Openings:</TD>
						<TD align="left" width="80%">
							<asp:textbox id="txtNumberOpening" runat="server" cssclass="Normal" Width="67px" MaxLength="10"></asp:textbox>
							<asp:comparevalidator id="CompareValidator1" runat="server" ControlToValidate="txtNumberOpening" ErrorMessage="Must be integer"
								CssClass="NormalRed" Operator="DataTypeCheck" Type="Integer"></asp:comparevalidator>
						    <asp:requiredfieldvalidator id="req_txtNumberOpening" runat="server" ControlToValidate="txtNumberOpening" ErrorMessage="Required"
								CssClass="NormalRed"></asp:requiredfieldvalidator>
						</TD>
					</TR>
					<TR id="trAddReqList" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Requirements:</TD>
						<TD align="left" width="80%">
							<asp:checkboxlist id="chkAddReqList" runat="server" cssclass="Normal" RepeatDirection="Vertical" cellspacing="0"
								cellpadding="3" RepeatColumns="3" RepeatLayout="Table"></asp:checkboxlist></TD>
					</TR>
					<TR id="trDescription" runat="server" visible="true" vAlign="top">
						<TD class="Normal" vAlign="top" align="left" width="20%">Job Description:</TD>
						<TD class="Normal" align="left" width="80%">
							<dnn:TextEditor id="teDesktopHTML" runat="server" CssClass="Normal" Width="600" textrendermode="Raw" 
								htmlencode="False" defaultmode="Basic" choosemode="True" chooserender="False" Height="400"></dnn:TextEditor></TD>
					</TR>
					<TR id="trAttachedDoc" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%" height="24">Attached 
							Document:(Optional)</TD>
						<TD vAlign="top" align="left" width="80%">
							<asp:checkbox id="chkAttachedDoc" runat="server" cssclass="Normal" Text="Upload an attached document to database (will overwrite existing file)"
								Visible="False" Checked="True"></asp:checkbox><input class="Normal" id="AttachedDocUpload" type="file" size="53" runat="server" />
							<asp:panel id="pnlFilesMain" runat="server" Width="100%" Visible="False">
								<asp:hyperlink id="hpylAttachedDoc" runat="server" CssClass="Normal">Attached document</asp:hyperlink>
								<asp:Button id="btnRemoveMainFile" runat="server" CssClass="Normal" Text="Remove"></asp:Button>
							</asp:panel></TD>
					</TR>
					<TR id="trCompanyLogo" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Company logo:</TD>
						<TD align="left" width="80%">
							<asp:checkbox id="chkUploadPhoto" runat="server" cssclass="Normal" Text="Upload company logo to database (will overwrite existing logo)"
								Visible="False" Checked="True"></asp:checkbox><input class="Normal" id="ImageFileUpload" type="file" size="53" runat="server" />
							<asp:regularexpressionvalidator id="valImg0" runat="server" ControlToValidate="ImageFileUpload" ErrorMessage="Not a valid file extension"
								CssClass="NormalRed" Display="Dynamic" Enabled="False" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.([jJ][pP][gG]|[gG][iI][fF]|[bB][mM][pP]|[pP][nN][gG]|[jJ][pP][eE]|[jJ][pP][eE][gG])$"></asp:regularexpressionvalidator>
							<asp:panel id="pnlImagesMain" runat="server" Width="100%" Visible="False">
								<A id="photolink" target="_blank" name="photolink" runat="server"><IMG id="photoimage" border="0" name="photoimage" runat="server"></A>
								<asp:Button id="btnRemoveMainImage" runat="server" CssClass="Normal" Text="Remove"></asp:Button>
								<BR>
								<asp:label id="lblImage" Runat="server" cssclass="Normal"></asp:label>
							</asp:panel></TD>
					</TR>
					<TR id="trBenefitsList" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Company Benefits:</TD>
						<TD align="left" width="80%">
							<asp:checkboxlist id="chkBenefitsList" runat="server" cssclass="Normal" RepeatDirection="Vertical"
								cellspacing="0" cellpadding="3" RepeatColumns="3" RepeatLayout="Table"></asp:checkboxlist></TD>
					</TR>
					<TR id="trContactInfo" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%" height="75">Attention:</TD>
						<TD align="left" width="80%" height="75">
							<asp:textbox id="txtContactInfo" runat="server" cssclass="Normal" Width="390px" MaxLength="2000"
								Height="76px" TextMode="MultiLine"></asp:textbox>
							<asp:requiredfieldvalidator id="req_txtContactInfo" runat="server" ControlToValidate="txtContactInfo" ErrorMessage="Required"
								CssClass="NormalRed" Display="Dynamic"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR id="trContactEmail" runat="server" visible="true">
						<TD class="Normal" vAlign="top" align="left" width="20%">Contact Email:</TD>
						<TD class="Normal" align="left" width="80%">
							<asp:textbox id="txtContactEmail" runat="server" width="390" cssclass="Normal" Columns="30" maxlength="100"></asp:textbox>
							<asp:requiredfieldvalidator id="req_txtContactEmail" runat="server" ControlToValidate="txtContactEmail"
								ErrorMessage="Required" CssClass="NormalRed"></asp:requiredfieldvalidator>
							<asp:regularexpressionvalidator id="valEmail2" runat="server" ControlToValidate="txtContactEmail" ErrorMessage="Email Must be Valid."
								CssClass="NormalRed" Display="Dynamic" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"></asp:regularexpressionvalidator></TD>
					</TR>
					<TR id="trPassword" runat="server" visible="True">
						<TD class="Normal" align="left" width="20%">
							<asp:label id="lblPassword" runat="server" cssclass="Normal">Password:</asp:label></TD>
						<TD class="Normal" align="left" width="80%">							
								<asp:textbox id="txtPosterPassword" runat="server" cssclass="Normal" Width="185px" MaxLength="50" TextMode="Password"></asp:textbox>
						        <asp:requiredfieldvalidator id="req_txtPosterPassword" runat="server" ControlToValidate="txtPosterPassword" ErrorMessage="Required" CssClass="NormalRed" Enabled="False"></asp:requiredfieldvalidator>
						</TD>
					</TR>
					<TR id="trExpire" runat="server" visible="True">
						<TD class="Normal" align="left" width="20%" height="22">Expires:</TD>
						<TD class="Normal" align="left" width="80%" height="22">
							<asp:textbox id="txtExpires" runat="server" width="100" cssclass="Normal" Text="" Columns="8"></asp:textbox>
							<asp:hyperlink id="cmdCalendar" Runat="server" CssClass="Normal"></asp:hyperlink>
							<asp:comparevalidator id="valExpiryDate" runat="server" cssclass="NormalRed" controltovalidate="txtExpires"
								errormessage="Invalid" display="Dynamic" type="Date" operator="DataTypeCheck"></asp:comparevalidator>
							<asp:label id="lbxExpNote" Runat="server" CssClass="Normal">
								Leave blank for never expire.  
							</asp:label></TD>
					</TR>
					<TR id="trPrintAd" runat="server" visible="False">
						<TD class="Normal" align="left" width="20%">
							<asp:label id="lbxPrintAd" resourcekey="[RESX:PrintAd_Label].Text" CssClass="Normal" Runat="server"></asp:label> 
							</TD>
						<TD align="left" width="80%">
							<asp:checkbox id="chkPrintAd" Runat="server" CssClass="Normal" resourcekey="[RESX:PrintAd_Text].Text"></asp:checkbox>
						</TD>
					</TR>
					<TR id="trAuth" runat="server" visible="False">
						<TD class="Normal" align="left" width="20%">
							<asp:label id="lbAuth" runat="server" Visible="False">Authorize:</asp:label></TD>
						<TD align="left" width="80%">
							<asp:checkbox id="chkAuth" Runat="server" CssClass="Normal" Text="Authorize this item." Visible="False"
								Checked="True"></asp:checkbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="chkFeatured" Runat="server" CssClass="Normal" Text="Make this item a featured listing."
								Visible="True" Checked="False"></asp:checkbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:checkbox id="chkNotifyUser" Runat="server" CssClass="Normal" Text="Notify applicable users"
								Visible="True" Checked="False"></asp:checkbox></TD>
					</TR>
					<TR>
						<TD class="Normal" align="center" width="100%" colSpan="2">
							<asp:linkbutton id="cmdUpdate" runat="server" CssClass="Normal" Text="Update" BorderStyle="none"></asp:linkbutton>&nbsp;
							<asp:linkbutton id="cmdCancel" runat="server" CssClass="Normal" Text="Cancel" BorderStyle="none"
								CausesValidation="False"></asp:linkbutton>&nbsp;
							<asp:linkbutton id="cmdDelete" runat="server" CssClass="Normal" Text="Delete" BorderStyle="none"
								CausesValidation="False"></asp:linkbutton>&nbsp;
							<BR>
							<asp:panel id="pnlAudit" Runat="server" HorizontalAlign="Center">
								<SPAN class="Normal">Created by 
<asp:label id="lblCreatedBy" runat="server"></asp:label>&nbsp;on&nbsp; 
<asp:label id="lblCreatedDate" runat="server"></asp:label><BR></SPAN>
							</asp:panel><BR>
							<asp:label id="lblSyndicate" Runat="server" CssClass="Normal"></asp:label></TD>
					</TR>
				</TABLE>
				<BR>
				<asp:panel id="pnlConfirm" runat="server" HorizontalAlign="Center" CssClass="JediCss_Confirmation"
					Width="60%" Visible="False" BorderStyle="Outset" BorderWidth="1">
					<P class="Normal" align="center"><BR>
						<BR>
						<asp:label id="lblConfirm" runat="server"></asp:label><BR>
						<BR>						
						<asp:linkbutton id="cmdReturn" runat="server" CssClass="Normal" Text="Return to the previous page"
							BorderStyle="none" CausesValidation="False"></asp:linkbutton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:linkbutton id="cmdReturnHome" runat="server" CssClass="Normal" Text="Return to Job Board Home"
							BorderStyle="none" CausesValidation="False"></asp:linkbutton><BR>
						<BR>
						<BR>
					</P>
				</asp:panel></TD>
		</TR>
	</TABLE>
</asp:panel>
<asp:label id="lblFooterMessage" resourcekey="[RESX:FooterMessage].Text" CssClass="Normal" Runat="server"></asp:label>
