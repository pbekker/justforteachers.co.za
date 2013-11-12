// WindowsAzureSettings.ascx

var isFormVisible;
var isInfoVisible;

function setupEvotivaAzureSettings() {
    $('#evotivaAzureSettings').dnnPanels();
    evoHideNewContainerForm();
    evoHideAzureInfo();
}

function evoHideNewContainerForm() {
    isFormVisible = true;
    evoShowNewContainerForm();
}

function evoShowNewContainerForm() {
    if (isFormVisible) {
        $('#evotivaAzureNewContainer').hide();
    } else {
        $('#evotivaAzureNewContainer').show();
    }
    isFormVisible = !isFormVisible;
}


function evoHideAzureInfo() {
    isInfoVisible = true;
    evoShowAzureInfo();
}

function evoShowAzureInfo() {
    if (isInfoVisible) {
        $('#evotivaAzureInfo').hide();
    } else {
        $('#evotivaAzureInfo').show();
    }
    isInfoVisible = !isInfoVisible;
}


$(document).ready(function() {
    setupEvotivaAzureSettings();
    window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        setupEvotivaAzureSettings();
    });
});

if (Sys && Sys.Application) {
    Sys.Application.notifyScriptLoaded();
}