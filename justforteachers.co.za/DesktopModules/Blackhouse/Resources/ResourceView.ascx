<%@ Control Language="C#" ClassName="Blackhouse.Resources.ResourceView" %>

<div ng-app="resource-manager">
    <div ng-controller="Resources">
        <div ng-repeat="resource in returnedResources">
            <div class="form-group">
                <label for="resourceName" class="form-lable">Resource Name</label>
	            <label name="resourceName" class="form-label">{{resource.resourceName}}</label>
            </div>

            <div class="form-group">
                <label for="resourceDescription" class="form-lable">Resource Name</label>
	            <label name="resourceDescription" class="form-label">{{resource.resourceDescription}}</label>
            </div>

            <div class="form-group">
                <label for="resourceType" class="form-lable">Resource Name</label>
	            <label name="resourceType" class="form-label">{{resource.resourceType}}</label>
            </div>

            <div class="form-group">
                <label for="resourceTopic" class="form-lable">Resource Name</label>
	            <label name="resourceTopic" class="form-label">{{resource.resourceTopic}}</label>
            </div>

            <div class="form-group">
                <label for="resourceLanguage" class="form-lable">Resource Name</label>
	            <label name="resourceLanguage" class="form-label">{{resource.resourceLanguage}}</label>
            </div>
        </div>
    </div>
</div>
