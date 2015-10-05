function _init_slider(carousel) {
	$('#slider-nav a').bind('click', function() {
		var index = $(this).parent().find('a').index(this);
		carousel.scroll( index + 1);
		return false;
	});
};
function _active_slide(carousel, item, idx, state) {
	var index = idx-1;
	$('#slider-nav a').removeClass('active');
	$('#slider-nav a').eq(index).addClass('active');
};

function _init_more_products(carousel) {
    $('.more-nav .next').bind('click', function() {
        carousel.next();
        return false;
    });

    $('.more-nav .prev').bind('click', function() {
        carousel.prev();
        return false;
    });
};

