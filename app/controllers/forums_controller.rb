class ForumsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
    @posts_politica = Post.where(category_id: 1).last(4)
    @posts_programacion = Post.where(category_id: 2).last(4)
    @posts_juegos = Post.where(category_id: 3).last(4)
    @posts_data_science = Post.where(category_id: 3).last(4)
  end
end
