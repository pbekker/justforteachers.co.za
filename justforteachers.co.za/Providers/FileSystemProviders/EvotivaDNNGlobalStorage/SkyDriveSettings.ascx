<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.SkyDriveSettings"
            CodeBehind="SkyDriveSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaSkyDriveSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlSkyDriveSettings" runat="server">

        <h2 id="evotivaSkyDrive-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("SkyDriveBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowSkyDriveInfo" runat="server" ControlName="lnkShowSkyDriveInfo" suffix=":" />
                <a href="#me" id="lnkShowSkyDriveInfo" onclick=" evoShowSkyDriveInfo() "><%= LocalizeString("ShowSkyDriveInfo") %></a>
                <div id="evotivaSkyDriveInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblSkyDriveInfo" runat="server" ResourceKey="lblSkyDriveInfo" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblSkyDriveClientId" runat="server" ControlName="txtSkyDriveClientId" suffix=":" />
                <asp:TextBox ID="txtSkyDriveClientId" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" />
                <asp:RequiredFieldValidator ID="valSkyDriveClientId" runat="server" ControlToValidate="txtSkyDriveClientId"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valSkyDriveClientId.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblSkyDriveClientSecret" runat="server" ControlName="txtSkyDriveClientSecret" suffix=":" />
                <asp:TextBox ID="txtSkyDriveClientSecret" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" Width="400px" TextMode="Password" />
                <asp:RequiredFieldValidator ID="valSkyDriveClientSecret" runat="server" ControlToValidate="txtSkyDriveClientSecret"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valSkyDriveClientSecret.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>
            
            <div class="dnnFormItem" runat="server" id="divSkyDriveAuthorizationCode">
                <dnn:Label ID="lblSkyDriveAuthorizationCode" runat="server" ControlName="txtSkyDriveAuthorizationCode" suffix=":" />
                <asp:TextBox ID="txtSkyDriveAuthorizationCode" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="500" Width="400px" />
               <%-- <asp:RequiredFieldValidator ID="valSkyDriveAuthorizationCode" runat="server" ControlToValidate="txtSkyDriveAuthorizationCode"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valSkyDriveAuthorizationCode.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>--%>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblSkyDriveConnectionStatus" runat="server" ControlName="lblConnectionStatus" suffix=":" />
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
                <asp:Label ID="lblSkyDriveTestResults" runat="server" />
                <asp:Label  ID="lblRefreshToken" runat="server" Visible="false"/>
            </asp:Panel>
        </fieldset>

        <h2 id="evotivaSkyDrive-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("SkyDriveAdvancedSettings") %></a></h2>
        <fieldset>

            <div class="dnnFormItem">
                <dnn:Label ID="lblRootFolder" runat="server" ControlName="txtRootFolder" suffix=":" />
                <asp:TextBox ID="txtRootFolder" runat="server" Columns="50" MaxLength="200" />
            </div>
         
            <div class="dnnFormItem">
                <dnn:Label ID="lblEnableTempUrls" runat="server" ControlName="chkEnableTempUrls" suffix="?" />
                <asp:checkbox id="chkEnableTempUrls" runat="server" />
            </div>                         

            <div class="dnnFormItem">
                <dnn:Label ID="lblHideFilesLocation" runat="server" ControlName="chkHideFilesLocation" suffix="?" />
                <asp:checkbox id="chkHideFilesLocation" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>

        </fieldset>

    </asp:Panel>

    <evotiva:LicensingUI runat="server" ID="ctlLicensingUI" />

</div>