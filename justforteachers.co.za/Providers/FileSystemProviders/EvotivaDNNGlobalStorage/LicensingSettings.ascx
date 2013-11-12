<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="LicensingSettings.ascx.cs" 
            Inherits="Evotiva.Providers.DNNGlobalStorage.LicensingSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %> 

<h2 id="evotiva-LicensingSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("LicensingSettings") %></a></h2>
<fieldset>

    <div class="dnnFormItem">
        <dnn:Label ID="lblModuleInfo" runat="server" ControlName="lblModuleInfoMessage" suffix=":" />
        <div class="dnnLeft">
            <asp:Label ID="lblModuleInfoMessage" runat="server" />
        </div>
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="lblContactUs" runat="server" ControlName="lblContactUsMessage" suffix=":" />
        <div class="dnnLeft">
            <asp:Label ID="lblContactUsMessage" runat="server" ResourceKey="lblContactUsMessage" />
        </div>
    </div>	
    <div class="dnnFormItem">
        <dnn:Label ID="lblCurrentDomain" runat="server" ControlName="lblCurrentDomainMessage" suffix=":" />
        <asp:Label ID="lblCurrentDomainMessage" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="lblCurrentDNNInstanceSignature" runat="server" ControlName="lblCurrentDNNInstanceSignatureMessage" suffix=":" />
        <asp:Label ID="lblCurrentDNNInstanceSignatureMessage" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="lblLicenseDetails" runat="server" ControlName="lblLicenseDetailsMessage" suffix=":" />
        <div class="dnnLeft">
            <asp:Label ID="lblLicenseDetailsMessage" runat="server" />
        </div>
    </div>

    <div class="dnnFormItem">
        <dnn:Label ID="lblLicenseStatus" runat="server" ControlName="lblLicenseStatusMessage" suffix=":" />
        <div class="dnnLeft">
            <asp:Panel runat="server" id="pnlLicenseStatusMessage">
                <asp:Label ID="lblLicenseStatusMessage" runat="server" />
            </asp:Panel>
        </div>
    </div>
    <div class="dnnFormItem">
		<div class="dnnLabel" style="position: relative;">    
			<label><span style="visibility: hidden">.</span></label>
		</div>
        <div class="dnnLeft">
            <asp:image ID="imgActivatelicenseOnline" runat="server" IconKey="Activatelicense" />
            <a href="#me" id="cmdActivatelicenseOnline" onclick=" evoShowLicenseOnline() "><%= LocalizeString("cmdActivatelicenseOnline") %></a>
            &nbsp;&nbsp;
            <asp:image ID="imgActivatelicenseOffline" runat="server" IconKey="Activatelicense" />
            <a href="#me" id="cmdActivatelicenseOffline" onclick=" evoShowLicenseOffline() "><%= LocalizeString("cmdActivatelicenseOffline") %></a>
            &nbsp;&nbsp;
            <asp:image ID="imgDeleteCurrentKey" runat="server" IconKey="Delete" />
            <asp:LinkButton ID="cmdDeleteCurrentKey" runat="server" ResourceKey="cmdDeleteCurrentKey" />
        </div>
    </div>


    <div class="dnnFormItem">
		<div class="dnnLabel" style="position: relative;">    
			<label><span style="visibility: hidden">.</span></label>
		</div>
        <div class="dnnLeft">
            <asp:Panel ID="pnlResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblResultsMessage" runat="server" />
            </asp:Panel>
        </div>
    </div>

    <div id="evotivaLicenseOnLineActivation">
        <div class="dnnFormItem">
			<div class="dnnLabel" style="position: relative;">    
				<label><span style="visibility: hidden">.</span></label>
			</div>
            <div class="dnnLeft">
                <h3><%= LocalizeString("LicenseActivationAutomated") %></h3>
                <span><%= LocalizeString("ComingSoon") %></span><br />
                <asp:Image ID="imgCancelOnlineActivation" runat="server" IconKey="Cancel" />
                <a href="#me" id="cmdCancelOnlineActivation" onclick=" evoHideLicenseOnline() ">
                    <%= LocalizeString("cmdCancelActivation") %></a>
            </div>
        </div>        
    </div>

    <div id="evotivaLicenseOffLineActivation">	
        <div class="dnnFormItem">
            <div class="dnnLeft">
                
                            <div id="evotivaOffLineActivationInfo" class="dnnFormMessage dnnFormInfo">
                                <asp:Label ID="lblOfflineActivationDataInfo" runat="server" resourcekey="lblOfflineActivationDataInfo" />
                            </div>
                       
            </div>
        </div>	
        <div class="dnnFormItem">
			<div class="dnnLabel" style="position: relative;">    
				<label><span style="visibility: hidden">.</span></label>
			</div>
            <div class="dnnLeft">
			<table>
					<tr>
                        <td colspan="3">
						<h3><%= LocalizeString("LicenseActivationManual") %></h3>
						   </td>
                    </tr>	
					<tr>
                        <td colspan="3">
							<asp:TextBox ID="txtOfflineActivationData" runat="server" TextMode="MultiLine"
                             Enabled="true" ReadOnly="true" Rows="10" Style="Width:350px;" />						
                        </td>
                    </tr>						
                    <tr>
                        <td colspan="3">
                            <asp:TextBox ID="txtKey" runat="server" TextMode="MultiLine"
                                         Enabled="true" ReadOnly="false" Rows="5" Style="Width:350px;" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:FileUpload ID="uploadFile" runat="server" Width="100%" EnableViewState="True" Visible="false" />
                        </td>
                        <td>
                            <asp:Image ID="imgUpload" runat="server" IconKey="UploadFile" />
                            <asp:LinkButton ID="cmdUpload" resourcekey="cmdUpdate" runat="server" />
                        &nbsp;&nbsp;
                            <asp:Image ID="imgCancelOfflineActivation" runat="server" IconKey="Cancel" />
                            <a href="#me" id="cmdCancelOfflineActivation" onclick=" evoHideLicenseOffline() ">
                                <%= LocalizeString("cmdCancelActivation") %></a>
								</td>
                        <td>
                        </td>
                    </tr>
                </table>
			</div>
		</div>        
    </div>

</fieldset>