$(document).ready(function ($) {

    function HoverOver() {
        $(this).addClass('rmhover') .find(".subMenu").stop().animate({height: 'show'},250);
    }

    function HoverOut() {
         $(this).removeClass('rmhover').find(".subMenu").animate({height: 'hide'},250, function() {
		  $(this).hide(); 
	  });
    }
	
	function HoverOversub() {
        $(this).find(".subMenuRight").stop().animate({height: 'show'},250);
    }

    function HoverOutsub() {
         $(this).find(".subMenuRight").stop().animate({height: 'hide'},250, function() {
		  $(this).hide(); 
	  });
    }

    if ($(window).width() >= 960)
    {
        var config = {
            sensitivity: 2,
            interval:200,
            over: HoverOver,
            timeout:200,
            out: HoverOut
        };
        var configsub = {
            sensitivity: 2,
            interval:150,
            over: HoverOversub,
            timeout:150,
            out: HoverOutsub
        };
        $("#standardMenu .rootMenu > li.haschild").hoverIntent(config);
		$("#standardMenu .subMenu li.haschild").hoverIntent(configsub);
    }
	else if ($(window).width() < 960 && $(window).width() > 767 )
	{
        var tabletconfig = {
            sensitivity: 2,
            interval:0,
            over: HoverOver,
            timeout:0,
            out: HoverOut
        };
        var tabletconfigsub = {
            sensitivity: 2,
            interval:0,
            over: HoverOversub,
            timeout:0,
            out: HoverOutsub
        };
        $("#standardMenu .rootMenu > li.haschild").hoverIntent(tabletconfig);
		$("#standardMenu .subMenu li.haschild").hoverIntent(tabletconfigsub);
		var firstTouch = true;
	    $("#standardMenu .rootMenu > li.haschild").bind("touchstart", 
			function(){		
				if (firstTouch){
					firstTouch = false;			
					$(this).find(".subMenu").stop().show();
					return false;
				}
			 }
		  );
		var subfirstTouch = true;
		$("#standardMenu .subMenu li.haschild").bind("touchstart", 
			function(){		
				if (subfirstTouch){
					subfirstTouch = false;			
					$(this).find(".subMenuRight").stop().show(); 
					return false;
				}
			 }
		  );
	}
	else
	{
		$("li.child-1 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-1 .subMenu").slideToggle();
		});
		$("li.child-2 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-2 .subMenu").slideToggle();
		});
		$("li.child-3 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-3 .subMenu").slideToggle();
		});
		$("li.child-4 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-4 .subMenu").slideToggle();
		});
		$("li.child-5 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-5 .subMenu").slideToggle();
		});
		$("li.child-6 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-6 .subMenu").slideToggle();
		});
		$("li.child-7 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-7 .subMenu").slideToggle();
		});
		$("li.child-8 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-8 .subMenu").slideToggle();
		});
		$("li.child-9 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-9 .subMenu").slideToggle();
		});
		$("li.child-10 .navarrow").click(function(event) {
		event.preventDefault();
		$("li.child-10 .subMenu").slideToggle();
		});
	}	
	
});