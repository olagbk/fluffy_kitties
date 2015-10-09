/**
 * Created by reis on 10/1/15.
 */
$(document).ready(function() {
    Templates.layout();

    $("#login").click(function(){
        var email = $("#login-email").val();
        var password = $("#login-password").val();
        init_session(email, password);

    });
});