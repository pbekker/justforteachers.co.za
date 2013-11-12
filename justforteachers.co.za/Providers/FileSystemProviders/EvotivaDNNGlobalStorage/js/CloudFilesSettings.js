// CloudFilesSettings.ascx

var isFormVisible;
var isInfoVisible;

function setupEvotivaCloudFilesSettings() {
    $('#evotivaCloudFilesSettings').dnnPanels();
    evoHideNewBucketForm();
    evoHideCloudFilesInfo();
}

function evoHideNewBucketForm() {
    isFormVisible = true;
    evoShowNewBucketForm();
}

function evoShowNewBucketForm() {
    if (isFormVisible) {
        $('#evotivaCloudFilesNewBucket').hide();
    } else {
        $('#evotivaCloudFilesNewBucket').show();
    }
    isFormVisible = !isFormVisible;
}


function evoHideCloudFilesInfo() {
    isInfoVisible = true;
    evoShowCloudFilesInfo();
}

function evoShowCloudFilesInfo() {
    if (isInfoVisible) {
        $('#evotivaCloudFilesInfo').hide();
    } else {
        $('#evotivaCloudFilesInfo').show();
    }
    isInfoVisible = !isInfoVisible;
}


$(document).ready(function() {
    setupEvotivaCloudFilesSettings();
    window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        setupEvotivaCloudFilesSettings();
    });
});

if (Sys && Sys.Application) {
    Sys.Application.notifyScriptLoaded();
}