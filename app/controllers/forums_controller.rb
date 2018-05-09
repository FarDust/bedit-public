class ForumsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
  end
end
