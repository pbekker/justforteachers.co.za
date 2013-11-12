<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.GoogleDriveSettings"
            CodeBehind="GoogleDriveSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaGoogleDriveSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlGoogleDriveSettings" runat="server">

        <h2 id="evotivaGoogleDrive-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("GoogleDriveBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowGoogleDriveInfo" runat="server" ControlName="lnkShowGoogleDriveInfo" suffix=":" />
                <a href="#me" id="lnkShowGoogleDriveInfo" onclick=" evoShowGoogleDriveInfo() "><%= LocalizeString("ShowGoogleDriveInfo") %></a>
                <div id="evotivaGoogleDriveInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblGoogleDriveInfo" runat="server" ResourceKey="lblGoogleDriveInfo" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblGoogleDriveClientId" runat="server" ControlName="txtGoogleDriveClientId" suffix=":" />
                <asp:TextBox ID="txtGoogleDriveClientId" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" />
                <asp:RequiredFieldValidator ID="valGoogleDriveClientId" runat="server" ControlToValidate="txtGoogleDriveClientId"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valGoogleDriveClientId.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblGoogleDriveClientSecret" runat="server" ControlName="txtGoogleDriveClientSecret" suffix=":" />
                <asp:TextBox ID="txtGoogleDriveClientSecret" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" Width="400px" TextMode="Password" />
                <asp:RequiredFieldValidator ID="valGoogleDriveClientSecret" runat="server" ControlToValidate="txtGoogleDriveClientSecret"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valGoogleDriveClientSecret.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>
            
            <div class="dnnFormItem" runat="server" id="divGoogleDriveAuthorizationCode">
                <dnn:Label ID="lblGoogleDriveAuthorizationCode" runat="server" ControlName="txtGoogleDriveAuthorizationCode" suffix=":" />
                <asp:TextBox ID="txtGoogleDriveAuthorizationCode" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="500" Width="400px" />
               <%-- <asp:RequiredFieldValidator ID="valGoogleDriveAuthorizationCode" runat="server" ControlToValidate="txtGoogleDriveAuthorizationCode"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valGoogleDriveAuthorizationCode.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>--%>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblGoogleDriveConnectionStatus" runat="server" ControlName="lblConnectionStatus" suffix=":" />
                <div class="dnnLeft">
                    <asp:Panel runat="server" id="pnlConnectionStatus">
                        <asp:Label ID="lblConnectionStatus" runat="server" />
                    </asp:Panel>
                </div>        
            </div>

            <div class="dnnFormItem">
                <div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
				<div class="dnnLeft">
                <asp:image ID="imgRequestConnection" runat="server" IconKey="ModuleBind" />         
                <asp:LinkButton ID="cmdRequestConnection" runat="server" ResourceKey="cmdRequestConnection" CausesValidation="true" />
                &nbsp;&nbsp;
                <asp:image ID="imgEstablishConnection" runat="server" IconKey="Licensemanagement" />
                <asp:LinkButton ID="cmdEstablishConnection" runat="server" ResourceKey="cmdEstablishConnection" CausesValidation="true" />
                &nbsp;&nbsp;
                <asp:image ID="imgClearConnection" runat="server" IconKey="ActionDelete" />
                <asp:LinkButton ID="cmdClearConnection" runat="server" ResourceKey="cmdClearConnection" CausesValidation="true" />
				</div>
            </div>
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblGoogleDriveTestResults" runat="server" />
                <asp:Label  ID="lblAuthorizationToken" runat="server" Visible="false"/>
            </asp:Panel>
        </fieldset>

        <h2 id="evotivaGoogleDrive-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("GoogleDriveAdvancedSettings") %></a></h2>
        <fieldset>

            <div class="dnnFormItem">
                <dnn:Label ID="lblRootFolder" runat="server" ControlName="txtRootFolder" suffix=":" />
                <asp:TextBox ID="txtRootFolder" runat="server" Columns="50" MaxLength="200" />
            </div>
         
            <div class="dnnFormItem">
                <dnn:Label ID="lblEnablePublicUrls" runat="server" ControlName="chkEnablePublicUrls" suffix="?" />
                <asp:checkbox id="chkEnablePublicUrls" runat="server" />
            </div>   
            
            <div class="dnnFormItem">
                <dnn:Label ID="lblGoogleDriveIncludeSubscribed" runat="server" ControlName="chkGoogleDriveIncludeSubscribed" suffix="?" />
                <asp:checkbox id="chkGoogleDriveIncludeSubscribed" runat="server" />
            </div>  
			
			<div class="dnnFormItem">
                <dnn:Label ID="lblGoogleDriveKeepRevisions" runat="server" ControlName="chkGoogleDriveKeepRevisions" suffix="?" />
                <asp:checkbox id="chkGoogleDriveKeepRevisions" runat="server" />
            </div>  
			
			<div class="dnnFormItem">
                <dnn:Label ID="lblGoogleDriveDeleteToTrash" runat="server" ControlName="chkGoogleDriveDeleteToTrash" suffix="?" />
                <asp:checkbox id="chkGoogleDriveDeleteToTrash" runat="server" />
            </div>  
            
            <div class="dnnFormItem">
                <dnn:Label ID="lblGoogleDrivePreferredExportFormats" runat="server" ControlName="txtGoogleoogleDrivePreferredExportFormats" suffix=":" />
                <asp:TextBox ID="txtGoogleDrivePreferredExportFormats" runat="server" Rows="4" Columns="50"  TextMode="MultiLine"  MaxLength="500" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblHideFilesLocation" runat="server" ControlName="chkHideFilesLocation" suffix="?" />
                <asp:checkbox id="chkHideFilesLocation" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>
            
            <div class="dnnFormItem" runat="server" id="divClearDataCache">
	            <dnn:Label ID="lblClearDataCache" runat="server" ControlName="cmdClearDataCache" suffix=":" />
                <asp:LinkButton runat="server" ID="cmdClearDataCache" ResourceKey="cmdClearDataCache" CausesValidation="false"></asp:LinkButton>
            </div>

        </fieldset>

    </asp:Panel>

    <evotiva:LicensingUI runat="server" ID="ctlLicensingUI" />

</div>