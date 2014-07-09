$(document).on('ready page:load', function() {
	$('#search-form').on('submit', function(ev){
		ev.preventDefault();
		var searchValue = $('#search').val();

		$.get('/restaurants/all?search=' + searchValue)
			.done(function(data) {
				$('#restaurants-all').html(data);
			})
	});
});
