/**
 * Created by reis on 10/1/15.
 */

$(document).ready(function() {

    Templates.layout();
    $("#signup").click(function(){

        var first_name = $("#first-name").val();
        var last_name = $("#last-name").val();
        var email = $("#signup-email").val();
        var password = $("#signup-password").val();

        $.ajax({
            url: "/api/users/",
            type: "POST",
            data: {
                user: {
                    "first_name": first_name,
                    "last_name": last_name,
                    "email": email,
                    "password": password
                }
            },
            success: function(user){
                init_session(email, password);
            }
        });
    });
});
