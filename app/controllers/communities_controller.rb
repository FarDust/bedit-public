class CommunitiesController < ApplicationController
  def index
    @communities = Category.last(5)
  end

  def show
    @posts = Post.where(category_id: params[:id]).last(100)
  end
end