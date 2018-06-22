class ForumsController < ApplicationController
  def index
    @posts = if params['order'] == 'tiempo'
               Post.sort_by_date()
             elsif params['order'] == 'puntos'
               Post.sort_by_points()
             else
               Post.sort_by_trends()
             end
    @posts.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
    @posts_politica = Post.where(category_id: 1).last(4)
    @posts_programacion = Post.where(category_id: 2).last(4)
    @posts_juegos = Post.where(category_id: 3).last(4)
    @posts_data_science = Post.where(category_id: 3).last(4)
  end

  def mostrar
    @post = Post.find(params[:id])
    @comentarios = Commentary.where(post_id: params[:id])
  end
end
