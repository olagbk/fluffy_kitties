/**
 * Created by reis on 10/7/15.
 */
function toggleAddress (){
    $("#current-address").toggle();
    $("#address-form").toggle();
}

$(document).ready(function(){
    if (!localStorage.login_token){
        setRootUrl();
        window.location = "/login"; //redirect to the login page if not signed in
    } else {
        Templates.layout();
        var order = (localStorage.order)? JSON.parse(localStorage.order) : new Order;
        if (order.address) { //display current address if already selected
            Templates.currentAddress();
            toggleAddress();
        } else {
            $.ajax({
                type: 'GET',
                url: '/api/addresses',
                success: function(addresses_array){
                    localStorage.addresses = JSON.stringify(addresses_array);
                    Templates.savedAddresses();
                }
            })
        }
    }
});

