//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

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

});




