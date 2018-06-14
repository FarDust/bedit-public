class AdministrateController < ApplicationController
  before_action(:authenticate_user!)

  def new
  end

  def create
  end

  def index
  end

  def approve
    @moderator = User.find_by(username: params['administrate']['user'])
    @moderator.add_role(:moderator, Category.find(params['administrate']['id']))
    @request = Administrate.where(user: params['administrate']['user'],
                                  category: params['administrate']['id'])
    @request.each() do |r|
      r.delete()
    end
    redirect_to(administrate_index_path(), notice: 'Has aprobado la solicitud')
  end

  def refuse
    @request = Administrate.where(user: params['administrate']['user'],
                                  category: params['administrate']['id'])
    @request.each() do |r|
      r.delete()
    redirect_to(administrate_index_path(), notice: 'Has rechazado la solicitud')
  end

  def post
  end
end
