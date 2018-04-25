class ForumsController < ApplicationController
  def index
    @posts = Post.all().order(created_at: :asc)
  end
end
