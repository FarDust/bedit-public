class FavouritesController < ApplicationController
  before_action(:authenticate_user!)

  def index
    @favourites = Favourite.select(:post_id).distinct.where(user_id: current_user.id)
  end

  def create
    new_favourite = Favourite.create(
      post_id: params['post']['post_id'],
      user_id: params['post']['user_id']
    )
  end
end
