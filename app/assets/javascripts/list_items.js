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
            Templates.listItems($cat_name, items_array);
        }

    });


});