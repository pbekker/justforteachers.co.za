$(document).ready(function() {
	if(typeof(BasicContentDemoAssetScriptsIncluded) == "undefined")
	{
		$(".BasicContentWithLightBox").each(function(i,e) {
			var Dialog = $(".BasicContent", e).dialog({ autoOpen:false, dialogClass: 'dnnFormPopup dnnClear', width:910, modal:true });
			$(".ExpandBasicContent", e).click(function() {
				Dialog.dialog("open");
			});
		});
		
		$(".BasicContentWithPreview").each(function(i,e) {
			$(".ExpandBasicContent, .CollapseBasicContent", e).click(function() {
				$(".BasicPreviewContent", e).slideToggle();
				$(".BasicContent", e).slideToggle();
			});
		});
		
		$(".BasicContentWithPreviewAndImage").each(function(i,e) {
			var Dialog = $(".BasicContent", e).dialog({ autoOpen:false, dialogClass: 'dnnFormPopup dnnClear', width:840, modal:true });
			$(".ExpandBasicContent", e).click(function() {
				Dialog.dialog("open");
			});
		});
	}
	
	BasicContentDemoAssetScriptsIncluded = true;
});