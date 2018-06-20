class AdministrateController < ApplicationController
  before_action(:authenticate_user!)

  def new
  end

  def create
  end

  def index
  end

  def approve
    define_moderator(params['administrate']['user'])
    @request = Administrate.where(user: params['administrate']['user'],
                                  category: params['administrate']['id'])
    delete_request(@request, 'Has aprobado la solicitud')
  end

  def refuse
    @request = Administrate.where(user: params['administrate']['user'],
                                  category: params['administrate']['id'])
    delete_request(@request, 'Has rechazado la solicitud')
  end

  def define_moderator(username)
    @moderator = User.find_by(username: username)
    @moderator.add_role(:moderator, Category.find(params['administrate']['id']))
  end

  def delete_request(request, notice)
    request.each(&:delete)
    redirect_to(administrate_index_path(), notice: notice)
  end

  def delete_user
    @user = User.find(params[:user_id].to_i)
    @username = @user.username
    @user.delete()
    redirect_to(administrate_index_path(), notice: "Has eliminado la cuenta de #{@username}")
  end

  def post
  end
end
