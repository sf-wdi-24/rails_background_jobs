class FavoritesController < ApplicationController

  def create
    if current_user
      post_id = favorite_params[:post_id]
      FavoritesService.new.favorite(current_user, post_id)
      render json: {}, status: :no_content
    else
      render json: { error: "You must be logged in to do this." }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      post_id = params[:post_id]
      FavoritesService.new.unfavorite(current_user, post_id)
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