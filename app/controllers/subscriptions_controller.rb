class SubscriptionsController < ApplicationController
  def create
    new_favourite = Subscription.create(
      user: current_user,
      category: Category.find(params[:id])
    ).save()
    redirect_back(fallback_location: forum_path())
  end

  def delete
    Subscription.where(category: Category.find(params[:id]), user: current_user).delete_all()
    redirect_back(fallback_location: forum_path())
  end
end
