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

    $.ajax({
        type: "GET",
        url: "/api/braintree/token",
        success: function(response){

            var braintreeClient = new braintree.api.Client({clientToken: response.key});
            var bt_env = BraintreeData.environments.sandbox;

            //brainTreeMerchantId comes from the layout. Should be $window.brainTreeMerchantId...
            BraintreeData.setup(window.$bt_merchant_id, "checkout", bt_env);
            $("#submit-payment").click(function(){
                braintreeClient.tokenizeCard({
                    number: $("[data-braintree-name=number]").val(),
                    cardholderName: $("[data-braintree-name=cardholder_name]").val(),
                    expirationMonth: $("[data-braintree-name=expiration_month]").val(),
                    expirationYear: $("[data-braintree-name=expiration_year]").val(),
                    cvv: $("[data-braintree-name=cvv]").val()
                }, function(err, nonce){
                    var order = JSON.parse(localStorage.order);

                    $.ajax({
                        type: 'POST',
                        url: '/api/orders',

                        data: {
                            order: order,
                            payment_method_nonce: nonce
                        },

                        success: function(){
                            localStorage.removeItem("order");
                            window.location = '/processed';}
                    });
                });
            });
        }
    });

});


