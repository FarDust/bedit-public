class PostsController < ApplicationController
    before_action(:authenticate_user!)
  def new
  end

  def create
    puts(params['post']['tittle'])
    new_category = Category.create(name: params['post']['tittle'])
    new_category.save()
    redirect_to(forum_path())
  end
end
