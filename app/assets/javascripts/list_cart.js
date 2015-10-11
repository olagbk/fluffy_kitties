/**
 * Created by reis on 10/5/15.
 */
$(document).ready(function() {

    Templates.layout();
    Templates.listCart();

    $(".empty-link").click(function(){
        localStorage.removeItem("order");
    });

    $(".remove-link").click(function(){
        var order = JSON.parse(localStorage.order);
        var item_id = $(this).attr("id");
        var item_obj_arr = $.grep(order.products, function(e){
            return e.id == item_id;
        });
        var item_obj = item_obj_arr[0];

        var index = order.products.indexOf(item_obj);
        order.products.splice(index, 1);
        order.total -= item_obj.price;
        localStorage.order = JSON.stringify(order);        

    })

});
