function baseStart() {
	if (dbMessage != '') {
		alert(dbMessage);
	}
};
$(function() {
    $("#pattern").autocomplete({
        source: "/pages/ajax_card_search",
        minLength:2,
        delay:500
    });
    // 横幅を設定
    var w = $(window).width();
    if (set_width != w) {
        $.cookie('CakeCookie[my_width]', w, {
            expires: 10,
        });
    }
});

function my_login() {
    var params = {
      "login_id" 		: $('#LoginId').val(),
      "login_pass"		: $('#LoginPass').val(),
      "login_check"		: $('#LoginCheck1').val(),
    };
    $.post("/logins/login", params,
      function(data){
    	eval(data);
      }
   );
}