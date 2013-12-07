<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceUpload.ascx.cs" Inherits="Blackhouse.Resources.ResourceUpload" %>

<script src="/DesktopModules/Blackhouse/js/admin.js"></script>

<%--<asp:Label runat ="server" ID="output" />

<asp:Label runat="server" ID="lblResName" Text="Resource Name" /><br />
<asp:TextBox runat="server" ID="txtResourceName" ToolTip="Please enter the name of your resource..." /><br />

<asp:Label runat="server" ID="lblResDescription" Text="Resource Name" /><br />
<asp:TextBox runat="server" ID="txtResourceDesc" ToolTip="Please enter the description of your resource..."  AutoPostBack="False" TextMode="MultiLine" Rows="5" /><br />

<asp:Label runat="server" ID="lblResType" Text="Resource Type" /><br />
<asp:DropDownList runat="server" ID="ddlTypes" ToolTip="Please select the type of resource..." /><br />

<asp:Label runat="server" ID="lblResLang" Text="Resource Language" /><br />
<asp:DropDownList runat="server" ID="ddlLanguages" ToolTip="Please select the language of resource..." /><br />

<asp:Label runat="server" ID="lblResTopic" Text="Resource Topic" /><br />
<asp:DropDownList runat="server" ID="ddlTopics" ToolTip="Please select the topic of resource..." /><br />--%>
<div ng-app="resource-manager">
    <div ng-controller="Resources">
        <div class="form-group">
	        <label for="ResourceName" class="form-label">Resource Name *</label>
	        <div class="form-controls">
		        <input type="text" name="ResourceName" id="ResourceName" class="form-control" ng-model="data.ResourceName" ng-maxlength="70" required>
	        </div>
        </div>

        <div class="form-group">
	        <label for="ResourceDescription" class="form-label">Resource Description *</label>
	        <div class="form-controls">
		        <textarea name="ResourceDescription" id="ResourceDescription" class="form-control" ng-model="data.ResourceDescription" required></textarea>
	        </div>
        </div>

        <div class="form-group">
	        <label for="ResourceType" class="form-label">Resource Type *</label>
	        <div class="form-controls">
		        <select name="ResourceType" id="ResourceType" class="form-control" ng-model="data.ResourceTypeId" ng-options="c.ListId as c.ListValue for c in defaults.types" required>
		        </select>
	        </div>
        </div>

        <div class="form-group">
	        <label for="ResourceTopic" class="form-label">Resource Topic *</label>
	        <div class="form-controls">
		        <select name="ResourceTopic" id="Select1" class="form-control" ng-model="data.ResourceTopicId" ng-options="c.ListId as c.ListValue for c in defaults.topics" required>
		        </select>
	        </div>
        </div>

        <div class="form-group">
	        <label for="ResourceLanguage" class="form-label">Resource Language *</label>
	        <div class="form-controls">
		        <select name="ResourceLanguage" id="Select2" class="form-control" ng-model="data.ResourceLanguageId" ng-options="c.ListId as c.ListValue for c in defaults.languages" required>
		        </select>
	        </div>
        </div>

        <div file-upload></div>

        <a ng-click="add()" ng-controller="Resources">Save</a>

    </div>
</div>

