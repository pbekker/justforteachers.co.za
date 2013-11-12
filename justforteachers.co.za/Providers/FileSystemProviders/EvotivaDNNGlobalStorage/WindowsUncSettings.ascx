<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.WindowsUncSettings"
            CodeBehind="WindowsUncSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaUNCSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlUNCSettings" runat="server">

        <h2 id="evotivaUNC-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("UNCBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowInfo" runat="server" ControlName="lnkShowInfo" suffix=":" />
                <a href="#me" id="lnkShowInfo" onclick=" evoShowUNCInfo() "><%= LocalizeString("ShowInfo") %></a>
                <div id="evotivaUNCInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblUNCInfo" runat="server" ResourceKey="lblUNCInfo" />
                </div>
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblIdentity" runat="server" ControlName="lblIdentityInfo" suffix=":" />
                <asp:Label ID="lblIdentityInfo" runat="server" />
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
                <asp:image ID="imgTestUNCConnection" runat="server" IconKey="Refresh" />
                <asp:LinkButton ID="cmdTestUNCConnection" runat="server" ResourceKey="cmdTestUNCConnection" CausesValidation="true" />
				</div>
            </div>
			<div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblUNCTestResults" runat="server" />
            </asp:Panel>
			</div>
        </fieldset>

        <h2 id="evotivaUNC-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("UNCAdvancedSettings") %></a></h2>
        <fieldset>        

            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>
        
            <div class="dnnFormItem">
                <dnn:Label ID="lblFileMask" runat="server" ControlName="txtFileMask" suffix=":" />
                <asp:TextBox ID="txtFileMask" runat="server" Columns="50" MaxLength="100" />
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblHttpPrefix" runat="server" ControlName="txtHttpPrefix" suffix=":" />
                <asp:TextBox ID="txtHttpPrefix" runat="server" Columns="50" MaxLength="300" />
            </div>

        </fieldset>

    </asp:Panel>

    <evotiva:LicensingUI runat="server" ID="ctlLicensingUI" />

</div>