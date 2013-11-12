<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.FtpSettings"
            CodeBehind="FtpSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaFtpSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlFtpSettings" runat="server">

        <h2 id="evotivaFtp-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("FtpBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowInfo" runat="server" ControlName="lnkShowInfo" suffix=":" />
                <a href="#me" id="lnkShowInfo" onclick=" evoShowFtpInfo() "><%= LocalizeString("ShowInfo") %></a>
                <div id="evotivaFtpInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblFtpInfo" runat="server" ResourceKey="lblFtpInfo" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblFtpServer" runat="server" ControlName="txtFtpServer" suffix=":" />
                <asp:TextBox ID="txtFtpServer" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="300" />
                <asp:RequiredFieldValidator ID="valFtpServer" runat="server" ControlToValidate="txtFtpServer"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valFtpServer.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAnonymousAccess" runat="server" ControlName="chkAnonymousAccess" suffix="?" />
                <asp:checkbox id="chkAnonymousAccess" runat="server" AutoPostBack="true" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblFtpUser" runat="server" ControlName="txtFtpUser" suffix=":" />
                <asp:TextBox ID="txtFtpUser" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="300" />
                <asp:RequiredFieldValidator ID="valFtpUser" runat="server" ControlToValidate="txtFtpUser"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valFtpUser.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblFtpPassword" runat="server" ControlName="txtFtpPassword" suffix=":" />
                <asp:TextBox ID="txtFtpPassword" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="300" Width="400px" TextMode="Password" />
                <asp:RequiredFieldValidator ID="valFtpPassword" runat="server" ControlToValidate="txtFtpPassword"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valFtpPassword.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblRootFolder" runat="server" ControlName="txtRootFolder" suffix=":" />
                <asp:TextBox ID="txtRootFolder" runat="server" Columns="50" MaxLength="200" />
            </div>

            <div class="dnnFormItem">
				<div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
                <asp:image ID="imgTestFtpConnection" runat="server" IconKey="Refresh" />
                <asp:LinkButton ID="cmdTestFtpConnection" runat="server" ResourceKey="cmdTestFtpConnection" CausesValidation="true" />
				</div>
            </div>
			<div class="dnnFormItem">
			<div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblFtpTestResults" runat="server" />
            </asp:Panel>
			</div>
			 </div>
        </fieldset>

        <h2 id="evotivaFtp-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("FtpAdvancedSettings") %></a></h2>
        <fieldset>
        
            <div class="dnnFormItem">
                <dnn:Label ID="lblFtpServerPort" runat="server" ControlName="txtFtpServerPort" suffix=":" />
                <asp:TextBox ID="txtFtpServerPort" runat="server"  CssClass="dnnFormRequired" Columns="5" MaxLength="10" />
                <asp:RequiredFieldValidator ID="valFtpServerPort" runat="server" ControlToValidate="txtFtpServerPort"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valFtpServerPortRequired.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="valFtpServerPortValue" CssClass="dnnFormMessage dnnFormError" runat="server"
                                      ControlToValidate="txtFtpServerPort" Display="Dynamic" ResourceKey="valFtpServerPortValue.ErrorMessage"
                                      Operator="DataTypeCheck" Type="Integer" ValidationGroup="vgEditFolderMapping" />
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblFtpUsePassiveMode" runat="server" ControlName="chkFtpUsePassiveMode" suffix="?" />
                <asp:checkbox id="chkFtpUsePassiveMode" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblIncludeCredentialsInUrl" runat="server" ControlName="chkIncludeCredentialsInUrl" suffix="?" />
                <asp:checkbox id="chkIncludeCredentialsInUrl" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblHideFilesLocation" runat="server" ControlName="chkHideFilesLocation" suffix="?" />
                <asp:checkbox id="chkHideFilesLocation" runat="server" />
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblHttpPrefix" runat="server" ControlName="txtHttpPrefix" suffix=":" />
                <asp:TextBox ID="txtHttpPrefix" runat="server" Columns="50" MaxLength="300" />
            </div>

        </fieldset>

    </asp:Panel>

    <evotiva:LicensingUI runat="server" ID="ctlLicensingUI" />

</div>