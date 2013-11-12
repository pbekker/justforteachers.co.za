// WindowsUNCSettings.ascx

var isFormVisible;
var isInfoVisible;

function setupEvotivaUNCSettings() {
    $('#evotivaUNCSettings').dnnPanels();
    evoHideUNCInfo();
}

function evoHideUNCInfo() {
    isInfoVisible = true;
    evoShowUNCInfo();
}

function evoShowUNCInfo() {
    if (isInfoVisible) {
        $('#evotivaUNCInfo').hide();
    } else {
        $('#evotivaUNCInfo').show();
    }
    isInfoVisible = !isInfoVisible;
}


$(document).ready(function() {
    setupEvotivaUNCSettings();
    window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        setupEvotivaUNCSettings();
    });
});

if (Sys && Sys.Application) {
    Sys.Application.notifyScriptLoaded();
}