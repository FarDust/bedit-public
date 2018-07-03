require('redcarpet/compat')

class PostsController < ApplicationController
  before_action(:authenticate_user!, except: [:show])

  def show
    @post = Post.find(params[:id])
    @favourite = Favourite.where(post: @post, user: current_user)
    @comentarios = if params['order'] == 'tiempo'
                     Commentary.sort_by_date(params)
                   else
                     Commentary.sort_by_votes(params)
                   end
  end

  def new
  end

  def create
    post = create_from_params(params)
    post.save()
    redirect_to(post_path(post.id))
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

  def like
    @post = Post.find(params[:id])
    if current_user.liked?(@post)
      @post.disliked_by(current_user)
    else
      @post.liked_by(current_user)
    end
    redirect_back(fallback_location: root_path())
  end

  def dislike
    @post = Post.find(params[:id])
    if current_user.disliked?(@post)
      @post.liked_by(current_user)
    else
      @post.disliked_by(current_user)
    end
    redirect_back(fallback_location: root_path())
  end

  private

  def create_from_params(params)
    Post.create(category: Category.find(params['post']['category']),
                title: params['post']['title'], content: params['post']['content'],
                user: current_user)
  end
end
