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
    answer_request('aprobado')
  end

  def refuse
    @request = Administrate.where(user: params['administrate']['user'],
                                  category: params['administrate']['id'])
    answer_request('rechazado')
  end

  def define_moderator(username)
    @moderator = User.find_by(username: username)
    @moderator.add_role(:moderator, Category.find(params['administrate']['id']))
  end

  def answer_request(result)
    @request[0].create_notifications(current_user)
    for r in @request.each do
      r.update_attribute(:answered, true)
    end
    redirect_back(fallback_location: administrate_index_path(),
                  notice: "Has #{result} la solicitud")
  end

  def delete_user
    @user = User.find(params[:user_id].to_i)
    @username = @user.username
    @user.destroy()
    redirect_to(administrate_index_path(), notice: "Has eliminado la cuenta de #{@username}")
  end

  def post
  end
end
