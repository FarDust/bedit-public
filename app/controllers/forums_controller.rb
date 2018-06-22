class ForumsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
    @categories = Category.all().limit(4)
  end

  def mostrar
    @post = Post.find(params[:id])
    @comentarios = Commentary.where(post_id: params[:id])
  end
end
