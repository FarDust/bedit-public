class PostsController < ApplicationController
    before_action(:authenticate_user!)
  def new
  end

  def create
    # comments_from_form = params['myform']['comments']
    Category.create(name: params['post']['post_tittle'])
  end
end
