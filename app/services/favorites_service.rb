class FavoritesService

	def favorite(user, post_id)
		if favorited_post = Post.find_by(id: post_id)
		  unless user.favorite_posts.include?(favorited_post)
		    Favorite.create(user_id: user.id, post_id: post_id)
		  end
		end
	end
	handle_asynchronously :favorite, queue: :favorites

	def unfavorite(user, post_id)
		unfavorites = Favorite.where(user_id: user.id, post_id: post_id)
		if unfavorites.any?
		  unfavorites.each do |unfavorite|
		    unfavorite.destroy
		  end
		end
	end
	handle_asynchronously :unfavorite, queue: :unfavorites

end