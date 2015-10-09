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
        $("#current-address").append(html);
    }

};