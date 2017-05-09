$(document).ready(function() {
	$("#historical-restaurants .restaurant").infinitescroll({
		navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: "#historical-restaurants div.historical-restaurant"
	});
	return $(window).scroll();
});