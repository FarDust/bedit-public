require('will_paginate/array')

class ForumsController < ApplicationController
  def index
    @posts = Post.all()
    @posts = if params['order'] == 'tiempo'
               Post.sort_by_date(@posts)
             elsif params['order'] == 'puntos'
               Post.sort_by_points(@posts)
             else
               Post.sort_by_trends(@posts)
             end
    @posts = @posts.paginate(page: params[:page], per_page: 6)
    @categories = Category.all().last(4)
  end

  def create
    Category.create(
      name: params[:forum][:name],
      topic: params[:forum][:topic],
      description: params[:forum][:description]
    )
    redirect_to(communities_path(),
                notice: "¡Has creado un foro llamado #{params[:forum][:name]}!")
  end

  def mostrar
    @post = Post.find(params[:id])
    @comentarios = Commentary.where(post_id: params[:id])
  end
end
