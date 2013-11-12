<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.WindowsAzureSettings"
            CodeBehind="WindowsAzureSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaAzureSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlAzureSettings" runat="server">

        <h2 id="evotivaAzure-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("AzureBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowAzureInfo" runat="server" ControlName="lnkShowAzureInfo" suffix=":" />
                <a href="#me" id="lnkShowAzureInfo" onclick=" evoShowAzureInfo() "><%= LocalizeString("ShowAzureInfo") %></a>
                <div id="evotivaAzureInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblAzureInfo" runat="server" ResourceKey="lblAzureInfo" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAzureAccountName" runat="server" ControlName="txtAzureAccountName" suffix=":" />
                <asp:TextBox ID="txtAzureAccountName" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="300" />
                <asp:RequiredFieldValidator ID="valAzureAccountName" runat="server" ControlToValidate="txtAzureAccountName"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valAzureAccountName.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAzureAccessKey" runat="server" ControlName="txtAzureAccessKey" suffix=":" />
                <asp:TextBox ID="txtAzureAccessKey" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="300" Width="400px" TextMode="Password" />
                <asp:RequiredFieldValidator ID="valAzureAccessKey" runat="server" ControlToValidate="txtAzureAccessKey"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valAzureAccessKey.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblAzureUseDevelopmentStorage" runat="server" ControlName="chkAzureUseDevelopmentStorage" suffix="?" />
                <asp:checkbox id="chkAzureUseDevelopmentStorage" runat="server" AutoPostBack="true" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAzureContainerName" runat="server" ControlName="ddlAzureContainerName" suffix=":" />        
                <asp:DropDownList ID="ddlAzureContainerName" runat="server" AutoPostBack="false" CssClass="dnnFormRequired" Width="250px" />
                <asp:RequiredFieldValidator ID="valddlAzureContainerName" runat="server" ControlToValidate="ddlAzureContainerName"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valAzureContainerName.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator> 
            </div>

            <div class="dnnFormItem">
                <div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
				<div class="dnnLeft">
                <asp:image ID="imgRefreshContainers" runat="server" IconKey="Refresh" />
                <asp:LinkButton ID="cmdRefreshContainers" runat="server" ResourceKey="cmdRefreshContainers" CausesValidation="false" />
                &nbsp;&nbsp;
                <asp:image ID="imgAddContainers" runat="server" IconKey="Add" />
                <a href="#me" id="lnkShowNewContainerForm" onclick=" evoShowNewContainerForm() "><%= LocalizeString("cmdNewContainer") %></a>
				</div>
            </div>
            <div id="evotivaAzureNewContainer" class="dnnFormItem">
                <div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
                    <table>
                        <tr>
                            <td><dnn:Label ID="lblNewContainerName" runat="server" ControlName="txtAzureContainerName" suffix=":" /></td>
                            <td><asp:TextBox ID="txtAzureContainerName" runat="server"  CssClass="dnnFormRequired" Columns="40" MaxLength="65" />
                                <asp:RegularExpressionValidator ID="valAzureContainerName"  runat="server" CssClass="dnnFormMessage dnnFormError" 
                                                                ResourceKey="valAzureContainerNameInvalid.ErrorMessage" 
                                                                ControlToValidate="txtAzureContainerName" Display="Dynamic" 
                                                                ValidationExpression="^(([a-z\d]((-(?=[a-z\d]))|([a-z\d])){2,62})|(\$root))$">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
           
                        <tr>
                            <td><dnn:Label ID="lblAzureContainerAccessibility" runat="server" ControlName="ddlUrlStyle" suffix=":" /></td>
                            <td style="white-space: nowrap"><asp:RadioButtonList ID="rbAzureContainerAccessibility" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table">
                                                                <asp:listitem value="Off" resourcekey="AccessPrivate" Selected="True"></asp:listitem>
                                                                <asp:listitem value="Blob" resourcekey="AccessPublicBlob"></asp:listitem>
                                                                <asp:listitem value="Container" resourcekey="AccessPublicContainer"></asp:listitem>	
                                                            </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="text-align: center;" >
                                    <asp:LinkButton ID="cmdSaveNewContainer"  runat="server"  ResourceKey="cmdSaveContainer" OnClientClick=" evoHideNewContainerForm() " CssClass="dnnSecondaryAction" CausesValidation="True" />
                                    <a href="#me" id="cmdCancelNewContainer" onclick=" evoHideNewContainerForm() "><%= LocalizeString("cmdCancelNewContainer") %></a>
                                </div>
                            </td>
                        </tr>
                    </table>   
                </div>
            </div>
			<div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblAzureTestResults" runat="server" />
            </asp:Panel>
			</div>
        </fieldset>

        <h2 id="evotivaAzure-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("AzureAdvancedSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAzureUseSSL" runat="server" ControlName="chkAzureUseSSL" suffix="?" />
                <asp:checkbox id="chkAzureUseSSL" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblUrlExpireMinutes" runat="server" ControlName="txtUrlExpireMinutes" suffix=":" />
                <asp:TextBox ID="txtUrlExpireMinutes" runat="server"  CssClass="dnnFormRequired" Columns="4" MaxLength="4" />
                <asp:RequiredFieldValidator ID="valUrlExpireMinutesRequired" runat="server" ControlToValidate="txtUrlExpireMinutes"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valUrlExpireMinutesRequired.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="valUrlExpireMinutesValue" CssClass="dnnFormMessage dnnFormError" runat="server"
                                      ControlToValidate="txtUrlExpireMinutes" Display="Dynamic" ResourceKey="valUrlExpireMinutesValue.ErrorMessage"
                                      Operator="DataTypeCheck" Type="Integer" ValidationGroup="vgEditFolderMapping" />
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblHideFilesLocation" runat="server" ControlName="chkHideFilesLocation" suffix="?" />
                <asp:checkbox id="chkHideFilesLocation" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAzureCustomDomainName" runat="server" ControlName="txtAzureCustomDomainName" suffix=":" />
                <asp:TextBox ID="txtAzureCustomDomainName" runat="server" Columns="50" MaxLength="300" />
                <asp:RegularExpressionValidator ID="valAzureCustomDomainName" CssClass="dnnFormMessage dnnFormError" runat="server" 
                                                ControlToValidate="txtAzureCustomDomainName" Display="Dynamic" ResourceKey="valAzureCustomDomainName.ErrorMessage" 
                                                ValidationExpression="^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$">                                  
                </asp:RegularExpressionValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblRootFolder" runat="server" ControlName="txtRootFolder" suffix=":" />
                <asp:TextBox ID="txtRootFolder" runat="server" Columns="50" MaxLength="200" />
            </div>
    
        </fieldset>

    </asp:Panel>

    <evotiva:LicensingUI runat="server" ID="ctlLicensingUI" />

</div>