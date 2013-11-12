<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.CloudFilesSettings"
            CodeBehind="CloudFilesSettings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaCloudFilesSettings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlCloudFilesSettings" runat="server">

        <h2 id="evotivaCloudFiles-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("CloudFilesBasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowCloudFilesInfo" runat="server" ControlName="lnkShowCloudFilesInfo" suffix=":" />
                <a href="#me" id="lnkShowCloudFilesInfo" onclick=" evoShowCloudFilesInfo() "><%= LocalizeString("ShowCloudFilesInfo") %></a>
                <div id="evotivaCloudFilesInfo" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblCloudFilesInfo" runat="server" ResourceKey="lblCloudFilesInfo" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblCloudFilesUserName" runat="server" ControlName="txtCloudFilesUserName" suffix=":" />
                <asp:TextBox ID="txtCloudFilesUserName" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" />
                <asp:RequiredFieldValidator ID="valCloudFilesUserName" runat="server" ControlToValidate="txtCloudFilesUserName"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valCloudFilesUserName.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblCloudFilesApiAccessKey" runat="server" ControlName="txtCloudFilesApiAccessKey" suffix=":" />
                <asp:TextBox ID="txtCloudFilesApiAccessKey" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" Width="400px" TextMode="Password" />
                <asp:RequiredFieldValidator ID="valCloudFilesApiAccessKey" runat="server" ControlToValidate="txtCloudFilesApiAccessKey"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valCloudFilesApiAccessKey.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>
            
            <div class="dnnFormItem">
                <dnn:Label ID="lblCloudFilesAccountLocation" runat="server" ControlName="ddlCloudFilesAccountLocation" suffix=":" />
                <asp:DropDownList ID="ddlCloudFilesAccountLocation" runat="server" AutoPostBack="false" CssClass="dnnFormRequired" Width="100px">
                        <asp:listitem value="US">US</asp:listitem>
                        <asp:listitem value="UK">UK</asp:listitem>
                </asp:DropDownList>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblCloudFilesContainerName" runat="server" ControlName="ddlCloudFilesContainerName" suffix=":" />        
                <asp:DropDownList ID="ddlCloudFilesContainerName" runat="server" AutoPostBack="false" CssClass="dnnFormRequired" Width="250px" />
                <asp:RequiredFieldValidator ID="valCloudFilesContainerName" runat="server" ControlToValidate="ddlCloudFilesContainerName"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valCloudFilesContainerName.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator> 
            </div>

            <div class="dnnFormItem">
                <div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
				<div class="dnnLeft">
                <asp:image ID="imgRefreshBuckets" runat="server" IconKey="Refresh" />
                <asp:LinkButton ID="cmdRefreshBuckets" runat="server" ResourceKey="cmdRefreshBuckets" CausesValidation="false" />
                &nbsp;&nbsp;
                <asp:image ID="imgAddBucket" runat="server" IconKey="Add" />
                <a href="#me" id="lnkShowNewBucketForm" onclick=" evoShowNewBucketForm() "><%= LocalizeString("cmdNewBucket") %></a>
				</div>
            </div>
            <div id="evotivaCloudFilesNewBucket" class="dnnFormItem">
                <div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
                    <table>
                        <%--            <tr>
                <td colspan="2">
                    <asp:Label runat="server" ID="lblNewContainerHead" ResourceKey="lblNewContainerHead" />
                </td>
            </tr>
--%>            <tr>
                                                                                                                                                                                                                                                           <td><dnn:Label ID="lblNewContainerName" runat="server" ControlName="txtCloudFilesContainerName" suffix=":" /></td>
                                                                                                                                                                                                                                                           <td><asp:TextBox ID="txtCloudFilesContainerName" runat="server"  CssClass="dnnFormRequired" Columns="40" MaxLength="250" /></td>
                                                                                                                                                                                                                                                       </tr>
                        <tr>
                            <td><dnn:Label ID="lblIsPublicContainer" runat="server" ControlName="chkIsPublicContainer" suffix=":" /></td>
                            <td><asp:checkbox id="chkIsPublicContainer" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="text-align: center;" >
                                    <asp:LinkButton ID="cmdSaveNewBucket"  runat="server"  ResourceKey="cmdSaveBucket" OnClientClick=" evoHideNewBucketForm() " CssClass="dnnSecondaryAction" CausesValidation="True" />
                                    <a href="#me" id="cmdCancelNewBucket" onclick=" evoHideNewBucketForm() "><%= LocalizeString("cmdCancelNewBucket") %></a>
                                </div>
                            </td>
                        </tr>
                    </table>  
                </div>
            </div>
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblCloudFilesTestResults" runat="server" />
            </asp:Panel>
        </fieldset>

        <h2 id="evotivaCloudFiles-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("CloudFilesAdvancedSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem" runat="server" id="divUseSSL">
                <dnn:Label ID="lblUseSSL" runat="server" ControlName="chkUseSSL" suffix="?" />
                <asp:checkbox id="chkUseSSL" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblHideFilesLocation" runat="server" ControlName="chkHideFilesLocation" suffix="?" />
                <asp:checkbox id="chkHideFilesLocation" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblRootFolder" runat="server" ControlName="txtRootFolder" suffix=":" />
                <asp:TextBox ID="txtRootFolder" runat="server" Columns="50" MaxLength="200" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblLocalRootFolder" runat="server" ControlName="txtLocalRootFolder" suffix=":" />
                <asp:TextBox ID="txtLocalRootFolder" runat="server" Columns="50" MaxLength="200" />
            </div>
        
        </fieldset>

    </asp:Panel>

    <evotiva:LicensingUI runat="server" ID="ctlLicensingUI" />

</div>