<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResourceListings.ascx.cs" Inherits="Blackhouse.Resources.ResourceListings" %>

<script src="/DesktopModules/Blackhouse/js/admin.js"></script>

<div ng-app="resource-manager">
    <div ng-controller="ResourcesList">
        <div ng-repeat="resource in defaults">
            <div class="form-group">
                <label for="resourceName" class="form-label">Resource Name</label>
                <div class="form-controls">
    	            <label name="resourceName" class="form-label">{{resource.ResourceName}}</label>
                </div>
            </div>

            <div class="form-group">
                <label for="resourceDescription" class="form-label">Resource Description</label>
                <div class="form-controls">
	                <label name="resourceDescription" class="form-label">{{resource.ResourceDescription}}</label>
                </div>
            </div>

            <div class="form-group">
                <label for="resourceType" class="form-label">Resource Type</label>
                <div class="form-controls">
	                <label name="resourceType" class="form-label">{{resource.ResourceType}}</label>
                </div>
            </div>

            <div class="form-group">
                <label for="resourceTopic" class="form-label">Resource Topic</label>
                <div class="form-controls">
	                <label name="resourceTopic" class="form-label">{{resource.ResourceTopic}}</label>
                </div>
            </div>

            <div class="form-group">
                <label for="resourceLanguage" class="form-label">Resource Language</label>
                <div class="form-controls">
    	            <label name="resourceLanguage" class="form-label">{{resource.ResourceLanguage}}</label>
                </div>
            </div>
            <br />
        </div>
    </div>
</div>