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
            $("#more-products-holder").append(html);
            $("#more-products-holder ul li").last().addClass("last");
        }

        function categories() {
            var source = $("#categories-template").html();
            var template = Handlebars.compile(source);
            var context = {categories: ["African", "American", "Asian", "Australian", "European", "Alien"]};
            var html = template(context);
            $("#box-content").append(html);
            $(".category-link").click(function () {
                var category = $(this).attr("id");
            })
        }

        footer();
        categories();
    },
    listItems: function(category, items){

        var source = $("#list-items-template").html();
        var template = Handlebars.compile(source);
        var context = {category: category, items: items};
        $.each(context.items, function (item_idx, item_obj){
            item_obj.price = Math.round(item_obj.price * 100) / 100
        })
        var html = template(context);
        $("#content").append(html);
        $(".add-cart").click(function(){
            var item = $(this).attr("id");
            $.ajax({
                type: "GET",
                url: "/api/items/add",
                data: {
                    id: item
                },
                success: function(item_obj) {

                    var cart = (localStorage.cart)? JSON.parse(localStorage.cart): new Cart;
                    cart.articles.push(item_obj);
                    cart.cost += Math.round(item_obj.price*100)/100;
                    $("#cart-cost").text(cart.cost);
                    $("#cart-arts").text(cart.articles.length);
                    localStorage.cart = JSON.stringify(cart);
                }
            })
        })


    },
    cart: function(){
        var source = $("#cart-template").html();
        var template = Handlebars.compile(source);
        var context = cart.articles;
        var html = template(context);
        $("#content").append(html);
    }

};