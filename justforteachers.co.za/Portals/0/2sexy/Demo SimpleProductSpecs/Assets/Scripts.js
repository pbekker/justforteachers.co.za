$(document).ready(function() {
	if(typeof(SimpleProductsSpecsScriptsIncluded) == "undefined")
	{		
		$(".SimpleProduct").each(function() {
			var Dialog = $(".SpecificationsTable", this).dialog({ autoOpen:false, dialogClass: 'dnnFormPopup dnnClear', width:600, modal:true });
			$(this).click(function() { Dialog.dialog("open"); });
		});
	}
	
	SimpleProductsSpecsScriptsIncluded = true;
});