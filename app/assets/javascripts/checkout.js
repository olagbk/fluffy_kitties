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
                    if (order.address == null){ alert("Please enter a shipping address!")}
                    else if (order.products == []){ alert("Please add some kitties to the cart!")}
                    else {
                        $.ajax({
                            type: 'POST',
                            url: '/api/orders',

                            data: {
                                order: order,
                                payment_method_nonce: nonce
                            },

                            success: function(order_details){
                                var order = order_details.order;
                                order.products = order_details.order_items;

                                switch (order.status) {
                                    case "PAID":
                                        localStorage.removeItem("order");
                                        window.location = '/processed';
                                        break;
                                    case "UNPAID":
                                        alert("Payment failed!");
                                        break;
                                    case "INVENTORY_UNAVAILABLE":
                                        var names = "";

                                        $.each(order_details.missing_items, function(index, id){

                                            var item_obj = $.grep(order.products, function(e){ return e.id == id;});
                                            var item_index = order.products.indexOf(item_obj[0]);

                                            order.products.splice(item_index, 1);
                                            order.total -= item_obj[0].price;
                                            if (names.length > 0) { names += ", " }
                                            names += item_obj[0].name;
                                        });

                                        localStorage.order = JSON.stringify(order);
                                        alert("Some of your kitties (" + names + ") are out of stock! Click OK to pick a different kitty or return to checkout.");
                                        window.location = '/cart';
                                        break;
                                } //switch statement end
                            } //success callback end
                        }); //ajax request end
                    }


                });
            });
        }
    });

});


