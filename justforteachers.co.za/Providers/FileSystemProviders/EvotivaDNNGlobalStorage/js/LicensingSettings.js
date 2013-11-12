//LicensingSettings.ascx

var isOnlineVisible;
var isOfflineVisible;

function setUpEvotivaLicenceItems() {
    $("textarea").focus(function() { $(this).select(); });
    evoHideLicenseOnline();
    evoHideLicenseOffline();
}

function evoHideLicenseOnline() {
    isOnlineVisible = true;
    evoShowLicenseOnline();
}

function evoHideLicenseOffline() {
    isOfflineVisible = true;
    evoShowLicenseOffline();
}

function evoShowLicenseOnline() {
    if (isOnlineVisible) {
        $('#evotivaLicenseOnLineActivation').hide();
    } else {
        $('#evotivaLicenseOnLineActivation').show();
        evoHideLicenseOffline();
    }
    isOnlineVisible = !isOnlineVisible;
}

function evoShowLicenseOffline() {
    if (isOfflineVisible) {
        $('#evotivaLicenseOffLineActivation').hide();
    } else {
        $('#evotivaLicenseOffLineActivation').show();
        evoHideLicenseOnline();
    }
    isOfflineVisible = !isOfflineVisible;
}

$(document).ready(function() {
    setUpEvotivaLicenceItems();
    window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        setUpEvotivaLicenceItems();
    });
});

if (Sys && Sys.Application) {
    Sys.Application.notifyScriptLoaded();
}