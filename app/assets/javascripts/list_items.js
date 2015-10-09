/**
 * Created by reis on 9/24/15.
 */

$(document).ready(function() {
    Templates.layout();

    $.ajax({
        type: "GET",
        url: "/api/items",
        data: {
            category: $cat_name
        },
        success: function(items_array) {

            var cat_items_array = [];

            $.each(items_array, function (item_idx, item_obj){

                item_obj.price = parseFloat(item_obj.price);
                cat_items_array.push(item_obj);

            });

            Templates.listItems($cat_name, cat_items_array);

            $(".add-item").click(function(){

                var item_id = $(this).attr("id");
                //var item = cat_items[item_id];
                var item = $.grep(cat_items_array, function(e){ return e.id == item_id; });
                var order = (localStorage.order)? JSON.parse(localStorage.order): new Order;
                order.total += item[0].price;
                order.products.push(item[0]);

                localStorage.order = JSON.stringify(order);
                $(this).hasClass("checkout")? window.location = "/cart" : Templates.layout();

            })
        }

    });



});