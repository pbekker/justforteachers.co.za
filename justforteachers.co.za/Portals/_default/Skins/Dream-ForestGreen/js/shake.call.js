
$(function(){
  $(".shake img").each(function(k,img){
	new JumpObj(img,10);
    $(img).hover(function(){this.parentNode.parentNode.className="hover"});
  })
}); 