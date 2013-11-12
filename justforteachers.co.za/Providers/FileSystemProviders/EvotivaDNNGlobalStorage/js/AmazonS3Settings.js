// AmazonS3Settings.ascx

var isFormVisible;
var isInfoVisible;

function setupEvotivaAmazonS3Settings() {
    $('#evotivaAmazonS3Settings').dnnPanels();
    evoHideNewBucketForm();
    evoHideAmazonS3Info();
}

function evoHideNewBucketForm() {
    isFormVisible = true;
    evoShowNewBucketForm();
}

function evoShowNewBucketForm() {
    if (isFormVisible) {
        $('#evotivaAmazonS3NewBucket').hide();
    } else {
        $('#evotivaAmazonS3NewBucket').show();
    }
    isFormVisible = !isFormVisible;
}


function evoHideAmazonS3Info() {
    isInfoVisible = true;
    evoShowAmazonS3Info();
}

function evoShowAmazonS3Info() {
    if (isInfoVisible) {
        $('#evotivaAmazonS3Info').hide();
    } else {
        $('#evotivaAmazonS3Info').show();
    }
    isInfoVisible = !isInfoVisible;
}


$(document).ready(function() {
    setupEvotivaAmazonS3Settings();
    window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        setupEvotivaAmazonS3Settings();
    });
});

if (Sys && Sys.Application) {
    Sys.Application.notifyScriptLoaded();
}