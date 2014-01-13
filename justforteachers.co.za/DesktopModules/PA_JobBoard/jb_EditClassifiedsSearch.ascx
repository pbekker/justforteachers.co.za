<%@Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@Control language="vb" Inherits="DotNetNuke.jb_EditClassifiedsSearch" CodeBehind="jb_editclassifiedssearch.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<table id="tblSettings" align="left" border="0" runat="server">
	<tr id="trSettings_General" runat="server">
		<td>
		    <!-- Table 0-->
			<dnn:sectionhead id="dshSettings_License" runat="server" isExpanded="True" heigth="100%" text="License Verification:" section="divSettings_License" CssClass="NormalBold"></dnn:sectionhead>
			<DIV id="divSettings_License" runat="server">
			    <asp:label id="lbxSettings_License" CssClass="NormalBold" Visible="False" Runat="server">License Verification</asp:label>
				<table id="tblLicense" cellSpacing="0" cellPadding="0" width="100%" runat="server">
					<tr>
						<td class="Normal" width="30%" height="23">
						    <asp:label id="lbxProductInfo" runat="server" CssClass="Normal">Product:</asp:label>
						</td>
						<td align="left" width="70%" height="23">
							<asp:label id="lblProductInfo" runat="server" CssClass="Normal"></asp:label>
						</td>
					</tr>
					<tr>
						<td class="Normal" width="30%" height="23">
						    <asp:label id="lblTransactionID" runat="server" CssClass="Normal">Invoice <u>or</u> Transaction ID:</asp:label><br />
							<asp:label id="lblTransactionID_Note" runat="server" CssClass="Normal">Note: Do not put both.</asp:label>
						</td>
						<td align="left" width="70%" height="23">
						    <asp:textbox id="txtTransactionID" runat="server" CssClass="Normal" Width="200px" Enabled="True"></asp:textbox>
						    <asp:requiredfieldvalidator id="req_txtTransactionID" runat="server" CssClass="Normal" ControlToValidate="txtTransactionID" ErrorMessage="*"></asp:requiredfieldvalidator>
						</td>
					</tr>
					<tr>
						<td class="Normal" width="30%" height="23">
						    <asp:label id="lblWebsiteDomainURL" runat="server" CssClass="Normal">Website Domain URL:</asp:label>
						</td>
						<td align="left" width="70%" height="23">
						    <asp:textbox id="txtWebsiteDomainURL" runat="server" CssClass="Normal" Width="400px" Enabled="False"></asp:textbox>
						    <asp:requiredfieldvalidator id="req_txtWebsiteDomainURL" runat="server" CssClass="Normal" ControlToValidate="txtWebsiteDomainURL" ErrorMessage="*"></asp:requiredfieldvalidator>
						</td>
					</tr>
					<tr id="trLicenseVerification" runat="server" visible="True">
						<td class="Normal" width="30%" height="23">
						    <asp:label id="lbxLicenseVerification" runat="server" CssClass="Normal" Visible="True">License Verification:</asp:label>
						</td>
						<td align="left" width="70%" height="23">
						    <IMG id="imgLicenseVerification" src="~/DesktopModules/PA_JobBoard/images/16x16/ico-license-tr.gif" align="absBottom" runat="server" Visible="True" />
							<asp:linkbutton id="lnkBtnLicenseVerification" CssClass="Normal" Runat="server" Enabled="True" CausesValidation="False">Click here for License Verification</asp:linkbutton>
							<br />
							<asp:label id="lblLicenseVerification_Message" runat="server" CssClass="NormalRed" Visible="True"></asp:label>
						</td>
					</tr>
					<tr>
						<td width="30%">&nbsp;</td>
						<td align="left" width="70%">
						    <asp:label id="lbxNote_ValidEmail" runat="server" CssClass="Normal">Note: To verify your license, your currently login DNN account must have a valid email address.</asp:label>
						</td>
					</tr>
				</table>
			</DIV>
			<dnn:sectionhead id="dshSettings_ModuleOperationMode" runat="server" isExpanded="True" heigth="100%" text="Module Operation Mode:" section="divSettings_ModuleOperationMode" CssClass="NormalBold"></dnn:sectionhead>
			<DIV id="divSettings_ModuleOperationMode" runat="server">
			    <asp:label id="lbxSettings_ModuleOperationMode" CssClass="NormalBold" Visible="False" Runat="server">Module Operation Mode</asp:label>
				<table id="tblModuleOperationMode" cellSpacing="0" cellPadding="0" width="100%" runat="server">
					<tr>
						<td class="Normal" width="30%">
						    <asp:label id="lblModuleOperationMode" runat="server" CssClass="Normal">Module Operation Mode:</asp:label>
						</td>
						<td align="left" width="70%">
						    <asp:radiobuttonlist id="optModuleOperationMode" runat="server" CssClass="Normal" RepeatDirection="Vertical" AutoPostBack="true" EnableViewState="True">
								<asp:ListItem Value="standalone">Stand alone with no resume integration.</asp:ListItem>
								<asp:ListItem Value="resume">Integrate with Resume 6.1 or above (Login required to apply for jobs).</asp:ListItem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr>
					    <td class="Normal" width="30%">
					        <asp:label id="lblMainModule" CssClass="Normal" runat="server">Choose Resume Module to integrate:</asp:label>
					    </td>
					    <td align="left" width="70%">
					        <asp:dropdownlist id="ddlResumeModule" runat="server" cssclass="Normal" DataValueField="ModuleID" DataTextField="ModuleDisplay" AutoPostBack="True"></asp:dropdownlist>					   
						    <asp:label id="lblResumeModule_Note" CssClass="NormalRed" runat="server" Visible="False">Your portal does not have any instance of Resume module.</asp:label>
					    </td>
				    </tr>			
				</table>
			</DIV>
			<!-- Table 0.5 -->
			<dnn:sectionhead id="dshSettings_Security" runat="server" CssClass="NormalBold" isExpanded="True" heigth="100%" text="Roles and Security Settings:" section="divSettings_Security"></dnn:sectionhead>
			<DIV id="divSettings_Security" runat="server">
			    <asp:label id="lbxSettings_Security" CssClass="NormalBold" Runat="server" Visible="False">Roles and Security Settings</asp:label>
				<asp:table id="tblSettings_Security" Runat="server" CellPadding="0" CellSpacing="4" width="100%">
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="False" Width="25%">Roles that can manage categories:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ManageCategories" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="False">Roles that can manage listings:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_AuthorizeListings" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="False">Roles that can manage job applications:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ManageJobApplications" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="False">Roles that can add listings:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuthEditRoles" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="False">Roles that can view listings:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuthViewListingsRoles" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="False">Roles that can view details:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuthViewDetailsRoles" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can apply for jobs:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ApplyJob" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="False">Roles that can view submitted applications:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuthViewSubmittedApplicationsRoles" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can add additional images:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ItemImage" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can add files:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ItemFile" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can add videos:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ItemVideo" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can add item attributes:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ItemAttribute" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow Visible="true">
					    <asp:TableCell CssClass="Normal" Wrap="True">Roles that can add coupons:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ItemCoupon" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can assign multiple categories:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ItemCategory" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
						</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can view email:</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ViewEmail" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow Visible="true">
						<asp:TableCell CssClass="Normal" Wrap="True">Roles that can view checkbox picklist (Requirements):</asp:TableCell>
						<asp:TableCell>
							<asp:CheckBoxList id="chkAuth_ViewPicklist" RepeatColumns="4" cssclass="Normal" runat="server" />
						</asp:TableCell>
					</asp:TableRow>					
					<asp:TableRow>
						<asp:TableCell CssClass="Normal">Require Authorization:</asp:TableCell>
						<asp:TableCell>
							<asp:radiobuttonlist id="optRequireAuthorization" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								<asp:ListItem Value="1">Yes</asp:ListItem>
								<asp:ListItem Value="0">No</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trPasswordRetrieval" Runat="server" Visible="true">
						<asp:TableCell CssClass="Normal">Password Retrieval:</asp:TableCell>
						<asp:TableCell CssClass="Normal">
							<asp:checkbox id="chkPasswordRetrieval" Runat="server" CssClass="Normal" Text="Allow admin to retrive listing password for public user?"></asp:checkbox>
						</asp:TableCell>
					</asp:TableRow>					
				</asp:table>
			</DIV>
			<!-- Table 1 -->
			<dnn:sectionhead id="dshSettings_General" runat="server" isExpanded="True" heigth="100%" text="General and Layout Settings:" section="divSettings_General" CssClass="NormalBold"></dnn:sectionhead>
			<DIV id="divSettings_General" runat="server">
			    <asp:label id="lbxSettings_General" CssClass="NormalBold" Visible="False" Runat="server">General Settings</asp:label>
			    <asp:table id="tblSettings_General" Runat="server" width="75%" CellSpacing="4" CellPadding="0">					
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal"># of Sub Categories Listed:</asp:TableCell>
						    <asp:TableCell>
							    <asp:dropdownlist id="ddlMaxSubCat" runat="server" cssClass="Normal">
								    <asp:ListItem Value="-1">All</asp:ListItem>
								    <asp:ListItem Value="0">0</asp:ListItem>
								    <asp:ListItem Value="1">1</asp:ListItem>
								    <asp:ListItem Value="2">2</asp:ListItem>
								    <asp:ListItem Value="3">3</asp:ListItem>
								    <asp:ListItem Value="4">4</asp:ListItem>
								    <asp:ListItem Value="5">5</asp:ListItem>
								    <asp:ListItem Value="6">6</asp:ListItem>
								    <asp:ListItem Value="7">7</asp:ListItem>
								    <asp:ListItem Value="8">8</asp:ListItem>
								    <asp:ListItem Value="9">9</asp:ListItem>
								    <asp:ListItem Value="10">10</asp:ListItem>
							    </asp:dropdownlist>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" ErrorMessage="Required" ControlToValidate="ddlMaxSubCat" CssClass="NormalRed"></asp:requiredfieldvalidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal"># of Repeat Columns:</asp:TableCell>
						    <asp:TableCell>
							    <asp:dropdownlist id="ddlRepeatColumns" runat="server" cssClass="Normal">
								    <asp:ListItem Value="1">1</asp:ListItem>
								    <asp:ListItem Value="2">2</asp:ListItem>
								    <asp:ListItem Value="3">3</asp:ListItem>
								    <asp:ListItem Value="4">4</asp:ListItem>
								    <asp:ListItem Value="5">5</asp:ListItem>
								    <asp:ListItem Value="6">6</asp:ListItem>
								    <asp:ListItem Value="7">7</asp:ListItem>
								    <asp:ListItem Value="8">8</asp:ListItem>
								    <asp:ListItem Value="9">9</asp:ListItem>
								    <asp:ListItem Value="10">10</asp:ListItem>
							    </asp:dropdownlist>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator6" runat="server" ErrorMessage="Required" ControlToValidate="ddlRepeatColumns" CssClass="NormalRed"></asp:requiredfieldvalidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">New Icon Period (days):</asp:TableCell>
						    <asp:TableCell>
							    <asp:TextBox ID="txtNewDays" CssClass="Normal" Runat="server" Width="45">14</asp:TextBox>
							    <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="txtNewDays" CssClass="NormalRed"></asp:requiredfieldvalidator>
							    <asp:CompareValidator Type="Integer" ControlToValidate="txtNewDays" ID="valCheckIntegerType" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">New Listings Period (days):</asp:TableCell>
						    <asp:TableCell>
							    <asp:TextBox ID="txtWhatsNewDays" CssClass="Normal" Runat="server" Width="45">14</asp:TextBox>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtWhatsNewDays" CssClass="NormalRed"></asp:requiredfieldvalidator>
							    <asp:CompareValidator Type="Integer" ControlToValidate="txtWhatsNewDays" ID="Comparevalidator1" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow ID="trExpirationDays" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Default Listing Period (days):</asp:TableCell>
						    <asp:TableCell>
							    <asp:TextBox ID="txtExpirationDays" CssClass="Normal" Runat="server" Width="45"></asp:TextBox>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator8" runat="server" ErrorMessage="Required" ControlToValidate="txtExpirationDays" CssClass="NormalRed"></asp:requiredfieldvalidator>
							    <asp:RangeValidator id="Range_txtExpirationDays" ControlToValidate="txtExpirationDays" runat="server" CssClass="NormalRed" ErrorMessage="From 0 to 5000" MinimumValue="0" Type="Integer" MaximumValue="5000"></asp:RangeValidator>
							    <asp:checkbox id="chkEnableNeverExpireForUser" CssClass="Normal" Runat="server" visible="False" Text="Allow user to make listing never expire?"></asp:checkbox>
							    <asp:label id="lbxExpNote" Runat="server" CssClass="Normal">Enter 0 for never expire.</asp:label>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow ID="trShowDaysToExpire" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Show Days to Expire:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optShowDaysToExpire" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Show Featured Jobs:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optShowFeaturedListings" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Prioritize Featured Listings:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optMoveFeaturedListings" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Do not move</asp:ListItem>
								    <asp:ListItem Value="1">Always on top</asp:ListItem>
								    <asp:ListItem Value="2">Always on top except radius search</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Show Item Count:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optShowItemCount" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Show View Count:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optShowViewCount" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Show New Listings (What's New):</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:radiobuttonlist id="optShowWhatsNewOn" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="none">None</asp:ListItem>
								    <asp:ListItem Value="home">Home only</asp:ListItem>
								    <asp:ListItem Value="all">Every page</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Allow Paging:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:radiobuttonlist id="optAllowPaging" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
								    AutoPostBack="True">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Enable Sorting:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optAllowSorting" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Default Sort Direction:</asp:TableCell>
						    <asp:TableCell>
						        <asp:dropdownlist id="ddlSortDirection" runat="server" cssclass="Normal">
								    <asp:ListItem Value="Asc">Ascending</asp:ListItem>
								    <asp:ListItem Value="Desc">Descending</asp:ListItem>							
							    </asp:dropdownlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Enable Filter by Job Type:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optFilter" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Page Size:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtPageSize" CssClass="Normal" Runat="server" Width="45" Enabled="True">5</asp:TextBox>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ErrorMessage="Required" ControlToValidate="txtPageSize" CssClass="NormalRed"></asp:requiredfieldvalidator>
							    <asp:CompareValidator Type="Integer" ControlToValidate="txtPageSize" ID="Comparevalidator3" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
							    <asp:RangeValidator id="RangeValidator1" runat="server" ControlToValidate="txtPageSize" CssClass="NormalRed" ErrorMessage="From 1 to 50" MinimumValue="1" Type="Integer" MaximumValue="50"></asp:RangeValidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Enable Category Drill Down:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableDrillDown" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
								    Enabled="True">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
							    <asp:label id="lbxEnableDrillDown" Runat="server" CssClass="Normal">Note: This option is required for Treeview to function.</asp:label>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Show Treeview:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableTreeview" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
								    Enabled="True">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
							    <asp:label id="lbxEnableTreeview" Runat="server" CssClass="Normal">
					                Note: This option will not use Friendly Urls.
					            </asp:label>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Left Column Width:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtTreeviewWidth" CssClass="Normal" Runat="server" Width="45">200</asp:TextBox>&nbsp;px. &nbsp;
								    <asp:requiredfieldvalidator id="req_txtTreeviewWidth" runat="server" ErrorMessage="Required" ControlToValidate="txtTreeviewWidth" CssClass="NormalRed"></asp:requiredfieldvalidator>
								    <asp:comparevalidator id="Comp_txtTreeviewWidth" runat="server" CssClass="NormalRed" ControlToValidate="txtTreeviewWidth" ErrorMessage="You must enter a value greater than zero" Operator="GreaterThan" Type="Integer" Display="Dynamic" ValueToCompare="0"></asp:comparevalidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Center Column Width:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtCenterColumnWidth" CssClass="Normal" Runat="server" Width="45">650</asp:TextBox>&nbsp;px. &nbsp;
								<asp:requiredfieldvalidator id="req_txtCenterColumnWidth" runat="server" ErrorMessage="Required" ControlToValidate="txtCenterColumnWidth" CssClass="NormalRed"></asp:requiredfieldvalidator>
								<asp:comparevalidator id="Comp_txtCenterColumnWidth" runat="server" CssClass="NormalRed" ControlToValidate="txtCenterColumnWidth" ErrorMessage="You must enter a value greater than zero" Operator="GreaterThan" Type="Integer" Display="Dynamic" ValueToCompare="0"></asp:comparevalidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Right Column Width:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtRightColumnWidth" CssClass="Normal" Runat="server" Width="45">150</asp:TextBox>&nbsp;px. &nbsp;
								    <asp:requiredfieldvalidator id="req_txtRightColumnWidth" runat="server" ErrorMessage="Required" ControlToValidate="txtRightColumnWidth" CssClass="NormalRed"></asp:requiredfieldvalidator>
								    <asp:comparevalidator id="Comp_txtRightColumnWidth" runat="server" CssClass="NormalRed" ControlToValidate="txtRightColumnWidth" ErrorMessage="You must enter a value greater than zero" Operator="GreaterThan" Type="Integer" Display="Dynamic" ValueToCompare="0"></asp:comparevalidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Root text:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtRootText" CssClass="Normal" Runat="server" Width="150" Enabled="True">Job Board</asp:TextBox>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator7" runat="server" ErrorMessage="Required" ControlToValidate="txtRootText" CssClass="NormalRed"></asp:requiredfieldvalidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
						    <asp:TableCell CssClass="Normal">Treeview Base Icon:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <img src='<%= Page.ResolveUrl("DesktopModules/" & DotNetNuke.jb_Uglobal.glbProductCode & "/Images/treeview/base.gif")%>' border="0" alt="" />&nbsp;&nbsp;&nbsp;							
						        <asp:checkbox id="chkTreeviewBaseIcon_Edit" runat="server" cssclass="Normal" Text="Replace Icon" EnableViewState="True" Checked="true" Visible="false"></asp:checkbox>
							    <input id="iptTreeviewBaseIcon" type="file" size="12" runat="server" class="Normal" enctype="multipart/form-data" ValidationGroup="TreeviewBaseIcon" />&nbsp;
                                <asp:requiredfieldvalidator id="req_iptTreeviewBaseIcon" ValidationGroup="TreeviewBaseIcon" runat="server" ErrorMessage="*" ControlToValidate="iptTreeviewBaseIcon" CssClass="NormalRed"></asp:requiredfieldvalidator>&nbsp;
                                <asp:regularexpressionvalidator id="regex_iptTreeviewBaseIcon" ValidationGroup="TreeviewBaseIcon" ControlToValidate="iptTreeviewBaseIcon" runat="server" CssClass="Normal" Display="Dynamic" ErrorMessage="Not a valid file extension" Enabled="false"  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.([jJ][pP][gG]|[gG][iI][fF]|[bB][mM][pP]|[pP][nN][gG]|[jJ][pP][eE]|[jJ][pP][eE][gG])$"></asp:regularexpressionvalidator>&nbsp;
							    <asp:Button id="btnTreeviewBaseIcon" ValidationGroup="TreeviewBaseIcon" runat="server" CssClass="Normal" Enabled="True" CausesValidation="True" Text="Replace"></asp:Button>&nbsp;
							    <asp:label id="lblTreeviewBaseIcon_Message" runat="server" CssClass="NormalRed" Visible="True"></asp:label>    								
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow>
	                        <asp:TableCell CssClass="Normal">Breadcrumb Home Icon:</asp:TableCell>
	                        <asp:TableCell CssClass="Normal">
		                        <img src='<%= Page.ResolveUrl("DesktopModules/" & DotNetNuke.jb_Uglobal.glbProductCode & "/images/ico-home.gif")%>' border="0" alt="" />&nbsp;&nbsp;&nbsp;							
	                            <asp:checkbox id="chkBreadcrumbHomeIcon_Edit" runat="server" cssclass="Normal" Text="Replace Icon" EnableViewState="True" Checked="true" Visible="false"></asp:checkbox>
		                        <input id="iptBreadcrumbHomeIcon" type="file" size="12" runat="server" class="Normal" enctype="multipart/form-data" ValidationGroup="BreadcrumbHomeIcon" />&nbsp;
                                <asp:requiredfieldvalidator id="req_iptBreadcrumbHomeIcon" ValidationGroup="BreadcrumbHomeIcon" runat="server" ErrorMessage="*" ControlToValidate="iptBreadcrumbHomeIcon" CssClass="NormalRed"></asp:requiredfieldvalidator>&nbsp;
                                <asp:regularexpressionvalidator id="regex_iptBreadcrumbHomeIcon" ValidationGroup="BreadcrumbHomeIcon" ControlToValidate="iptBreadcrumbHomeIcon" runat="server" CssClass="Normal" Display="Dynamic" ErrorMessage="Not a valid file extension" Enabled="false"  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w ]*.*))+\.([jJ][pP][gG]|[gG][iI][fF]|[bB][mM][pP]|[pP][nN][gG]|[jJ][pP][eE]|[jJ][pP][eE][gG])$"></asp:regularexpressionvalidator>&nbsp;
		                        <asp:Button id="btnBreadcrumbHomeIcon" ValidationGroup="BreadcrumbHomeIcon" runat="server" CssClass="Normal" Enabled="True" CausesValidation="True" Text="Replace"></asp:Button>&nbsp;
		                        <asp:label id="lblBreadcrumbHomeIcon_Message" runat="server" CssClass="NormalRed" Visible="True"></asp:label>                        			
	                        </asp:TableCell>
                        </asp:TableRow>					
					    <asp:TableRow Visible="False">
						    <asp:TableCell CssClass="Normal">Enable Review:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableReview" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow Visible="False">
						    <asp:TableCell CssClass="Normal">Desired skills:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtAddReqList" Runat="server" Width="400" Enabled="True" TextMode="MultiLine" MaxLength="500" CssClass="Normal" Rows="5"></asp:TextBox>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator10" runat="server" ErrorMessage="Required" ControlToValidate="txtAddReqList" CssClass="NormalRed"></asp:requiredfieldvalidator>
						    </asp:TableCell>
					    </asp:TableRow>
					    <asp:TableRow Visible="False">
						    <asp:TableCell CssClass="Normal">Benefits:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtBenefitsList" Runat="server" Width="400" Enabled="True" TextMode="MultiLine" MaxLength="500" CssClass="Normal" Rows="5"></asp:TextBox>
							    <asp:RegularExpressionValidator ControlToValidate="txtBenefitsList" Display="Dynamic" Text="Use a maximum of 500 characters" ValidationExpression=".{0,500}" Runat="Server" ID="Regularexpressionvalidator1"></asp:RegularExpressionValidator>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trShowEmptyCheckbox" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Show Empty Checkbox:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optShowEmptyCheckbox" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trEnableCoupon" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Coupon:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableCoupon" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="1">Yes</asp:ListItem>
								    <asp:ListItem Value="0">No</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
					    </asp:TableRow>
						<asp:TableRow Visible="False">
						    <asp:TableCell CssClass="Normal">Currency Symbol:</asp:TableCell>
						    <asp:TableCell CssClass="Normal">
							    <asp:TextBox ID="txtCurrencySymbol" CssClass="Normal" Runat="server" Width="150" Enabled="True">$</asp:TextBox>
							    <asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ErrorMessage="Required" ControlToValidate="txtCurrencySymbol" CssClass="NormalRed"></asp:requiredfieldvalidator>
							    <br />
							    <asp:label id="lbxCurrencySymbol" Runat="server" CssClass="Normal">Note: Enter your portal locale currency format here.</asp:label>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trEnableJobStartDate" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Job Start Date:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableJobStartDate" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>
								    <asp:ListItem Value="2">Required</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trEnableJobCode" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Job Code:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableJobCode" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>
								    <asp:ListItem Value="2">Required</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trEmpType" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Emp Type:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableEmpType" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>							
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trEducation" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Education:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableEducation" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>					
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trYearExp" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Years of Experience:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableYearExp" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>
								    <asp:ListItem Value="2">Required</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trTravel" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Travel:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableTravel" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>								    
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trSalary" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Salary:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableSalary" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>
								    <asp:ListItem Value="2">Required</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trNumberOpening" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Number of Openings:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableNumberOpening" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>
								    <asp:ListItem Value="2">Required</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trAddReqList" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Requirements List</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableAddReqList" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>								
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trCompanyLogo" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Company Logo:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableCompanyLogo" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>	
								    <asp:ListItem Value="2">Required</asp:ListItem>
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trBenefitsList" Runat="server" Visible="True">
						    <asp:TableCell CssClass="Normal">Enable Company Benefits List:</asp:TableCell>
						    <asp:TableCell>
							    <asp:radiobuttonlist id="optEnableBenefitsList" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								    <asp:ListItem Value="0">Hidden</asp:ListItem>
								    <asp:ListItem Value="1">Optional</asp:ListItem>	
							    </asp:radiobuttonlist>
						    </asp:TableCell>
						</asp:TableRow>
						<asp:TableRow ID="trEnablePrintAd" Runat="server" Visible="True">
					        <asp:TableCell CssClass="Normal">Enable Print Ad Option:</asp:TableCell>
					        <asp:TableCell>
						        <asp:radiobuttonlist id="optEnablePrintAd" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
							        <asp:ListItem Value="0">Hidden</asp:ListItem>
							        <asp:ListItem Value="1">Optional</asp:ListItem>							
							        <asp:ListItem Value="9">Optional-Limited Viewing</asp:ListItem>
						        </asp:radiobuttonlist>
					        </asp:TableCell>
					    </asp:TableRow>
					</asp:table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_AddressControl" runat="server" visible="True">
		<td>
			<dnn:sectionhead id="dshSettings_AddressControl" runat="server" CssClass="NormalBold" isExpanded="True" heigth="100%" text="Location Settings:" section="divSettings_AddressControl"></dnn:sectionhead>
			<DIV id="divSettings_AddressControl" runat="server">
			    <asp:label id="lbxSettings_AddressControl" CssClass="NormalBold" Runat="server" Visible="False">Page Option Settings</asp:label>
			    <table id="tblSettings_AddressControl" runat="server" cellSpacing="5" cellPadding="1" width="100%">
					<tr id="trItemLocationFormat" runat="server" visible="False">
						<td class="Normal" width="30%">
						    <asp:label id="lblItemLocationFormat" runat="server" CssClass="Normal">Item Location Format:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:radiobuttonlist id="optItemLocationFormat" runat="server" CssClass="Normal" RepeatDirection="Vertical" AutoPostBack="true">
								<asp:ListItem Value="full">Full Address -- Using DNN Address Control</asp:ListItem>
								<asp:ListItem Value="postal">Postal Only -- Using a single textbox</asp:ListItem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trAddressTitleFormat" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="Label1" runat="server" CssClass="Normal">Address Title Format:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:dropdownlist id="ddlAddressFormat" runat="server" cssClass="Normal">
								<asp:ListItem Value="full">Full -- (Street, Unit, City, Region, Country, and Postal)</asp:ListItem>
								<asp:ListItem Value="skipcountry">Skip Country -- (Street, Unit, City, Region, and Postal)</asp:ListItem>
								<asp:ListItem Value="hide">Hide Street and Unit -- (City, Region, and Postal)</asp:ListItem>
							</asp:dropdownlist>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator16" runat="server" ErrorMessage="Required" ControlToValidate="ddlAddressFormat" CssClass="NormalRed"></asp:requiredfieldvalidator>
						</td>
					</tr>
					<tr id="trMapOptions" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblMapOptions" runat="server" CssClass="Normal">Map Options:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:radiobuttonlist id="optMapOptions" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								<asp:ListItem Value="0">None</asp:ListItem>
								<asp:ListItem Value="1">Linked Google Map</asp:ListItem>
								<asp:ListItem Value="2">Embedded Google Map</asp:ListItem>
							</asp:radiobuttonlist> 
							<asp:label id="lbxEmbeddedMapWidth" runat="server" CssClass="Normal">Embedded Map Width:</asp:label>
					        <asp:TextBox ID="txtEmbeddedMapWidth" CssClass="Normal" Runat="server" Width="45">200</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtEmbeddedMapWidth" ID="comp_txtEmbeddedMapWidth" CssClass="NormalRed" ErrorMessage="Int" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
					        <asp:label id="lbxEmbeddedMapHeight" runat="server" CssClass="Normal">Embedded Map Height:</asp:label>
					        <asp:TextBox ID="txtEmbeddedMapHeight" CssClass="Normal" Runat="server" Width="45">250</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtEmbeddedMapHeight" ID="comp_txtEmbeddedMapHeight" CssClass="NormalRed" ErrorMessage="Int" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
					    </td>
					</tr>	
					<tr id="trEnableAddressControlFields" runat="server" visible="true">
						<td class="Normal" width="30%"><asp:label id="lblEnableAddressControlFields" runat="server" CssClass="Normal">Enable Address Control Fields:</asp:label></td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkAddressControl_ShowStreet" Runat="server" CssClass="Normal" Text="Street" Width="125px"></asp:checkbox>&nbsp;
							<asp:checkbox id="chkAddressControl_ShowUnit" Runat="server" CssClass="Normal" Text="Unit" Width="125px"></asp:checkbox>&nbsp;
							<asp:checkbox id="chkAddressControl_ShowCity" Runat="server" CssClass="Normal" Text="City" Width="125px"></asp:checkbox>&nbsp;
							<asp:checkbox id="chkAddressControl_ShowCountry" Runat="server" CssClass="Normal" Text="Country" Width="125px"></asp:checkbox>&nbsp;
							<br />
							<asp:checkbox id="chkAddressControl_ShowRegion" Runat="server" CssClass="Normal" Text="Region" Width="125px"></asp:checkbox>&nbsp;
							<asp:checkbox id="chkAddressControl_ShowPostal" Runat="server" CssClass="Normal" Text="Postal" Width="125px"></asp:checkbox>&nbsp;
							<asp:checkbox id="chkAddressControl_ShowTelephone" Runat="server" CssClass="Normal" Text="Telephone" Width="125px"></asp:checkbox>&nbsp;
							<asp:checkbox id="chkAddressControl_ShowFax" Runat="server" CssClass="Normal" Text="Fax" Width="125px"></asp:checkbox>&nbsp;
						</td>
					</tr>
					<tr id="trEnableAddressControlDefaultValue" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableAddressControlDefaultValue" runat="server" CssClass="Normal">Enable Address Control Default Value?</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableAddressControlDefaultValue" Runat="server" CssClass="Normal"></asp:checkbox>
						</td>
					</tr>
					<tr id="trAddressControlDefaultCountry" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lbxAddressControlDefaultCountry" runat="server" CssClass="Normal">Default Country:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:TextBox ID="txtAddressControlDefaultCountry" CssClass="Normal" Runat="server" Width="150" Enabled="True">United States</asp:TextBox>
						</td>
					</tr>
					<tr id="trAddressControlDefaultRegion" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lbxAddressControlDefaultRegion" runat="server" CssClass="Normal">Default Region:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:TextBox ID="txtAddressControlDefaultRegion" CssClass="Normal" Runat="server" Width="150" Enabled="True"></asp:TextBox>
						</td>
					</tr>
				</table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_Image" runat="server" visible="True">
		<td>
			<!-- Table 1.1.4 -->
			<dnn:sectionhead id="dshSettings_Image" runat="server" CssClass="NormalBold" isExpanded="True" heigth="100%" text="Image/File/Video Settings:" section="divSettings_Image"></dnn:sectionhead>
			<DIV id="divSettings_Image" runat="server">
			    <asp:label id="lbxSettings_Image" CssClass="NormalBold" Runat="server" Visible="False">Image/Video Settings</asp:label>
			    <asp:table id="tblSettings_Image" Runat="server" CellPadding="0" CellSpacing="4" width="100%">
					<asp:TableRow Visible="False">
						<asp:TableCell CssClass="Normal">Save Image As:</asp:TableCell><asp:TableCell CssClass="Normal">
						        <asp:radiobuttonlist id="optSaveImageAs" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
								    AutoPostBack="True">
								    <asp:ListItem Value="file">File</asp:ListItem>
								    <asp:ListItem Value="blob">Blob</asp:ListItem>
							    </asp:radiobuttonlist>						
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="tblRowThumbnailWidth" Runat="server">
						<asp:TableCell CssClass="Normal">Detail Page Thumbnail Width:</asp:TableCell>
						<asp:TableCell CssClass="Normal">
						    <asp:TextBox ID="txtThumbnailWidth" CssClass="Normal" Runat="server" Width="45">120</asp:TextBox>&nbsp;px.
						    <asp:requiredfieldvalidator id="Requiredfieldvalidator11" runat="server" ErrorMessage="Required" ControlToValidate="txtThumbnailWidth" CssClass="NormalRed"></asp:requiredfieldvalidator>
						    <asp:CompareValidator Type="Integer" ControlToValidate="txtThumbnailWidth" ID="Comparevalidator5" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="tblRowThumbnailWidthDatagrid" Runat="server">
						<asp:TableCell CssClass="Normal">Datagrid Thumbnail Width:</asp:TableCell>
						<asp:TableCell CssClass="Normal">
						        <asp:TextBox ID="txtThumbnailWidthDatagrid" CssClass="Normal" Runat="server" Width="45">80</asp:TextBox>&nbsp;px.
						        <asp:requiredfieldvalidator id="Requiredfieldvalidator14" runat="server" ErrorMessage="Required" ControlToValidate="txtThumbnailWidthDatagrid" CssClass="NormalRed" Display="Dynamic"></asp:requiredfieldvalidator>
						        <asp:CompareValidator Type="Integer" ControlToValidate="txtThumbnailWidthDatagrid" ID="Comparevalidator7" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck" Runat="server" Display="Dynamic"></asp:CompareValidator>
					            <asp:checkbox id="chkShowGridThumb" Runat="server" CssClass="Normal" Checked="True" Text="Show Thumb image in Datagrid?"></asp:checkbox>
				        </asp:TableCell>
				    </asp:TableRow>
				    <asp:TableRow ID="tblRowThumbnailWidthMoreImages" Runat="server">
						<asp:TableCell CssClass="Normal">More Images Thumbnail Width:</asp:TableCell><asp:TableCell CssClass="Normal">
						<asp:TextBox ID="txtThumbnailWidthMoreImages" CssClass="Normal" Runat="server" Width="45">160</asp:TextBox>&nbsp;px. &nbsp;(160 recommended)
						    <asp:requiredfieldvalidator id="req_tblRowThumbnailWidthMoreImages" runat="server" ErrorMessage="Required" ControlToValidate="txtThumbnailWidthMoreImages" CssClass="NormalRed" Display="Dynamic"></asp:requiredfieldvalidator>
						    <asp:CompareValidator Type="Integer" ControlToValidate="txtThumbnailWidthMoreImages" ID="comp_txtThumbnailWidthMoreImages" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck" Runat="server" Display="Dynamic"></asp:CompareValidator>					
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
						<asp:TableCell CssClass="Normal">Thumb Image Quality: (1 - 100)</asp:TableCell><asp:TableCell>
							<asp:TextBox ID="txtImageQuality" CssClass="Normal" Runat="server" Width="45" Enabled="True">5</asp:TextBox>
							<asp:requiredfieldvalidator id="req_txtImageQuality" ControlToValidate="txtImageQuality" runat="server" ErrorMessage="Required" CssClass="NormalRed"></asp:requiredfieldvalidator>
							<asp:CompareValidator ID="Comp_txtImageQuality" ControlToValidate="txtImageQuality" Runat="server" Type="Integer" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck"></asp:CompareValidator>
							<asp:RangeValidator id="Range_txtImageQuality" ControlToValidate="txtImageQuality" runat="server" CssClass="NormalRed" ErrorMessage="From 1 to 100" MinimumValue="1" Type="Integer" MaximumValue="100"></asp:RangeValidator>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trEnableImageFilter" Runat="server" Visible="False">
						<asp:TableCell CssClass="Normal">Filter Image File Types for IE:<br />(jpg,jpeg,jpe,gif,bmp,png)</asp:TableCell>
						<asp:TableCell>
							<asp:radiobuttonlist id="optEnableImageFilter" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								<asp:ListItem Value="1">Yes</asp:ListItem>
								<asp:ListItem Value="0">No</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trEnableLightbox" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">
							<asp:label id="lblEnableLightbox" runat="server" CssClass="Normal">Enable Lightbox?</asp:label>
						</asp:TableCell><asp:TableCell>
							<asp:checkbox id="chkEnableLightbox" CssClass="Normal" Runat="server"></asp:checkbox>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trShowCustomCategoryIcon" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">
							<asp:label id="lblShowCustomCategoryIcon" runat="server" CssClass="Normal">Show Custom Category Icon?</asp:label>
						</asp:TableCell><asp:TableCell>
							<asp:checkbox id="chkShowCustomCategoryIcon" CssClass="Normal" Runat="server"></asp:checkbox>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trYouTubeSettings" Runat="server">
						<asp:TableCell CssClass="Normal"><asp:label id="lbxYouTubeSettings" runat="server" CssClass="Normal">YouTube:</asp:label></asp:TableCell><asp:TableCell CssClass="Normal">
						    <asp:label id="lbxYouTubeVideoWidth" runat="server" CssClass="Normal">Video Width:</asp:label>
					        <asp:TextBox ID="txtYouTubeVideoWidth" CssClass="Normal" Runat="server" Width="45">480</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtYouTubeVideoWidth" ID="comp_txtYouTubeVideoWidth" CssClass="NormalRed" ErrorMessage="Integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
					        &nbsp;
					        <asp:label id="lbxYouTubeVideoHeight" runat="server" CssClass="Normal">Video Height:</asp:label>
					        <asp:TextBox ID="txtYouTubeVideoHeight" CssClass="Normal" Runat="server" Width="45">385</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtYouTubeVideoHeight" ID="comp_txtYouTubeVideoHeight" CssClass="NormalRed" ErrorMessage="Integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
				            &nbsp;				            
				            <asp:label id="lbxYouTubeDataListColumns" runat="server" CssClass="Normal"># of Repeat Columns:</asp:label>
					        <asp:TextBox ID="txtYouTubeDataListColumns" CssClass="Normal" Runat="server" Width="45">1</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtYouTubeDataListColumns" ID="comp_txtYouTubeDataListColumns" CssClass="NormalRed" ErrorMessage="Integer > 0" Operator="GreaterThan" ValueToCompare="0" Runat="server"></asp:CompareValidator>    
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trMaxLimit" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">
							<asp:label id="lblMaxLimit" runat="server" CssClass="Normal">Max Limit (Leave as 0 for unlimited)</asp:label>
						</asp:TableCell>
						<asp:TableCell CssClass="Normal">
						    <asp:label id="lblMaxLimit_Image" runat="server" CssClass="Normal">Related Images:</asp:label>
					        <asp:TextBox ID="txtMaxLimit_Image" CssClass="Normal" Runat="server" Width="45">0</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtMaxLimit_Image" ID="comp_txtMaxLimit_Image" CssClass="NormalRed" ErrorMessage="Integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
					        &nbsp;
					        <asp:label id="lblMaxLimit_File" runat="server" CssClass="Normal">Related Files:</asp:label>
					        <asp:TextBox ID="txtMaxLimit_File" CssClass="Normal" Runat="server" Width="45">0</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtMaxLimit_File" ID="comp_txtMaxLimit_File" CssClass="NormalRed" ErrorMessage="Integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
				            &nbsp;				            
				            <asp:label id="lblMaxLimit_Video" runat="server" CssClass="Normal">YouTube Videos:</asp:label>
					        <asp:TextBox ID="txtMaxLimit_Video" CssClass="Normal" Runat="server" Width="45">0</asp:TextBox>
					        <asp:CompareValidator Type="Integer" ControlToValidate="txtMaxLimit_Video" ID="comp_txtMaxLimit_Video" CssClass="NormalRed" ErrorMessage="Integer" Operator="DataTypeCheck" Runat="server"></asp:CompareValidator>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trIndividualAuth" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">
							<asp:label id="lblIndividualAuth" runat="server" CssClass="Normal">Require individual item authorization?</asp:label>
						</asp:TableCell>
						<asp:TableCell>
						    <asp:label id="lblIndividualAuth_Image" runat="server" CssClass="Normal">Related Images:</asp:label>
							<asp:checkbox id="chkIndividualAuth_Image" CssClass="Normal" Runat="server"></asp:checkbox>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:label id="lblIndividualAuth_File" runat="server" CssClass="Normal">Related Files:</asp:label>
							<asp:checkbox id="chkIndividualAuth_File" CssClass="Normal" Runat="server"></asp:checkbox>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:label id="lblIndividualAuth_Video" runat="server" CssClass="Normal">YouTube Videos:</asp:label>
							<asp:checkbox id="chkIndividualAuth_Video" CssClass="Normal" Runat="server"></asp:checkbox>
							&nbsp;
						</asp:TableCell>
					</asp:TableRow>
				</asp:table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_Notification" runat="server" visible="True">
		<td>
			<!-- Table 1.1.5 -->
			<dnn:sectionhead id="dshSettings_Notification" runat="server" CssClass="NormalBold" isExpanded="True" heigth="100%" text="Email and Notification Settings:" section="divSettings_Notification"></dnn:sectionhead>
			<DIV id="divSettings_Notification" runat="server">
			    <asp:label id="lbxSettings_Notification" CssClass="NormalBold" Runat="server" Visible="False">Notification Settings</asp:label>
			    <asp:table id="tblSettings_Notification" Runat="server" CellPadding="0" CellSpacing="4" width="80%">
					<asp:TableRow>
						<asp:TableCell CssClass="Normal">Admin Email:</asp:TableCell>
						<asp:TableCell CssClass="Normal">
							<asp:TextBox ID="txtAdminEmail" CssClass="Normal" Runat="server" Width="200" Enabled="True">youremail@yourdomain.com</asp:TextBox>
							<asp:requiredfieldvalidator id="Requiredfieldvalidator9" runat="server" ErrorMessage="Required" ControlToValidate="txtAdminEmail"
								CssClass="NormalRed"></asp:requiredfieldvalidator>
							<asp:regularexpressionvalidator id="Regularexpressionvalidator2" runat="server" CssClass="NormalRed" ControlToValidate="txtAdminEmail"
								ErrorMessage="Email Must be Valid." ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Display="Dynamic"></asp:regularexpressionvalidator>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
					    <asp:TableCell CssClass="Normal">Notify Admin When Posting:</asp:TableCell>
					    <asp:TableCell CssClass="Normal">
						    <asp:checkbox id="chkPostingNotification" Runat="server" CssClass="Normal"></asp:checkbox>
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
					    <asp:TableCell CssClass="Normal">Send Approval Notice:</asp:TableCell>
					    <asp:TableCell CssClass="Normal">
						    <asp:checkbox id="chkSendApprovalNotice" Runat="server" CssClass="Normal"></asp:checkbox>
					    </asp:TableCell>
					</asp:TableRow>					
					<asp:TableRow>
					    <asp:TableCell CssClass="Normal">Inquiry send to:</asp:TableCell>
					    <asp:TableCell CssClass="Normal">
						    <asp:radiobuttonlist id="optInquirySendTo" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
							    <asp:ListItem Value="poster">User</asp:ListItem>
							    <asp:ListItem Value="admin">Admin</asp:ListItem>
						    </asp:radiobuttonlist>
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow Visible="false">
					    <asp:TableCell CssClass="Normal">Hide Contact Email:</asp:TableCell>
					    <asp:TableCell>
						    <asp:radiobuttonlist id="optHideContactEmail" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
							    <asp:ListItem Value="1">Yes</asp:ListItem>
							    <asp:ListItem Value="0">No</asp:ListItem>
						    </asp:radiobuttonlist>
					    </asp:TableCell>
				    </asp:TableRow>
					<asp:TableRow Visible="True">
					    <asp:TableCell CssClass="Normal" Wrap="True">User Notification Options:</asp:TableCell>
					    <asp:TableCell CssClass="Normal">
						    <asp:dropdownlist id="ddlUserNotifyOption" runat="server" cssClass="Normal" AutoPostBack="true">
							    <asp:ListItem Value="None">Do not notify users</asp:ListItem>
							    <asp:ListItem Value="Category">Notify only category subscribed users</asp:ListItem>
							    <asp:ListItem Value="Role">Notify users in selected roles below</asp:ListItem>
							    <asp:ListItem Value="RoleCategory">Notify both category subscribed users and selected roles below</asp:ListItem>
						    </asp:dropdownlist>
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow>
					    <asp:TableCell CssClass="Normal" Wrap="True">Roles to be notified:</asp:TableCell>
					    <asp:TableCell CssClass="Normal">
						    <asp:CheckBoxList id="chkAuth_UserNotify" RepeatColumns="2" cssclass="Normal" runat="server" />
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow Visible="False">
					    <asp:TableCell CssClass="Normal">Enable Category Subscription<br />Notification:</asp:TableCell>
					    <asp:TableCell CssClass="Normal">
						    <asp:checkbox id="chkEnableCatSubsNotify" Runat="server" CssClass="Normal"></asp:checkbox>
					    </asp:TableCell>
					    </asp:TableRow>
					<asp:TableRow>
					    <asp:TableCell CssClass="Normal">Auto Fill Listing Email:</asp:TableCell>
					    <asp:TableCell CssClass="Normal">
						    <asp:checkbox id="chkAutoFill_ListingEmail" Runat="server" CssClass="Normal" Text="Auto fill listing email with currently login user's email?"></asp:checkbox>
					    </asp:TableCell>
					</asp:TableRow>
				</asp:table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_Search" runat="server" visible="True">
		<td>
			<!-- Table 1.2 -->
			<dnn:sectionhead id="dshSettings_Search" runat="server" isExpanded="True" heigth="100%" text="Search Settings:" section="divSettings_Search" CssClass="NormalBold"></dnn:sectionhead>
			<DIV id="divSettings_Search" runat="server">
			<asp:label id="lbxSettings_Search" CssClass="NormalBold" Visible="False" Runat="server">Search Settings</asp:label>
			<table id="tblSettings_Search" runat="server" cellSpacing="5" cellPadding="1" width="100%">
					<tr id="trSearchMode" runat="server" visible="False">
						<td class="Normal" width="30%">
						    <asp:label id="lbxSearchMode" runat="server" CssClass="Normal">Search Panel:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
					        <asp:radiobuttonlist id="optSearchMode" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
							<asp:ListItem Value="SearchPanel">Embedded</asp:ListItem><asp:ListItem Value="SearchPage">New Page</asp:ListItem></asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trEnableQuickSearch" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableQuickSearch" runat="server" CssClass="Normal">Enable Quick Search?</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableQuickSearch" CssClass="Normal" Runat="server" AutoPostBack="True" Text="Enable Quick Search?" Checked="True"></asp:checkbox>
						</td>
					</tr>
					<tr id="trEnableMoreSearch" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableMoreSearch" runat="server" CssClass="Normal">More Search Options:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableMoreSearch" CssClass="Normal" Runat="server" AutoPostBack="False" Text="Enable More Search Options?"></asp:checkbox>
						</td>
					</tr>
					<tr id="trEnableCategory" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableCategory" CssClass="Normal" runat="server">Search by Categories:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableCategory" Runat="server" CssClass="Normal" Text="Enable searching by Categories?"></asp:checkbox>
						</td>
					</tr>
					<tr id="trEnableLocationSearch" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableLocationSearch" runat="server" CssClass="Normal">Search by Locations:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableLocationSearch" CssClass="Normal" Runat="server" AutoPostBack="True" Text="Enable filtering by Location?"></asp:checkbox>
							<asp:checkbox id="chkEnableRadiusSearch" CssClass="Normal" Runat="server" AutoPostBack="False"
								Text="Enable Radius Search (US)? (Required US Zip Code Add-On)"></asp:checkbox>
								&nbsp;																
								<a href = '<%= DotNetNuke.jb_Utility.BuildDesktopLink(Me.TabId, "so", "&picklistgroup=RadiusOptions") %>'>Edit&nbsp;Radius</a>						   
							<div style="display:none;">
						    <br />
						    <asp:label id="lbxRadiusUnit" runat="server" CssClass="Normal">Radius Unit:</asp:label>
							<asp:dropdownlist id="ddlRadiusUnit" runat="server" cssClass="Normal" AutoPostBack="true">
								<asp:ListItem Value="1">Miles</asp:ListItem>
								<asp:ListItem Value="1.609344">Kilometers</asp:ListItem>								
							</asp:dropdownlist>							
							<br />							
							<asp:label id="lbxRadiusOptions" runat="server" CssClass="Normal">Radius Picklist Options:</asp:label>
					        <asp:TextBox ID="txtRadiusOptions" CssClass="Normal" Runat="server" Width="100" ValidationGroup="RadiusOptions">25,50,100</asp:TextBox>
					        <asp:regularexpressionvalidator id="regex_txtRadiusOptions" ValidationGroup="RadiusOptions" ControlToValidate="txtRadiusOptions" runat="server" CssClass="Normal" Display="Dynamic" ErrorMessage="Not a valid format" Enabled="true"  ValidationExpression="[0-9]+(,[0-9]+)*"></asp:regularexpressionvalidator>					         
					        <br />
					        <asp:label id="lbxRadiusOptions_Note" runat="server" CssClass="Normal">Note: Use comma separated integers with no space such as 25,50,100</asp:label>
					        </div> 
						  </td>
					</tr>
					<tr id="trEnableControlWrap" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableControlWrap" runat="server" CssClass="Normal">Wrap controls:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableControlWrap" CssClass="Normal" Runat="server" AutoPostBack="False" Text="Wrap controls to save screen real estate?"></asp:checkbox>
						</td>
					</tr>
					<tr id="trEnableSearchAttributeString" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableSearchAttributeString" runat="server" CssClass="Normal">Search Attribute String:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableSearchAttributeString" CssClass="Normal" Runat="server" AutoPostBack="False" Text="Search Attribute String? (This might cause slow search performance.)"></asp:checkbox>
						</td>
					</tr>
					<tr id="trEnableAutoComplete" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableAutoComplete" runat="server" CssClass="Normal">AutoComplete:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableAutoComplete" CssClass="Normal" Runat="server" AutoPostBack="True" Text="Enable AutoComplete?"></asp:checkbox>
							&nbsp;&nbsp;
							<asp:HyperLink id="hplAutoCompleteCustomList" Visible="True" Enabled="True" runat="server" Text="Edit Custom Keyword(s)/Location(s)" />
							<br />						 
							<asp:label id="lbxLocationSearchType" runat="server" CssClass="Normal">Search Location(s):</asp:label>
							<asp:dropdownlist id="ddlLocationSearchType" runat="server" cssClass="Normal">
							    <asp:ListItem Value="DropDownList-City">DropDownList: City</asp:ListItem>
								<asp:ListItem Value="DropDownList-Region">DropDownList: Region</asp:ListItem>
								<asp:ListItem Value="DropDownList-CityRegion">DropDownList: City, Region</asp:ListItem>
								<asp:ListItem Value="DropDownList-Postal">DropDownList: Postal</asp:ListItem>
								<asp:ListItem Value="DropDownList-CustomLocation">DropDownList: Custom Location(s)</asp:ListItem>
							    <asp:ListItem Value="AutoComplete-City">AutoComplete: City</asp:ListItem>
							    <asp:ListItem Value="AutoComplete-Region">AutoComplete: Region</asp:ListItem>
							    <asp:ListItem Value="AutoComplete-CityRegion">AutoComplete: City, Region</asp:ListItem>
							    <asp:ListItem Value="AutoComplete-Postal">AutoComplete: Postal</asp:ListItem>
							    <asp:ListItem Value="AutoComplete-CustomLocation">AutoComplete: Custom Location(s)</asp:ListItem>
							</asp:dropdownlist>
							<br />
							<asp:label id="lbxKeywordSearchType" runat="server" CssClass="Normal">Search Keyword(s):</asp:label>    
							<asp:dropdownlist id="ddlKeywordSearchType" runat="server" cssClass="Normal">
								<asp:ListItem Value="AutoComplete-Title">AutoComplete: Title</asp:ListItem>
								<asp:ListItem Value="AutoComplete-CustomKeyword">AutoComplete: Custom Keyword(s)</asp:ListItem>
							</asp:dropdownlist>
							<br />
						</td>
					</tr>
				</table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_PageOptions" runat="server" visible="True">
		<td>
			<!-- Table 1.3 -->
			<dnn:sectionhead id="dshSettings_PageOptions" runat="server" CssClass="NormalBold" isExpanded="True" heigth="100%" text="Page Option Settings:" section="divSettings_PageOptions"></dnn:sectionhead>
			<DIV id="divSettings_PageOptions" runat="server">
			    <asp:label id="lbxSettings_PageOptions" CssClass="NormalBold" Runat="server" Visible="False">Page Option Settings</asp:label>
			    <table id="tblSettings_PageOptions" runat="server" cellSpacing="5" cellPadding="1" width="100%">
					<tr id="trEnablePageOptions" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnablePageOptions" runat="server" CssClass="Normal">Enable Page Options?</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnablePageOptions" Runat="server" CssClass="Normal"></asp:checkbox>
						</td>
					</tr>
					<tr id="trPrintOption" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lbxPrintOption" runat="server" CssClass="Normal">Print Options:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:radiobuttonlist id="optPrintOption" runat="server" CssClass="Normal" RepeatDirection="Vertical">
								<asp:ListItem Value="Dialog">Open Print Dialog (will print the whole page)</asp:ListItem>
								<asp:ListItem Value="Friendly">Open as Printable Version</asp:ListItem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trNotifyAdminEmailFriend" runat="server" visible="True">
						<td class="Normal" width="30%"><asp:label id="lbxNotifyAdminEmailFriend" runat="server" CssClass="Normal">Notify Admin When Users Email Friend?</asp:label></td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkNotifyAdminEmailFriend" Runat="server" CssClass="Normal"></asp:checkbox>
						</td>
					</tr>
					<tr id="trApplyNowOption" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="Label2" runat="server" CssClass="Normal">Apply Now Options:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:radiobuttonlist id="optApplyNowOption" runat="server" CssClass="Normal" RepeatDirection="Vertical">
								<asp:ListItem Value="Embedded">Embedded in detail page</asp:ListItem>
								<asp:ListItem Value="NewPage">Open new page</asp:ListItem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trDetailPageLayout" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lbxDetailPageLayout" runat="server" CssClass="Normal">Optional Detail Page Layout</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:dropdownlist id="ddlDetailPageLayout" runat="server" cssClass="Normal">
								<asp:ListItem Value="jb_MoreInfo.ascx">Original</asp:ListItem>								
								<asp:ListItem Value="jb_MoreInfo_3ct.ascx">3-Column-Top</asp:ListItem>
							</asp:dropdownlist>
						</td>
					</tr>
				</table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_Performance" runat="server" visible="True">
		<td>
			<!-- Table 1.3 -->
			<dnn:sectionhead id="dshSettings_Performance" runat="server" CssClass="NormalBold" isExpanded="True" heigth="100%" text="Performance Settings:" section="divSettings_Performance"></dnn:sectionhead>
			<DIV id="divSettings_Performance" runat="server">
			    <asp:label id="lbxSettings_Performance" CssClass="NormalBold" Runat="server" Visible="False">Page Option Settings</asp:label>
			    <table id="tblSettings_Performance" runat="server" cellSpacing="5" cellPadding="1" width="100%">
					<tr id="trEnableCaching" runat="server" visible="False">
						<td class="Normal" width="30%">
						    <asp:label id="lblEnableCaching" runat="server" CssClass="Normal">Enable Caching?</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:checkbox id="chkEnableCaching" Runat="server" CssClass="Normal"></asp:checkbox>
						</td>
					</tr>
					<tr id="trItemsCountOption" runat="server" visible="True">
						<td class="Normal" width="30%">
						    <asp:label id="lbxItemsCountOption" runat="server" CssClass="Normal">Items Count Options:</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
							<asp:radiobuttonlist id="optItemsCountOption" runat="server" CssClass="Normal" RepeatDirection="Vertical">
								<asp:ListItem Value="UDF">Recursive UDF (Dynamic and more accurate runtime count)</asp:ListItem>
								<asp:ListItem Value="TABLE">Save to Table</asp:ListItem>
							</asp:radiobuttonlist>
							<asp:label id="lbxItemsCountOption_Note" Runat="server" CssClass="Normal">
								Note: Switching to the second option later will require update to existing items count in the table. Please use the Sync button below or contact us for the update script.  
							</asp:label>
							<br />
							<asp:linkbutton id="lnkBtnSyncItemsCount" CssClass="Normal" Runat="server" Enabled="True" CausesValidation="False">Sync Items Count</asp:linkbutton>
							&nbsp;&nbsp;&nbsp;
							<asp:label id="lblSyncItemsCount_Message" runat="server" CssClass="NormalRed" Visible="True"></asp:label>
						</td>
					</tr>
				</table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_Review" runat="server" visible="True">
		<td>
			<!-- Table 1.5 -->
			<dnn:sectionhead id="dshSettings_Review" runat="server" isExpanded="True" heigth="100%" text="Review Settings:" section="divSettings_Review" CssClass="NormalBold"></dnn:sectionhead>
			<DIV id="divSettings_Review" runat="server">
			    <asp:label id="lbxSettings_Review" CssClass="NormalBold" Visible="False" Runat="server">Review Settings</asp:label>
			    <table cellSpacing="5" cellPadding="1" width="100%">
				    <tr>
					    <td class="Normal" width="30%">
					        <asp:label id="lblEnableReview" runat="server" CssClass="Normal">Review Settings:</asp:label>
					    </td>
					    <td class="Normal" align="left" width="70%">
					        <asp:checkbox id="chkEnableReview" CssClass="Normal" Runat="server" AutoPostBack="True" Text="Enable Review?"></asp:checkbox>
					        <asp:checkbox id="chkReviewAuth" CssClass="Normal" Visible="False" Runat="server" Enabled="False" Text="Require Authorization?"></asp:checkbox>
					        <asp:checkbox id="chkEnableReviewHelpful" CssClass="Normal" Visible="False" Runat="server" Enabled="False" Text="Enable Helpful option?"></asp:checkbox>
					    </td>
				    </tr>
				    <tr id="trReviewCookieInterval" runat="server" visible="False">
					    <td class="Normal" width="30%">
					        <asp:label id="lblReviewCookieInterval" runat="server" CssClass="Normal">Cookie Interval (days):</asp:label>
					    </td>
					    <td class="Normal" align="left" width="70%">
					        <asp:textbox id="txtReviewCookieInterval" CssClass="Normal" Runat="server" Width="45">14</asp:textbox>
					        <asp:requiredfieldvalidator id="req_txtReviewCookieInterval" runat="server" CssClass="NormalRed" ControlToValidate="txtReviewCookieInterval" ErrorMessage="Required"></asp:requiredfieldvalidator>
					        <asp:comparevalidator id="comp_txtReviewCookieInterval" CssClass="NormalRed" Runat="server" ControlToValidate="txtReviewCookieInterval" ErrorMessage="Must be integer" Operator="DataTypeCheck" Type="Integer"></asp:comparevalidator>
					    </td>
					</tr>
					<tr id="trEnableDetailedReview" runat="server" visible="True">
						<td class="Normal" width="30%"><asp:label id="lbxEnableDetailedReview" runat="server" CssClass="Normal">Detailed Review:</asp:label></td>
						<td class="Normal" align="left" width="70%">
						    <asp:checkbox id="chkEnableDetailedReview" CssClass="Normal" Visible="True" Runat="server" Enabled="True" Text="Enable Detailed Review?"></asp:checkbox>
						    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						    <asp:label id="lblDetailedReviewStyle" runat="server" CssClass="Normal">Detailed Review Style:</asp:label>
						    <asp:dropdownlist id="ddlDetailedReviewStyle" runat="server" cssClass="Normal">
								<asp:ListItem Value="Star">Star</asp:ListItem>													
								<asp:ListItem Value="BarRed.png">Bar: Red</asp:ListItem>
								<asp:ListItem Value="BarGreen.png">Bar: Green</asp:ListItem>
								<asp:ListItem Value="BarBlue.png">Bar: Blue</asp:ListItem>
								<asp:ListItem Value="BarYellow.png">Bar: Yellow</asp:ListItem>
								<asp:ListItem Value="BarCyan.png">Bar: Cyan</asp:ListItem>
								<asp:ListItem Value="BarPurple.png">Bar: Purple</asp:ListItem>
								<asp:ListItem Value="BarOrange.png">Bar: Orange</asp:ListItem>
								<asp:ListItem Value="BarCustom.png">Bar: Custom</asp:ListItem>
							</asp:dropdownlist>
						</td>
					</tr>
					<tr id="trReviewMode" runat="server" visible="false">
						<td class="Normal" width="30%"><asp:label id="lblReviewMode" runat="server" CssClass="Normal">Review Mode:</asp:label></td>
						<td class="Normal" align="left" width="70%">
						    <asp:dropdownlist id="ddlReviewMode" runat="server" cssClass="Normal">
								<asp:ListItem Value="basic">Basic Ratings</asp:ListItem>								
								<asp:ListItem Value="detailed">Detailed Ratings</asp:ListItem>
							</asp:dropdownlist>
						</td>
					</tr>
					<tr id="trReviewAddRoles" runat="server" visible="False">
					    <td class="Normal" width="30%">
					        <asp:label id="lblReviewAddRoles" runat="server" CssClass="Normal">Roles that can add review:</asp:label><br />
						    <asp:label id="lbxReviewAddRoles" runat="server" CssClass="Normal">Note: Full Permissions to Edit Module Users</asp:label>
						</td>
						<td class="Normal" align="left" width="70%">
						    <asp:checkboxlist id="chkReviewAddRoles" runat="server" CssClass="Normal" RepeatColumns="2"></asp:checkboxlist>
						</td>
				    </tr>
				    <tr id="trReviewAdminRoles" runat="server" visible="False">
					    <td class="Normal" width="30%">
					        <asp:label id="lblReviewAdminRoles" runat="server" CssClass="Normal">Roles that can manage review:</asp:label>
					        <br />	
					        <asp:label id="lbxReviewAdminRoles" runat="server" CssClass="Normal">Note: Full Permissions to Edit Module Users</asp:label>
					    </td>
					    <td class="Normal" align="left" width="70%">
					        <asp:checkboxlist id="chkReviewAdminRoles" runat="server" CssClass="Normal" RepeatColumns="2">
					        </asp:checkboxlist>
					    </td>
				    </tr>
				    <tr id="trReviewShowAvgInDG" runat="server" visible="False">
					    <td class="Normal" width="30%">
					        <asp:label id="lbxReviewShowAvgInDG" runat="server" CssClass="Normal">Show Average Review in Datagrid?</asp:label>
					    </td>
					    <td class="Normal" align="left" width="70%">
						    <asp:checkbox id="chkReviewShowAvgInDG" CssClass="Normal" Runat="server"></asp:checkbox>
					    </td>
				    </tr>
				    <tr id="trReviewName" runat="server" visible="True">
					    <td class="Normal" width="30%">
					        <asp:label id="lbxReviewName" runat="server" CssClass="Normal">Use review name as:</asp:label>
					    </td>
					    <td class="Normal" align="left" width="70%">
					        <asp:dropdownlist id="ddlReviewName" runat="server" cssClass="Normal">
					            <asp:ListItem Value="DisplayName">Display Name</asp:ListItem>
					            <asp:ListItem Value="FirstNameLastName">First Name + Last Name</asp:ListItem>
					            <asp:ListItem Value="UserName">User Name</asp:ListItem>
					        </asp:dropdownlist>
					    </td>
					</tr>
					<tr id="trEnableFacebookLikeBtn" runat="server" visible="True">
					    <td class="Normal" width="30%">
					        <asp:label id="lblEnableFacebookLikeBtn" runat="server" CssClass="Normal">Facebook Like button:</asp:label>
					    </td>
					    <td class="Normal" align="left" width="70%">
						    <asp:checkbox id="chkEnableFacebookLikeBtn" CssClass="Normal" Runat="server" Text="Enable Facebook Like button?"></asp:checkbox>
					    </td>
				    </tr>
				    <tr id="trSocialBookmarkingScript" runat="server" visible="True">
					    <td class="Normal" width="30%">
					        <asp:label id="lblSocialBookmarkingScript" runat="server" CssClass="Normal">Social Bookmarking:</asp:label>
					    </td>
					    <td class="Normal" align="left" width="70%">
					         <asp:checkbox id="chkEnableSocialBookmarkingScript" CssClass="Normal" Runat="server" Text="Enable Social Bookmarking?"></asp:checkbox>
						     <asp:label id="lbxEnterEnableSocialBookmarkingScript" runat="server" CssClass="Normal">Please Enter script below:</asp:label>
						     <br />
						     <asp:textbox id="txtSocialBookmarkingScript" runat="server" CssClass="Normal" Width="575px" TextMode="MultiLine" Rows="5"></asp:textbox>
					        <br />
					        <asp:label id="lbxSocialBookmarkingNote" runat="server" CssClass="Normal">Note: Script can be generated from social bookmarking service website such as <a href="http://www.addthis.com" target="_blank">AddThis.com</a></asp:label>
					    </td>
				    </tr>				   
			    </table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_Announcement" runat="server">
		<td>
			<!-- Table 2 -->
			<dnn:sectionhead id="dshSettings_Announcement" runat="server" isExpanded="True" heigth="100%" text="Announcement Settings:" section="divSettings_Announcement" CssClass="NormalBold"></dnn:sectionhead>
			<DIV id="divSettings_Announcement" runat="server">
			    <asp:label id="lbxSettings_Announcement" CssClass="NormalBold" Visible="False" Runat="server">Announcement Settings</asp:label>
			    <table cellSpacing="5" cellPadding="1" width="100%">
					<tr>
						<td class="Normal">Enable Announcement:</td>
						<td align="left">
						    <asp:radiobuttonlist id="optEnableAnnouncement" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
								<asp:ListItem Value="1">Yes</asp:ListItem>
								<asp:ListItem Value="0">No</asp:ListItem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trAnnouncement_CSSClass" runat="server" visible="false">
						<td class="Normal">CSS Class</td>
						<td align="left">
						    <asp:textbox id="txtClass" runat="server" CssClass="Normal" Width="141px"></asp:textbox>
						    <asp:requiredfieldvalidator id="Requiredfieldvalidator12" runat="server" CssClass="Normal" ControlToValidate="txtClass" ErrorMessage="Required"></asp:requiredfieldvalidator>
						</td>
					</tr>
					<tr id="trAnnouncement_FadeScheme" runat="server" visible="false">
						<td class="Normal">Fade Scheme</td>
						<td align="left">
						    <asp:radiobuttonlist id="optFadescheme" CssClass="Normal" Runat="server" RepeatDirection="Horizontal">
								<asp:ListItem Value="1">Black to White</asp:ListItem>
								<asp:ListItem Value="0">White to Black</asp:ListItem>
							</asp:radiobuttonlist>
						</td>
					</tr>
					<tr id="trAnnouncement_FadeLinks" runat="server" visible="false">
						<td class="Normal">Fade links</td>
						<td class="Normal" align="left">Should links inside scroller content also fade like text?<br />
							<asp:radiobuttonlist id="optFadelinks" CssClass="Normal" Runat="server" RepeatDirection="Horizontal">
								<asp:ListItem Value="1">Yes</asp:ListItem>
								<asp:ListItem Value="0">No</asp:ListItem>
							</asp:radiobuttonlist>
						</td>
					</tr>
				    <tr>
						<td class="Normal">Delay:</td><td class="Normal" align="left">Delay&nbsp;between message change is in&nbsp;miliseconds<br />
							<asp:textbox id="txtDelay" runat="server" CssClass="Normal" Width="75px"></asp:textbox>
							<asp:requiredfieldvalidator id="valDelay" runat="server" CssClass="Normal" ControlToValidate="txtDelay" ErrorMessage="Required"></asp:requiredfieldvalidator>
							<asp:comparevalidator id="Comparevalidator2" runat="server" CssClass="Normal" ControlToValidate="txtDelay" ErrorMessage="You must enter a value greater than zero" Operator="GreaterThan" Type="Integer" Display="Dynamic" ValueToCompare="0"></asp:comparevalidator>
						</td>
					</tr>
					<tr>
						<td class="Normal">Message 1:</td>
						<td align="left"><asp:textbox id="txtContent0" runat="server" CssClass="Normal" Width="400px" MaxLength="1500" TextMode="MultiLine" Rows="3"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="Normal">Message 2:</td>
						<td align="left"><asp:textbox id="txtContent1" runat="server" CssClass="Normal" Width="400px" MaxLength="1500" TextMode="MultiLine" Rows="3"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="Normal">Message 3:</td>
						<td align="left">
						    <asp:textbox id="txtContent2" runat="server" CssClass="Normal" Width="400px" MaxLength="1500" TextMode="MultiLine" Rows="3"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="Normal">Message 4:</td>
						<td align="left">
						    <asp:textbox id="txtContent3" runat="server" CssClass="Normal" Width="400px" MaxLength="1500" TextMode="MultiLine" Rows="3"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="Normal">Message 5:</td>
						<td align="left">
						    <asp:textbox id="txtContent4" runat="server" CssClass="Normal" Width="400px" MaxLength="1500" TextMode="MultiLine" Rows="3"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="Normal">&nbsp;</td>
						<td class="Normal">
							<ul>
								<li>Each message is 1500 characters max.</li>
								<li>Please do not skip the message order.</li>			
							</ul>
						</td>
					</tr>
				</table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_PayPal" runat="server">
		<td>
			<!-- Table 3 -->
			<dnn:sectionhead id="dshSettings_PayPal" runat="server" CssClass="NormalBold" section="divSettings_PayPal" text="Payment Settings:" heigth="100%" isExpanded="True"></dnn:sectionhead>
			<DIV id="divSettings_PayPal" runat="server">
				<asp:label id="lbxSettings_PayPal" Runat="server" CssClass="NormalBold" Visible="False">PayPal Settings</asp:label>
				<asp:table id="tblPaypal" Runat="server" CellPadding="0" CellSpacing="4" width="100%">
					<asp:TableRow Visible="False">
						<asp:TableCell ColumnSpan="2" CssClass="Normal">
							<asp:label id="lblReleaseStatus" Runat="server" CssClass="NormalRed"></asp:label>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trPaymentEnable" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">Payment Enable:</asp:TableCell>
						<asp:TableCell>
							<asp:radiobuttonlist id="optPaypalEnable" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
								AutoPostBack="true">
								<asp:ListItem Value="1">Yes</asp:ListItem>
								<asp:ListItem Value="0">No</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trOperationMode" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">
							<asp:label id="lblUseSandbox" runat="server" CssClass="Normal">Operation Mode:</asp:label>
						</asp:TableCell>
					    <asp:TableCell>
							<asp:radiobuttonlist id="optPayPalOperationMode" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
								Enabled="False">
								<asp:ListItem Value="live">Live</asp:ListItem>
								<asp:ListItem Value="sandbox">Sandbox/Test</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trPaymentGateway" runat="server">
						<asp:TableCell CssClass="Normal">
						    <asp:label id="lblPaymentGateway" Runat="server" CssClass="Normal">Choose Payment Gateway:</asp:label>
						</asp:TableCell>
						<asp:TableCell>
							<asp:radiobuttonlist id="optPaymentGateway" runat="server" CssClass="Normal" RepeatDirection="Horizontal" AutoPostBack="true" EnableViewState="True">
								<asp:ListItem Value="paypal">PayPal</asp:ListItem>
								<asp:ListItem Value="authorize.net">Authorize.net</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trAuthorizeNet_APILogin" runat="server">
						<asp:TableCell CssClass="Normal">
						    <asp:label id="lblAPILogin" runat="server" CssClass="Normal">API Login:</asp:label>
						</asp:TableCell>
						<asp:TableCell>
						    <asp:textbox id="txtAPILogin" runat="server" CssClass="Normal" MaxLength="100" width="300" Enabled="True"></asp:textbox>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow id="trAuthorizeNet_TransactionKey" runat="server">
						<asp:TableCell CssClass="Normal">
					        <asp:label id="lblTransactionKey" runat="server" CssClass="Normal">Transaction Key:</asp:label>
					    </asp:TableCell>
					    <asp:TableCell>
					        <asp:textbox id="txtTransactionKey" runat="server" CssClass="Normal" MaxLength="100" width="300" Enabled="True"></asp:textbox>
					    </asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trPayPal_EmailCurrencyCode" runat="server">
						<asp:TableCell CssClass="Normal">PayPal Receiver Email:</asp:TableCell>
						<asp:TableCell>
							<asp:textbox id="txtPayPalBusinessEmail" runat="server" CssClass="Normal" MaxLength="100" width="300" Enabled="False"></asp:textbox>
							<asp:requiredfieldvalidator id="valReqPayPalBusinessEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtPayPalBusinessEmail" CssClass="NormalRed" Enabled="False" Display="Dynamic"></asp:requiredfieldvalidator>
							<asp:regularexpressionvalidator id="valFormatPayPalBusinessEmail" runat="server" CssClass="NormalRed" ControlToValidate="txtPayPalBusinessEmail" ErrorMessage="Email Must be Valid." ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Enabled="False" Display="Dynamic"></asp:regularexpressionvalidator>&nbsp;&nbsp;
							<asp:label id="lblPayPaCurrencyCode" runat="server" CssClass="Normal">Currency Code:</asp:label>
							<asp:textbox id="txtPayPalCurrencyCode" runat="server" CssClass="Normal" MaxLength="100" width="100" Enabled="False"></asp:textbox>
							<asp:requiredfieldvalidator id="valReqPayPalCurrencyCode" runat="server" ErrorMessage="Required" ControlToValidate="txtPayPalCurrencyCode" CssClass="NormalRed" Enabled="False" Display="Dynamic"></asp:requiredfieldvalidator>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trShowIPNError" runat="server">
						<asp:TableCell CssClass="Normal">Show PayPal IPN Error?</asp:TableCell>
						<asp:TableCell>						
							<asp:checkbox id="chkShowIPNError" CssClass="Normal" Runat="server" visible="True" Text="In case of error, show PayPal IPN error message to the user?"></asp:checkbox>						
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trIPNEnable" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">IPN Enable:</asp:TableCell>
						<asp:TableCell>
							<asp:radiobuttonlist id="optIPNEnable" runat="server" CssClass="Normal" RepeatDirection="Horizontal" Enabled="False">
								<asp:ListItem Value="1">Yes</asp:ListItem>
								<asp:ListItem Value="0">No</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trIPNWaitTime" runat="server" Visible="false">
						<asp:TableCell CssClass="Normal">Response Waiting Time (seconds):</asp:TableCell>
						<asp:TableCell>
							<asp:label id="lbxIPNWaitTime_Note1" Runat="server" CssClass="Normal">Allow</asp:label>
							<asp:TextBox ID="txtIPNWaitTime" CssClass="Normal" Runat="server" Width="45">0</asp:TextBox>
							<asp:label id="lbxIPNWaitTime_Note2" Runat="server" CssClass="Normal">
								seconds to wait for response.  
							</asp:label>
							<asp:RangeValidator id="Range_txtIPNWaitTime" ControlToValidate="txtIPNWaitTime" runat="server" CssClass="NormalRed" ErrorMessage="From 0 to 600" MinimumValue="0" Type="Integer" MaximumValue="600"></asp:RangeValidator>			
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trSuccessMessage" Runat="server">
						<asp:TableCell CssClass="Normal">Success Message:</asp:TableCell>
						<asp:TableCell>
							<asp:TextBox ID="txtemailafterpayment" Runat="server" CssClass="Normal" Rows="2" Columns="60" Wrap="true" TextMode="MultiLine" Enabled="False"></asp:TextBox>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trErrorMessage" Runat="server" Visible="False">
						<asp:TableCell CssClass="Normal">Error Message: Invalid Payment</asp:TableCell>
						<asp:TableCell>
							<asp:TextBox ID="txtErrorMsgInvalidPayment" Runat="server" CssClass="Normal" Rows="2" Columns="60" Wrap="true" TextMode="MultiLine" Enabled="False"></asp:TextBox>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trListingFeeMethod" runat="server">
						<asp:TableCell CssClass="Normal">Listing Fee Method:</asp:TableCell>
						<asp:TableCell>
							<asp:radiobuttonlist id="optListingFeeMethod" runat="server" CssClass="Normal" RepeatDirection="Vertical" AutoPostBack="True" Enabled="False">
								<asp:ListItem Value="SubscriptionFee">Subscription Plans (Recommended)</asp:ListItem>
								<asp:ListItem Value="FlatFee">Flat Fee: Please Enter Fee Amount below</asp:ListItem>
								<asp:ListItem Value="PerCategoryFee">Per Category Fee: Fee Amount can be entered on Manage Categories page</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trFlatFeeAmount" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">Flat Fee Amount: <br />(Using 2 decimal format)</asp:TableCell>
						<asp:TableCell>
							<asp:textbox id="txtPrice" runat="server" cssclass="Normal" MaxLength="10" Width="50px" TextMode="SingleLine" Enabled="False"></asp:textbox>
							<asp:requiredfieldvalidator id="valRequiredPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Required" CssClass="NormalRed" Enabled="False" Visible="True" Display="Dynamic"></asp:requiredfieldvalidator>
							<asp:regularexpressionvalidator id="valCurrencyFormat" runat="server" CssClass="NormalRed" ErrorMessage="#.##" ControlToValidate="txtPrice" ValidationExpression="^\d+(?:\.\d{0,2})?$" Visible="True" Enabled="False" Display="Dynamic"></asp:regularexpressionvalidator>
							<br />
							<asp:label id="lbxPrice" Runat="server" CssClass="Normal">Note: This only apply to Flat Fee. If you are using Per Category Fee, please enter 0 above.</asp:label>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trSubscriptionPlan" Runat="server" Visible="False">
						<asp:TableCell CssClass="Normal" Width="15%">
						    <asp:label id="lbxSubscriptionPlan" runat="server" CssClass="Normal">Subscription Plan(s):</asp:label>
						</asp:TableCell>
						<asp:TableCell CssClass="Normal">
							<asp:datagrid id="dgSubscriptionPlan" runat="server" Visible="True" OnUpdateCommand="dgSubscriptionPlan_Update"
								OnCancelCommand="dgSubscriptionPlan_Cancel" OnEditCommand="dgSubscriptionPlan_Edit" HeaderStyle-CssClass="JediCss_TableHeader"
								AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
								AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
								PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" DataKeyField="PlanID"
								ShowFooter="True">
								<Columns>
									<asp:BoundColumn DataField="PlanID" ItemStyle-HorizontalAlign="Center" HeaderText="PlanID" Visible="False"
										ReadOnly="True" />
									<asp:TemplateColumn HeaderText="View<br/>Order">
										<ItemTemplate>
											<asp:Label ID="lblViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server" EnableViewState="True"></asp:TextBox>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Plan Name" ItemStyle-HorizontalAlign="Left">
										<ItemTemplate>
											<asp:Label ID="lblPlanName" text='<%# DataBinder.Eval(Container.DataItem, "PlanName") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtPlanName" Width="65" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PlanName") %>' Runat="server" />*
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtPlanName_Add" Width="65" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>*
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Description" ItemStyle-HorizontalAlign="Left">
										<ItemTemplate>
											<asp:Label ID="lblDescription" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtDescription" Width="175" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server" />
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtDescription_Add" Width="175" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Plan<br/>Fee">
										<ItemTemplate>
											<asp:Label ID="lblFee" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Fee")).ToString("##0.00") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtFee" Width="35" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Fee")).ToString("##0.00") %>' Runat="server" />*
											<asp:regularexpressionvalidator id="valFeeFormat" runat="server" CssClass="Normal" ErrorMessage="#.##" ControlToValidate="txtFee"
												Display="Dynamic" ValidationExpression="^\d+(?:\.\d{0,2})?$" Enabled="True"></asp:regularexpressionvalidator>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtFee_Add" Width="35" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
											<asp:regularexpressionvalidator id="valFeeFormat_Add" runat="server" CssClass="Normal" ErrorMessage="#.##" ControlToValidate="txtFee_Add"
												Display="Dynamic" ValidationExpression="^\d+(?:\.\d{0,2})?$" Enabled="True"></asp:regularexpressionvalidator>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Plan<br/>Period<br/>(Days)">
										<ItemTemplate>
											<asp:Label ID="lblExpirationPeriod" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ExpirationPeriod") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtExpirationPeriod" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ExpirationPeriod") %>' Runat="server" />*
											<asp:CompareValidator id="comPosInt_txtExpirationPeriod" runat="server" CssClass="Normal" ControlToValidate="txtExpirationPeriod"
												ErrorMessage="Int > 0" Display="Dynamic" Operator="GreaterThan" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtExpirationPeriod_Add" Width="35" Runat="server" EnableViewState="True" CssClass="Normal">30</asp:TextBox>*
											<asp:CompareValidator id="comPosInt_txtExpirationPeriod_Add" runat="server" CssClass="Normal" ControlToValidate="txtExpirationPeriod_Add"
												ErrorMessage="Int > 0" Display="Dynamic" Operator="GreaterThan" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Listing<br/>Period<br/>(Days)">
										<ItemTemplate>
											<asp:Label ID="lblListingPeriod" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ListingPeriod") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtListingPeriod" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ListingPeriod") %>' Runat="server" />*
											<asp:CompareValidator id="comPosInt_txtListingPeriod" runat="server" CssClass="Normal" ControlToValidate="txtListingPeriod"
												ErrorMessage="Int >= 0" Display="Dynamic" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtListingPeriod_Add" Width="35" Runat="server" EnableViewState="True" CssClass="Normal">30</asp:TextBox>*
											<asp:CompareValidator id="comPosInt_txtListingPeriod_Add" runat="server" CssClass="Normal" ControlToValidate="txtListingPeriod_Add"
												ErrorMessage="Int >= 0" Display="Dynamic" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Plan<br/>Limit">
										<ItemTemplate>
											<asp:Label ID="lblLimit" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Limit") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtLimit" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Limit") %>' Runat="server" />*
											<asp:CompareValidator id="comPosInt_txtLimit" runat="server" CssClass="Normal" ControlToValidate="txtLimit"
												ErrorMessage="Int > 0" Display="Dynamic" Operator="GreaterThan" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtLimit_Add" Width="35" Runat="server" EnableViewState="True" CssClass="Normal">5</asp:TextBox>*
											<asp:CompareValidator id="comPosInt_txtLimit_Add" runat="server" CssClass="Normal" ControlToValidate="txtLimit_Add"
												ErrorMessage="Int > 0" Display="Dynamic" Operator="GreaterThan" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Role">
										<ItemTemplate>
											<asp:Label ID="lblRole" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "RoleName") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:DropDownList id="ddlRole" runat="server" CssClass="Normal" DataTextField = "RoleName" DataValueField = "RoleID" DataSource = '<%# GetDropDownListDataSource() %>' SelectedIndex='<%# GetDropDownListSelectedIndex(DataBinder.Eval(Container.DataItem, "RoleID")) %>' />
										</EditItemTemplate>
										<FooterTemplate>
											<asp:DropDownList id="ddlRole_Add" runat="server" CssClass="Normal" EnableViewState="True" DataTextField = "RoleName" DataValueField = "RoleID" DataSource = '<%# GetDropDownListDataSource()%>' />
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Active">
										<ItemTemplate>
											<asp:CheckBox ID="chkIsActiveItem" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="False" />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:CheckBox ID="chkIsActive" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="True"/>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:CheckBox ID="chkIsActive_Add" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="True"/>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
												CommandName="delete" AlternateText="Delete this specification" runat="server" CausesValidation="False"
												ID="imgBtnDelete_SubscriptionPlan" />
										</ItemTemplate>
										<FooterTemplate>
											<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif" CommandName="add"
												AlternateText="Add new specification" runat="server" CausesValidation="False" ID="imgBtnAdd_SubscriptionPlan" />
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
								</Columns>
							</asp:datagrid>
							<ul>
								<li>Enter 0 for Listing Period (Days) to make listings never expire.</li>
								<li>Enter 0 for Plan Fee to allow Trial plan.</li>			
							</ul>
							<asp:Label id="lblMessage_SubscriptionPlan" runat="server" CssClass="NormalRed">&nbsp;</asp:Label>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trFeeBasedListingPeriod" Runat="server" Visible="False">
						<asp:TableCell CssClass="Normal">Fee-Based Listing Period (days):</asp:TableCell>
						<asp:TableCell>
							<asp:TextBox ID="txtExpirationDays_FeeBased" CssClass="Normal" Enabled="False" Runat="server" Width="45">180</asp:TextBox>
							<asp:requiredfieldvalidator id="valRequiredExpirationDays_FeeBased" runat="server" ErrorMessage="Required" ControlToValidate="txtExpirationDays_FeeBased" CssClass="NormalRed" Enabled="False" Display="Dynamic"></asp:requiredfieldvalidator>
							<asp:CompareValidator ID="valCompareExpirationDays_FeeBased" Type="Integer" Enabled="False" ControlToValidate="txtExpirationDays_FeeBased" CssClass="NormalRed" ErrorMessage="Must be integer" Operator="DataTypeCheck" Runat="server" Display="Dynamic"></asp:CompareValidator>
							<br />
							<asp:label id="lbxExpirationDays_FeeBased" Runat="server" CssClass="Normal">Note: This will override the Default Expiration Period (days) in the General Settings section.</asp:label>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trRenewalEnable" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">Renewal Enable (per listing):</asp:TableCell>
						<asp:TableCell>
						    <asp:radiobuttonlist id="optRenewalEnable" runat="server" CssClass="Normal" RepeatDirection="Horizontal" AutoPostBack="true">
								<asp:ListItem Value="1">Yes</asp:ListItem>
								<asp:ListItem Value="0">No</asp:ListItem>
							</asp:radiobuttonlist>
						</asp:TableCell>
					</asp:TableRow>
					<asp:TableRow ID="trRenewalOption" Runat="server" Visible="True">
						<asp:TableCell CssClass="Normal">Renewal Option(s):</asp:TableCell>
						<asp:TableCell>
							<asp:datagrid id="dgRenewalOption" runat="server" Visible="True" OnUpdateCommand="dgRenewalOption_Update"
								OnCancelCommand="dgRenewalOption_Cancel" OnEditCommand="dgRenewalOption_Edit" HeaderStyle-CssClass="JediCss_TableHeader"
								AlternatingItemStyle-CssClass="JediCss_dgHeaderAltItem" ItemStyle-CssClass="Normal" Cssclass="Normal"
								AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" Allowsorting="True" PagerStyle-PrevPageText="Prev"
								PagerStyle-NextPageText="Next" PagerStyle-mode="NumericPages" AllowPaging="False" DataKeyField="PlanID"
								ShowFooter="True">
								<Columns>
									<asp:BoundColumn DataField="PlanID" ItemStyle-HorizontalAlign="Center" HeaderText="PlanID" Visible="False"
										ReadOnly="True" />
									<asp:TemplateColumn HeaderText="View<br/>Order">
										<ItemTemplate>
											<asp:Label ID="lblViewOrder" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtViewOrder" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ViewOrder") %>' Runat="server" />
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtViewOrder_Add" Width="35" CssClass="Normal" text="0" Runat="server" EnableViewState="True"></asp:TextBox>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Renewal Option Name" ItemStyle-HorizontalAlign="Left">
										<ItemTemplate>
											<asp:Label ID="lblPlanName" text='<%# DataBinder.Eval(Container.DataItem, "PlanName") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtPlanName" Width="175" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "PlanName") %>' Runat="server" />*
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtPlanName_Add" Width="175" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>*
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Description" ItemStyle-HorizontalAlign="Left">
										<ItemTemplate>
											<asp:Label ID="lblDescription" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtDescription" Width="175" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "Description") %>' Runat="server" />
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtDescription_Add" Width="175" Runat="server" EnableViewState="True" CssClass="Normal"></asp:TextBox>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Renewal Fee<br/>(Per Listing)">
										<ItemTemplate>
											<asp:Label ID="lblFee" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Fee")).ToString("##0.00") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtFee" Width="35" CssClass="Normal" text='<%# DotNetNuke.jb_Uconversion.ConvertDouble(DataBinder.Eval(Container.DataItem, "Fee")).ToString("##0.00") %>' Runat="server" />*
											<asp:regularexpressionvalidator id="valFeeFormat" runat="server" CssClass="Normal" ErrorMessage="#.##" ControlToValidate="txtFee"
												Display="Dynamic" ValidationExpression="^\d+(?:\.\d{0,2})?$" Enabled="True"></asp:regularexpressionvalidator>
										     <asp:CompareValidator id="comp_txtFee" runat="server" CssClass="Normal" Display="Dynamic" ControlToValidate="txtFee" ErrorMessage=">= 0" Type="Currency" Operator="GreaterThanEqual" ValueToCompare="0"></asp:CompareValidator>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtFee_Add" Width="35" CssClass="Normal" Runat="server" EnableViewState="True"></asp:TextBox>*
											<asp:regularexpressionvalidator id="valFeeFormat_Add" runat="server" CssClass="Normal" ErrorMessage="#.##" ControlToValidate="txtFee_Add"
												Display="Dynamic" ValidationExpression="^\d+(?:\.\d{0,2})?$" Enabled="True"></asp:regularexpressionvalidator>
											<asp:CompareValidator id="comp_txtFee_Add" runat="server" CssClass="Normal" Display="Dynamic" ControlToValidate="txtFee_Add" ErrorMessage=">= 0" Type="Currency" Operator="GreaterThanEqual" ValueToCompare="0"></asp:CompareValidator>
										</FooterTemplate>
									</asp:TemplateColumn>	
									<asp:TemplateColumn HeaderText="Listing<br/>Period<br/>(Days)">
										<ItemTemplate>
											<asp:Label ID="lblListingPeriod" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ListingPeriod") %>' Runat="server"/>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox ID="txtListingPeriod" Width="35" CssClass="Normal" text='<%# DataBinder.Eval(Container.DataItem, "ListingPeriod") %>' Runat="server" />*
											<asp:CompareValidator id="comPosInt_txtListingPeriod" runat="server" CssClass="Normal" ControlToValidate="txtListingPeriod"
												ErrorMessage="Int >= 0" Display="Dynamic" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:TextBox id="txtListingPeriod_Add" Width="35" Runat="server" EnableViewState="True" CssClass="Normal">30</asp:TextBox>*
											<asp:CompareValidator id="comPosInt_txtListingPeriod_Add" runat="server" CssClass="Normal" ControlToValidate="txtListingPeriod_Add"
												ErrorMessage="Int >= 0" Display="Dynamic" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"
												Enabled="True"></asp:CompareValidator>
										</FooterTemplate>
									</asp:TemplateColumn>												
									<asp:TemplateColumn HeaderText="Active">
										<ItemTemplate>
											<asp:CheckBox ID="chkIsActiveItem" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="False" />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:CheckBox ID="chkIsActive" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="True"/>
										</EditItemTemplate>
										<FooterTemplate>
											<asp:CheckBox ID="chkIsActive_Add" Checked='<%# DataBinder.Eval(Container.DataItem, "IsActive") %>' Text="" Runat="server" Enabled="True"/>
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/delete_red.gif"
												CommandName="delete" AlternateText="Delete this specification" runat="server" CausesValidation="False"
												ID="imgBtnDelete_RenewalOption" />
										</ItemTemplate>
										<FooterTemplate>
											<asp:ImageButton CssClass="Normal" ImageUrl="~/DesktopModules/PA_JobBoard/images/add.gif"
												CommandName="add" AlternateText="Add new specification" runat="server" CausesValidation="False"
												ID="imgBtnAdd_RenewalOption" />
										</FooterTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
								</Columns>
							</asp:datagrid>
							<ul>								
								<li>Enter 0 for Renewal Fee to allow free renewal. New expiration date will be extended from date of renewal.</li>			
							</ul>
							<asp:Label id="lblMessage_RenewalOption" runat="server" CssClass="NormalRed">&nbsp;</asp:Label>
						</asp:TableCell>
					</asp:TableRow>
				</asp:table>
			</DIV>
		</td>
	</tr>
	<tr id="trSettings_Bottom" runat="server">
		<td align="center">
		    <DIV id="divSettings_Bottom" runat="server">
		        <asp:linkbutton class="CommandButton" id="cmdUpdate" runat="server" Text="Update" BorderStyle="none"></asp:linkbutton>&nbsp; 
			    <asp:linkbutton class="CommandButton" id="cmdCancel" runat="server" Text="Cancel" BorderStyle="none" CausesValidation="False"></asp:linkbutton>
			    <br />
			    <asp:label id="lblLicenseVerification" runat="server" CssClass="Normal">Note: To enable this button, please submit License Verification under the first section.</asp:label>
			    <asp:label id="lblStatus" Runat="server" CssClass="NormalRed"></asp:label>
		    </DIV> 			
		</td>
	</tr>
</table>