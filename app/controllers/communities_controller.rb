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
    @communities = Category.last(5)
  end

  def show
    @posts = Post.where(category_id: params[:id]).last(100)
  end

  def moderator
  end
end
