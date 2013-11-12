<%@ Control Language="C#" AutoEventWireup="false" Inherits="Evotiva.Providers.DNNGlobalStorage.AmazonS3Settings"
            CodeBehind="AmazonS3Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="evotiva" TagName="LicensingUI" Src="LicensingSettings.ascx" %>

<div class="dnnForm dnnClear" id="evotivaAmazonS3Settings">

    <asp:Panel ID="pnlTopMessage" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
        <asp:Label ID="lblTopMessage" runat="server" />
    </asp:Panel>

    <asp:Panel ID="pnlS3Settings" runat="server">

        <h2 id="evotivaAmazonS3-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%= LocalizeString("AmazonS3BasicSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblShowAmazonS3Info" runat="server" ControlName="lnkShowAmazonS3Info" suffix=":" />
                <a href="#me" id="lnkShowAmazonS3Info" onclick=" evoShowAmazonS3Info() "><%= LocalizeString("ShowAmazonS3Info") %></a>
                <div id="evotivaAmazonS3Info" class="dnnFormMessage dnnFormInfo">
                    <asp:Label ID="lblAmazonS3Info" runat="server" ResourceKey="lblAmazonS3Info" />
                </div>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAmazonAccessKeyID" runat="server" ControlName="txtAmazonAccessKeyID" suffix=":" />
                <asp:TextBox ID="txtAmazonAccessKeyID" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" />
                <asp:RequiredFieldValidator ID="valAmazonAccessKeyID" runat="server" ControlToValidate="txtAmazonAccessKeyID"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valAmazonAccessKeyID.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAmazonSecretAccessKey" runat="server" ControlName="txtAmazonSecretAccessKey" suffix=":" />
                <asp:TextBox ID="txtAmazonSecretAccessKey" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" Width="400px" TextMode="Password" />
                <asp:RequiredFieldValidator ID="valAmazonSecretAccessKey" runat="server" ControlToValidate="txtAmazonSecretAccessKey"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valAmazonSecretAccessKey.ErrorMessage"
                                            ValidationGroup="vgEditFolderMapping"></asp:RequiredFieldValidator>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAmazonBucketName" runat="server" ControlName="ddlAmazonBucketName" suffix=":" />        
                <asp:DropDownList ID="ddlAmazonBucketName" runat="server" AutoPostBack="false" CssClass="dnnFormRequired" Width="250px" />
                <asp:TextBox ID="txtAmazonBucketNameAlt" runat="server"  CssClass="dnnFormRequired" Columns="50" MaxLength="200" Visible="false" />
                <asp:RequiredFieldValidator ID="valAmazonBucketName" runat="server" ControlToValidate="ddlAmazonBucketName"
                                            Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ResourceKey="valAmazonBucketName.ErrorMessage"
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
            <div id="evotivaAmazonS3NewBucket" class="dnnFormItem">
                <div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
                    <asp:TextBox ID="txtAmazonBucketName" runat="server"  CssClass="dnnFormRequired" Columns="40" MaxLength="250" />
                    <br />
                    <asp:LinkButton ID="cmdSaveNewBucket"  runat="server"  ResourceKey="cmdSaveBucket" OnClientClick=" evoHideNewBucketForm() " CssClass="dnnSecondaryAction" CausesValidation="True" />
                    <a href="#me" id="cmdCancelNewBucket" onclick=" evoHideNewBucketForm() "><%= LocalizeString("cmdCancelNewBucket") %></a>
                </div>
            </div>
			<div class="dnnLabel" style="position: relative;">    
					<label><span style="visibility: hidden">.</span></label>
				</div>
                <div class="dnnLeft">
            <asp:Panel ID="pnlTestResults" runat="server" Visible="false" CssClass="dnnFormMessage dnnFormValidationSummary">
                <asp:Label ID="lblAmazonS3TestResults" runat="server" />
            </asp:Panel>
			</div>
        </fieldset>

        <h2 id="evotivaAmazonS3-AdvancedSettings" class="dnnFormSectionHead"><a href=""><%= LocalizeString("AmazonS3AdvancedSettings") %></a></h2>
        <fieldset>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblEnforceReadOnlyAccess" runat="server" ControlName="chkEnforceReadOnlyAccess" suffix="?" />
                <asp:checkbox id="chkEnforceReadOnlyAccess" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblAmazonS3UseSSL" runat="server" ControlName="chkAmazonS3UseSSL" suffix="?" />
                <asp:checkbox id="chkAmazonS3UseSSL" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblUseReducedRedundancyStorage" runat="server" ControlName="chkUseReducedRedundancyStorage" suffix="?" />
                <asp:checkbox id="chkUseReducedRedundancyStorage" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblInheritBucketACLs" runat="server" ControlName="chkInheritBucketACLs" suffix="?" />
                <asp:checkbox id="chkInheritBucketACLs" runat="server" />
            </div>
    
            <div class="dnnFormItem">
                <dnn:Label ID="lblAllowEveryoneOpenDownload" runat="server" ControlName="chkAllowEveryoneOpenDownload" suffix="?" />
                <asp:checkbox id="chkAllowEveryoneOpenDownload" runat="server" />
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblUrlStyle" runat="server" ControlName="ddlUrlStyle" suffix=":" />
                <asp:DropDownList ID="ddlUrlStyle" runat="server">
                    <asp:listitem value="1">http(s)://s3.amazonaws.com/[BucketName]/[Filename]</asp:listitem>
                    <asp:listitem value="2">http(s)://[BucketName].s3.amazonaws.com/[Filename]</asp:listitem>
                    <asp:listitem value="3">http(s)://[BucketName]/[Filename]</asp:listitem>	
                </asp:DropDownList>
            </div>

            <div class="dnnFormItem">
                <dnn:Label ID="lblCustomServiceURL" runat="server" ControlName="txtCustomServiceURL" suffix=":" />
                <asp:TextBox ID="txtCustomServiceURL" runat="server" Columns="50" MaxLength="200" />
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