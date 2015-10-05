

/**
 * Created by reis on 9/18/15.
 */

$(document).ready(function() {

    Templates.main();
    Templates.layout();

    $("#slider-holder ul").jcarousel({
        scroll: 1,
        auto: 6,
        wrap: 'both',
        initCallback: _init_slider,
        itemFirstInCallback: _active_slide,
        buttonNextHTML: null,
        buttonPrevHTML: null
    });

    $("#more-products-holder ul").jcarousel({
        scroll: 2,
        auto: 5,
        wrap: 'both',
        initCallback: _init_more_products,
        buttonNextHTML: null,
        buttonPrevHTML: null
    });


});