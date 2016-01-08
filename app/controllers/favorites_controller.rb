class FavoritesController < ApplicationController

  def create
    if current_user
      favorited_post = Post.find(favorite_params[:post_id])
      if current_user.favorite_posts.include?(favorited_post)
        render json: { error: "You already favorited this post." }, status: :unprocessable_entity
      else
        current_user.favorites.create(favorite_params)
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
        unfavorites.first.destroy
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