class FavoritesController < ApplicationController

  def create
    if current_user
      post_id = favorite_params[:post_id]
      if favorited_post = Post.find_by(id: post_id)
        unless current_user.favorite_posts.include?(favorited_post)
          Favorite.create(user_id: current_user.id, post_id: post_id)
        end
      end
      render json: {}, status: :no_content
    else
      render json: { error: "You must be logged in to do this." }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      unfavorites = Favorite.where(user_id: current_user.id, post_id: params[:post_id])
      if unfavorites.any?
        unfavorites.first.destroy
      end
      render json: {}, status: :no_content
    else
      render json: { error: "You must be logged in to do this." }, status: :unauthorized
    end
  end

  private

    def favorite_params
      params.require(:favorite).permit(:post_id)
    end

end