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
    @posts = Post.where(category: Category.find(params[:id]))
    @posts = if params['order'] == 'tiempo'
               @posts.sort_by_date()
             elsif params['order'] == 'puntos'
               @posts.sort_by_points()
             else
               @posts.sort_by_trends()
             end
  end

  def moderator
  end
end
