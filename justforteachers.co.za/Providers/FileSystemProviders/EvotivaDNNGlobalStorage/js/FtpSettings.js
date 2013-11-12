// FtpSettings.ascx

var isFormVisible;
var isInfoVisible;

function setupEvotivaFtpSettings() {
    $('#evotivaFtpSettings').dnnPanels();
    evoHideFtpInfo();
}

function evoHideFtpInfo() {
    isInfoVisible = true;
    evoShowFtpInfo();
}

function evoShowFtpInfo() {
    if (isInfoVisible) {
        $('#evotivaFtpInfo').hide();
    } else {
        $('#evotivaFtpInfo').show();
    }
    isInfoVisible = !isInfoVisible;
}


$(document).ready(function() {
    setupEvotivaFtpSettings();
    window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function() {
        setupEvotivaFtpSettings();
    });
});

if (Sys && Sys.Application) {
    Sys.Application.notifyScriptLoaded();
}