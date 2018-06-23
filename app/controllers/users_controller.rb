class UsersController < ApplicationController
  before_action(:authenticate_user!, except: [:show])

  def profile
    @user = User.find(params['id'])
  end
end
