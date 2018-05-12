require('redcarpet/compat')

class PostsController < ApplicationController
  
  def show
    @post = Post.find(params[:id])
    @comentarios = Commentary.where(post_id: params[:id])
  end

  def new
  end

  def create
    before_action(:authenticate_user!)
    new_category = Post.create(category: Category.find_by(id: params['post']['category']),
                               title: params['post']['title'], content: params['post']['content'])
    new_category.save()
    redirect_to(forum_path())
  end

  def _post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(title: params[:title], content: params[:content])
    redirect_to(forum_path(), notice: 'Me has editado, gracias por darme una nueva imagen :D')
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete()
    redirect_to(forum_path(), notice: "Me has borrado, espero que estés feliz :')")
  end


end
