class FavouritesController < ApplicationController
  before_action(:authenticate_user!)

  def index
    @favourites = Favourite.where(user_id: current_user.id).or(Favourite.where(user: current_user))
    # necesario arreglarlo denuevo
    # @favourites = Favourite.select(:post_id).distinct.where(user_id: current_user.id)
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

  def delete
    Favourite.where(post_id: params['post']['post_id'], user_id: current_user.id).delete_all
    redirect_to(favourites_path())
  end
end
