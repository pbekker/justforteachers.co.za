<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.BoxNetSettings"
            CodeBehind="BoxNetSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaBoxNetSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlBoxNetSettings" runat="server">

        <h2 id="evotivaBoxNet-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("BoxNetBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowBoxNetInfo" runat="server" ControlName="lnkShowBoxNetInfo" suffix=":" />
                <a href="#me" id="lnkShowBoxNetInfo" onclick=" evoShowBoxNetInfo() "><%= LocalizeString("ShowBoxNetInfo") %></a>
                <div id="evotivaBoxNetInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblBoxNetInfo" runat="server" ResourceKey="lblBoxNetInfo" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblBoxNetApplicationAPIKey" runat="server" ControlName="txtBoxNetApplicationAPIKey" suffix=":" />
                <asp:TextBox ID="txtBoxNetApplicationAPIKey" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" />
                <asp:RequiredFieldValidator ID="valBoxNetApplicationAPIKey" runat="server" ControlToValidate="txtBoxNetApplicationAPIKey"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valBoxNetApplicationAPIKey.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>        
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblBoxNetConnectionStatus" runat="server" ControlName="lblConnectionStatus" suffix=":" />
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
			<div class="dnnFormItem">
                <div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
				<div class="dnnLeft">
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblBoxNetTestResults" runat="server" />
                <asp:Label runat="server" ID="lblBoxNetAuthorizationToken" Visible="false" />
            </asp:Panel>
			</div>
        </fieldset>

        <h2 id="evotivaBoxNet-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("BoxNetAdvancedSettings") %></a></h2>
        <fieldset>

            <div class="dnnFormItem">
                <dnn:Label ID="lblRootFolder" runat="server" ControlName="txtRootFolder" suffix=":" />
                <asp:TextBox ID="txtRootFolder" runat="server" Columns="50" MaxLength="200" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblBoxNetOptimizeForLargeCatalogs" runat="server" ControlName="chkBoxNetOptimizeForLargeCatalogs" suffix="?" />
                <asp:checkbox ID="chkBoxNetOptimizeForLargeCatalogs" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblBoxNetCatalogCacheMinutes" runat="server" ControlName="dllBoxNetCatalogCacheMinutes" suffix=":" />
                <asp:DropDownList ID="ddlBoxNetCatalogCacheMinutes" runat="server">
                    <asp:ListItem Text="0" Value="0" />
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="10" Value="10" />
                    <asp:ListItem Text="15" Value="15" />
                    <asp:ListItem Text="30" Value="30" />
                    <asp:ListItem Text="60" Value="60" />
                </asp:DropDownList>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>

        </fieldset>

    </asp:Panel>
    <evotiva:LicensingUI runat="server" ID="ctlLicensingUI" />
</div>