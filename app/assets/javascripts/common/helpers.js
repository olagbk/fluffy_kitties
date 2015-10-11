/**
 * Created by reis on 10/5/15.
 */

Handlebars.registerHelper('round', function(options) {
    //return Math.round(options.fn(this) * 100) / 100;
    return Number(options.fn(this)).toFixed(2);
});



var setRootUrl = function (){
    if (location.pathname == "/login" || location.pathname == "/signup") {
        return;
    }
    localStorage.rootUrl = window.location.href;
};

var total = function(items){
    var total = 0;
    $.each(items, function(item_idx, item_obj){
        total += item_obj.price;
    });
    return total
};

var round = function(number){
    return Math.round(number * 100) / 100;
}