/**
 * Created by reis on 9/27/15.
 */
var Templates = {
    main: function () {
        function slides() {
            var source = $("#slides-template").html();
            var template = Handlebars.compile(source);
            var context = {slides: ["slide1.jpg", "slide2.jpg", "slide3.jpg", "slide4.jpg"]};
            var html = template(context);
            $("#slider-holder").append(html);
        }

        function products() {
            var source = $("#main-template").html();
            var template = Handlebars.compile(source);
            var context = {
                items: [
                    {
                        path: "big1.jpg",
                        category: "American",
                        name: "The Pug Kitty",
                        price: 15.99
                    },
                    {
                        path: "big2.jpg",
                        category: "European",
                        name: "Surprised French Kitty",
                        price: 36.99
                    },
                    {
                        path: "big3.jpg",
                        category: "Asian",
                        name: "Very Friendly Kitty",
                        price: 26.99
                    }
                ]
            };
            var html = template(context);
            $(".products").append(html);
        }

        slides();
        products();
    },
    layout: function () {
        setHeaders();
        function footer() {
            var counter = 0;
            var source = $("#more-template").html();
            var template = Handlebars.compile(source);
            var context = {images: ["small1.jpg", "small2.jpg", "small3.jpg", "small4.jpg", "small5.jpg", "small6.jpg", "small7.jpg"]};
            for (var i = 1; i <= 4; i++) {
                $.each(context.images, function (arr_idx, arr_elem) {
                    context.images.push(arr_elem);
                })
            }
            var html = template(context);
            $("#more-products-holder").html(html);

        }

        function categories() {
            var source = $("#categories-template").html();
            var template = Handlebars.compile(source);
            var context = {categories: ["African", "American", "Asian", "Australian", "European", "Alien"]};
            var html = template(context);
            $("#box-content").html(html);
            $(".category-link").click(function () {
                var category = $(this).attr("id");
            })
        }
        function cart(){
            var source = $("#cart-info-template").html();
            var template = Handlebars.compile(source);
            var order = (localStorage.order)? JSON.parse(localStorage.order) : new Order;
            var context = {price: order.total.toFixed(2), length: order.products.length};
            var html = template(context);
            $("#cart").html(html);
        }

        footer();
        categories();
        cart();
    },
    listItems: function(category, items){

        var source = $("#list-items-template").html();
        var template = Handlebars.compile(source);
        var context = {category: category, items: items};

        $.each(context.items, function(index, item_obj){
            item_obj.inStock = (item_obj.inventory >= 1);
        });

        var html = template(context);
        $("#content").append(html);


    },
    listCart: function(){
        var source = $("#cart-template").html();
        var template = Handlebars.compile(source);
        var order = JSON.parse(localStorage.order);
        var context = {articles: order.products};
        var html = template(context);
        $("#content").append(html);
    },
    currentAddress: function(){
        var source = $("#current-address-template").html();
        var template = Handlebars.compile(source);
        var order = JSON.parse(localStorage.order);
        var context = order.address;
        var html = template(context);
        $("#current-address").html(html);
        $("#edit-address-link").click(function(){
            toggleAddress();
            Templates.savedAddresses();
        })
    },
    savedAddresses: function(){
        var source = $("#saved-addresses-template").html();
        var template = Handlebars.compile(source);
        var addresses = (localStorage.addresses)? JSON.parse(localStorage.addresses) : [];
        if (addresses.length > 0) {

            var context = {addresses: addresses};
            var html = template(context);
            $("#saved-addresses-container").html(html);

            $(".address-select-link").click(function(){
                var id = $(this).attr("id");
                var order = JSON.parse(localStorage.order);
                var address = $.grep(addresses, function(e){ return e.id == id; });
                order.address = address[0];
                localStorage.order = JSON.stringify(order);
                Templates.currentAddress();
                toggleAddress();
            });

            $(".address-delete-link").click(function(){
                var id = $(this).attr("id");

                var order = JSON.parse(localStorage.order);
                if (order.address.id == id) {

                    order.address = null;
                    localStorage.order = JSON.stringify(order);
                }

                $.ajax({
                    type: 'DELETE',
                    url: "/api/addresses/" + id,
                    data: {
                        address: {
                            "id": id
                        }
                    },
                    success: function() {
                        var address = $.grep(addresses, function(e){ return e.id == id; });
                        var index = addresses.indexOf(address[0]);
                        addresses.splice(index, 1);
                        localStorage.addresses = JSON.stringify(addresses);
                        (addresses.length > 0)? Templates.savedAddresses() : location.reload();
                    }
                });
            });
        }
        Templates.addressForm();
    },
    addressForm: function(){
        var source = $("#address-form-template").html();
        var template = Handlebars.compile(source);
        var order = (localStorage.order)? JSON.parse(localStorage.order) : new Order;
        var context = order.address;
        var html = template(context);
        $("#address-table").html(html);
        if (!order.address) {
            $(".address-field").attr("disabled", "true")
        }
        $("#addressButton").click(function(){
            $.ajax({
                type: 'POST',
                url: '/api/addresses',
                data: {
                    address: {
                        name: $("#name").val(),
                        surname: $("#surname").val(),
                        street: $("#route").val(),
                        number: $("#street_number").val(),
                        city: $("#locality").val(),
                        postcode: $("#postal_code").val(),
                        country: $("#country").val()
                    }},
                success: function(address_obj){

                    var order = (localStorage.order)? JSON.parse(localStorage.order) : new Order;
                    var addresses = (localStorage.addresses)? JSON.parse(localStorage.addresses) : [];

                    order.address = address_obj;
                    addresses.push(address_obj);

                    localStorage.order = JSON.stringify(order);
                    localStorage.addresses = JSON.stringify(addresses);

                    Templates.currentAddress();
                    toggleAddress();
                }
            })
        });
    },
    missingItems: function(){
        var source = $("#missing-items-template").html();
        var template = Handlebars.compile(source);
        var order = JSON.parse(localStorage.order);
        var missing_items = JSON.parse(localStorage.missingItems);
        var context = {names: []};

        $.each(missing_items, function(index, id){
            var item_obj = $.grep(order.products, function(e){ return e.id == id;});
            var item_name = item_obj[0].name;
            context.names.push(item_name)
        });

        var html = template(context);
        $("#missing-items").html(html);
    }

};