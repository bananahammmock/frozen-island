//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.maskedinput

$(document).ready(function(){
	$('#global_nav > ul').toggleClass('no-js js');

	var menuList = $(".js").find("li");
	menuList.find(".hidden").hide();
	menuList.on("click", function(){
  	  menuList.find(".hidden").slideUp(400);
    	if (!($(this).find(".hidden").is(":visible"))) {
      	  menuList.removeClass("selected");
        	$(this).find(".hidden").slideDown(400);
        	$(this).addClass("selected");       
    	};  
	});
	$("#user_phone_number").on("click", function(){
		$("#user_phone_number").mask("(999) 999-9999");})
});
