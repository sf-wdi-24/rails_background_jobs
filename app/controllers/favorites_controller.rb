class FavoritesController < ApplicationController

  def create
    if current_user
      post_id = favorite_params[:post_id]
      favorited_post = Post.find(post_id)
      if current_user.favorite_posts.include?(favorited_post)
        render json: { error: "You already favorited this post." }, status: :unprocessable_entity
      else
        Favorite.delay(queue: :favorites).create(user_id: current_user.id, post_id: post_id)
        # current_user.favorites.delay(queue: :favorites).create(favorite_params)
        render json: {}, status: :no_content
      end
    else
      render json: { error: "You must be logged in to do this." }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      unfavorites = Favorite.where(user_id: current_user.id, post_id: params[:post_id])
      if unfavorites.any?
        unfavorites.first.delay(queue: :unfavorites).destroy
        render json: {}, status: :no_content
      else
        render json: { error: "Something went wrong." }, status: :unprocessable_entity
      end
    else
      render json: { error: "You must be logged in to do this." }, status: :unauthorized
    end
  end

  private

    def favorite_params
      params.require(:favorite).permit(:post_id)
    end

end