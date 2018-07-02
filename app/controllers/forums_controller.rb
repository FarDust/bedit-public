require('will_paginate/array')

class ForumsController < ApplicationController
  def index
    @categories = Category.all().last(4)
    @posts = manage_posts()
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

  def background
    forum = Category.find(params['forum_id'])
    if current_user.has_any_role?(:admin, name: :moderator, resource: forum)
      if forum.background?
        forum.background.update(url: params['secure_url'])
      else
        forum.background = Background.create(category: forum, url: params['secure_url'])
        forum.save()
      end
    end
  end

  def delete_background
    background = Category.find(params[:category_id].to_i()).background
    background.delete()
    redirect_back(fallback_location: root_path())
  end

  private

  def manage_posts
    @posts = Post.all()
    @posts = if params['order'] == 'tiempo'
               Post.sort_by_date(@posts)
             elsif params['order'] == 'puntos'
               Post.sort_by_points(@posts)
             else
               Post.sort_by_trends(@posts)
             end
    @posts = @posts.paginate(page: params[:page], per_page: 6)
  end
end
