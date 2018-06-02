class FavouritesController < ApplicationController
  before_action(:authenticate_user!)

  def index
    @favourites = Favourite.where(user_id: current_user.id).or(Favourite.where(user: current_user))
  end

  def create
    new_favourite = Favourite.create()
    new_favourite.user = current_user
    new_favourite.post = Post.find(params['post']['post_id'])
    new_favourite.save()
  end

  def subscribe
    favourite = Favourite.find(params['format'])
    if current_user == favourite.user
      favourite.isSubcribe = !favourite.isSubcribe
      favourite.save()
    end
  end
end
