class ForumsController < ApplicationController
  def index
    @posts = if params['order'] == 'tiempo'
               Post.sort_by_date()
             elsif params['order'] == 'puntos'
               Post.sort_by_points()
             else
               Post.sort_by_trends()
             end
    @posts = Post.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
    @categories = Category.all().last(4)
  end

  def mostrar
    @post = Post.find(params[:id])
    @comentarios = Commentary.where(post_id: params[:id])
  end
end
