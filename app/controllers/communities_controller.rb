class CommunitiesController < ApplicationController
  before_action(:authenticate_user!, except: %i[index show])

  def new
  end

  def create
    if params.key?('request')
      Administrate.create(user: params['request']['user'],
                          category: params['request']['category'],
                          answered: false)
      redirect_to(communities_path(), notice: '¡Tu solicitud a sido enviada!')
    end
  end

  def index
    @communities = Category.all()
  end

  def show
    @posts = Post.where(category: Category.find(params[:id]))
    @posts = if params['order'] == 'tiempo'
               Post.sort_by_date(@posts)
             elsif params['order'] == 'puntos'
               Post.sort_by_points(@posts)
             else
               Post.sort_by_trends(@posts)
             end
  end

  def moderator
  end
end
