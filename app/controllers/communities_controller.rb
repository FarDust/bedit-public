class CommunitiesController < ApplicationController
  before_action(:authenticate_user!, except: %i[index show])

  def new
  end

  def create
    if params.key?('request')
      Administrate.create(user: params['request']['user'],
                          category: params['request']['category'])
      redirect_to(communities_path(), notice: '¡Tu solicitud a sido enviada!')
    end
  end

  def index
    @communities = Category.all()
  end

  def show
    if params['order'] == 'tiempo'
      @posts = Post.sort_by_date()
    elsif params['order'] == 'puntos'
      @posts = Post.sort_by_points()
    else
      @posts = Post.sort_by_trends()
    end
    @posts = @posts.where(category: Category.find(params[:id]))
  end

  def moderator
  end
end
