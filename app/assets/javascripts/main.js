$(function() {

	$('.favorite').on('click', function() {
		var $favorite = $(this);
		var $star = $favorite.find('.fa');
		var $count = $favorite.next('.favorites-count');
		var postId = $favorite.attr('data-post-id');

		var count = parseInt($count.text());

		if ($star.hasClass('fa-star-o')) {
			$star.removeClass('fa-star-o').addClass('fa-star');
			count++;
			$count.text(count);
			$.post('/favorites.json', {
				favorite: { post_id: postId }
			}, function (data) {
				console.log(data);
			});
		} else {
			$star.removeClass('fa-star').addClass('fa-star-o');
			count--;
			$count.text(count);
			$.ajax({
				type: 'DELETE',
				url: '/favorites/' + postId + '.json',
				success: function (data) {
					console.log(data);
				}
			});
		}

	});

});