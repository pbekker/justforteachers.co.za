<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.DropBoxSettings"
            CodeBehind="DropBoxSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaDropBoxSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlDropBoxSettings" runat="server">

        <h2 id="evotivaDropBox-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("DropBoxBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowDropBoxInfo" runat="server" ControlName="lnkShowDropBoxInfo" suffix=":" />
                <a href="#me" id="lnkShowDropBoxInfo" onclick=" evoShowDropBoxInfo() "><%= LocalizeString("ShowDropBoxInfo") %></a>
                <div id="evotivaDropBoxInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblDropBoxInfo" runat="server" ResourceKey="lblDropBoxInfo" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblDropBoxAppKey" runat="server" ControlName="txtDropBoxAppKey" suffix=":" />
                <asp:TextBox ID="txtDropBoxAppKey" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" />
                <asp:RequiredFieldValidator ID="valDropBoxAppKey" runat="server" ControlToValidate="txtDropBoxAppKey"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valDropBoxAppKey.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblDropBoxAppSecret" runat="server" ControlName="txtDropBoxAppSecret" suffix=":" />
                <asp:TextBox ID="txtDropBoxAppSecret" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" Width="400px" TextMode="Password" />
                <asp:RequiredFieldValidator ID="valDropBoxAppSecret" runat="server" ControlToValidate="txtDropBoxAppSecret"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valDropBoxAppSecret.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblDropBoxConnectionStatus" runat="server" ControlName="lblConnectionStatus" suffix=":" />
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
			<div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
				<div class="dnnLeft">
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblDropBoxTestResults" runat="server" />
                <asp:Label  ID="lblSecurityToken" runat="server" Visible="false"/>
            </asp:Panel>
				</div>
        </fieldset>

        <h2 id="evotivaDropBox-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("DropBoxAdvancedSettings") %></a></h2>
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