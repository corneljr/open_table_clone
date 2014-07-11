$(document).on('ready page:load', function() {
	$('#search-form').on('submit', function(ev){
		ev.preventDefault();
		var searchValue = $('#search').val();

		$.getScript('/restaurants/all?search=' + searchValue)
		
	});

	if ($('.pagination').length) {
		$(window).scroll(function() {
			var url = $('.next a').attr('href')
			if (url && $(window).scrollTop() > ($(document).height() - $(window).height() - 50)) {
				$('.pagination').text("Fetching more products...");
				$.getScript(url)
			}
		});
	}
	
});
