/**
 * Created by reis on 10/1/15.
 */
var init_session = function(email, password) {
    $.ajax({
        url: "/api/users/login",
        type: "GET",
        data: {
            user: {
                "email": email,
                "password": password
            }
        },
        success: function(token_obj){
            if (token_obj) {
                localStorage.login_token = token_obj.token;
                set_logged_in(true);
                setHeaders();
                window.location = "/home"
            }
        }
    });
};
var set_logged_in = function(is_logged_in){
    var desired_method = ((is_logged_in)? "addClass" : "removeClass");
    $("#navigation")[desired_method]("is-logged-in");
};
var setHeaders = function(){
    $.ajaxSetup({
        headers: {"x-login-token": localStorage.login_token}
    });
};

$(document).ready(function(){

    (localStorage.login_token)? set_logged_in(true): set_logged_in(false);

    $("#logout").click(function(){
        localStorage.removeItem("login_token");
        set_logged_in(false);
    });



});