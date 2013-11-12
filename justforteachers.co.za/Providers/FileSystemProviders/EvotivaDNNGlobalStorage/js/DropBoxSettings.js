// DropBoxSettings.ascx

var isFormVisible;
var isInfoVisible;

function setupEvotivaDropBoxSettings() {
    $('#evotivaDropBoxSettings').dnnPanels();
    evoHideDropBoxInfo();
}


function evoHideDropBoxInfo() {
    isInfoVisible = true;
    evoShowDropBoxInfo();
}

function evoShowDropBoxInfo() {
    if (isInfoVisible) {
        $('#evotivaDropBoxInfo').hide();
    } else {
        $('#evotivaDropBoxInfo').show();
    }
    isInfoVisible = !isInfoVisible;
}

function ShowPopUp(url) { //, width, height, behaviors) {

    var width = 800;
    var height = 800;
    var behaviors = "status=1,location=1,resizable=1,scrollbars=1";

    //Center Vertically
    var a = Math.round(screen.height / 2);
    var b = Math.round(height / 2);

    var c = a - b;
    //Center Horizontally
    var x = Math.round(screen.width / 2);
    var y = Math.round(width / 2);
    var z = x - y;

    if (z < 0) z = 0;
    if (c < 0) c = 0;

    if (behaviors != "")
        behaviors = "," + behaviors;

    var finalBehaviors = "width=" + width + ",height=" + height + ",top=" + c + ",left=" + z + behaviors;
    var activeWindow = window.open(url, '_blank', finalBehaviors);
}

$(document).ready(function() {
    setupEvotivaDropBoxSettings();
    window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        setupEvotivaDropBoxSettings();
    });
});

if (Sys && Sys.Application) {
    Sys.Application.notifyScriptLoaded();
}