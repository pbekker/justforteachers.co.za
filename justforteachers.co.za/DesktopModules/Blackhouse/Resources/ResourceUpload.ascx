﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceUpload.ascx.cs" Inherits="Blackhouse.Resources.ResourceUpload" %>
    <script>
        $('#btUpload').click(function () { if (fileUpload.value.length == 0) { alert('No files selected.'); return false; } });
    </script>

    <div class="wrapper" id="divUploadform" runat="server">
        <div class="form-group">
            <asp:Label runat="server" Text="Resource Name *" /><br />
            <asp:TextBox runat="server" ID="txtResourceName" /><br /><br />
        </div>
        <div class="form-group">
            <asp:Label runat="server" Text="Resource Description" /><br />
            <asp:TextBox runat="server" ID="txtResourceDescription" TextMode="MultiLine" Rows="5" /><br /><br />
        </div>
        <div class="form-group">
            <asp:Label runat="server" Text="Resource Type *" /><br />
            <asp:DropDownList runat="server" id="ddlResourceType" /><br /><br />
        </div>
        <div class="form-group">
            <asp:Label runat="server" Text="Resource Topic *" /><br />
            <asp:DropDownList runat="server" id="ddlResourceTopic" /><br /><br />
        </div>
        <div class="form-group">
            <asp:Label runat="server" Text="Resource Language *" /><br />
            <asp:DropDownList runat="server" id="ddlResourceLanguage" /><br /><br />
        </div>
        <asp:LinkButton runat="server" ID="lnkSave" Text="Next..." OnClick="lnkSave_Click" />
    </div>
    <asp:HiddenField runat="server" ID="hidResourceId" />

    <div runat="server" id="divFileUpload">
        <input type="file" id="myfile" multiple="multiple" name="myfile" runat="server" size="100" />
        <br />
        <asp:LinkButton ID="UploadFiles" runat="server" Text="Upload Files and Next..." OnClick="UploadFiles_Click" />
        <br />
        <asp:Label ID="Span1" runat="server"></asp:Label>
    </div>

    <%-- TODO: Add file information collection here --%>

    <div id="divFileinfo">
        <asp:Repeater runat="server" ID="rptFileInfo">
            <ItemTemplate>

            </ItemTemplate>
        </asp:Repeater>
    </div>


    <%-- TODO: Add website type upload --%>

    <div runat="server" id="divWebsiteUpload">
        <asp:Label runat="server" Text="Resource Web URL:" /><br />
        <asp:TextBox runat="server" ID="txtWebUrl" />
        <br />
        <asp:LinkButton ID="lnkUploadWebsite" runat="server" Text="Save and View" OnClick="UploadWebsite_Click" />
        <br />
        <asp:Label ID="Span2" runat="server"></asp:Label>
    </div>

    <%-- TODO: Add lesson plan type upload --%>

    <div runat="server" id="divLessonplan">
        <asp:Label runat="server" Text="Resource Web URL:" /><br />
        <asp:TextBox runat="server" ID="txtLessonWebUrl" /><br />
        <asp:Label runat="server" Text="Resource Files:" /><br />
        <input type="file" id="lessonfile" multiple="multiple" name="myfile" runat="server" size="100" /><br />
        <asp:LinkButton ID="lnkUploadLessonPlan" runat="server" Text="Save and Next..." OnClick="UploadLessonPlan_Click" /><br />
        <asp:Label ID="Span3" runat="server"></asp:Label>
    </div>

<%--<script src="/DesktopModules/Blackhouse/js/admin.js"></script>

<div ng-app="resource-manager">
    <div ng-controller="ResourcesUpload">
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

        <a ng-click="add()">Save</a>

       <div ng-repeat="file in returnedFiles">

            <div class="preview-column">
                <img src="{{file.preview}}"/>
            </div> 
            <div class="form-column">

                <div class="form-group">
	                <label for="FileAuthorName" class="form-label">Author Name *</label>
	                <div class="form-controls">
		                <input type="text" name="AuthorName" id="Text1" class="form-control" ng-model="file.ResourceName" ng-maxlength="70" required>
	                </div>
                </div>

                <div class="form-group">
	                <label for="FileYear" class="form-label">Year *</label>
	                <div class="form-controls">
		                <textarea name="FileYear" id="Textarea1" class="form-control" ng-model="file.ResourceDescription" required></textarea>
	                </div>
                </div>

                <div class="form-group">
	                <label for="FilePublisher" class="form-label">Publisher *</label>
	                <div class="form-controls">
		                <input type="text" name="FilePublisher"  class="form-control" ng-model="file.ResourceTypeId" ng-options="c.ListId as c.ListValue for c in defaults.types" required>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>

