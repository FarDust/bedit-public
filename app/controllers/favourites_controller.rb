class FavouritesController < ApplicationController
  before_action(:authenticate_user!)

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
    new_favourite = Favourite.create()
    new_favourite.user = current_user
    new_favourite.post = Post.find(params['post_id'])
    new_favourite.save()
    redirect_back(fallback_location: favourites_path())
  end

  def subscribe
    favourite = Favourite.find(params['format'])
    if current_user == favourite.user
      favourite.isSubcribe = !favourite.isSubcribe
      favourite.save()
    end
    redirect_back(fallback_location: favourites_path())
  end

  def delete
    Favourite.where(post_id: params['post_id'], user: current_user).delete_all()
    redirect_back(fallback_location: favourites_path())
  end
end
