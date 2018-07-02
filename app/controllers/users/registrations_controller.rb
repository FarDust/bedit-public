# frozen_string_literal: true

require('identicon')

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    user = params['user']['username']
    url = Cloudinary::Uploader.upload(Identicon.data_url_for(user), options = { public_id: user })
    params['user']['avatar'] = url['url']
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    @user = User.find(current_user.id)

    if current_user.provider == 'google'
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      new_params = params.require(:user).permit(:email, :username)
    else
      new_params = params.require(:user).permit(:email, :username, :current_password, :password, :password_confirmation)  
    end

    if params.key?('user') && params['user'].key?('avatar')
      avatar = params['user']['avatar']
      url = Cloudinary::Uploader.upload(avatar, options = { public_id: current_user.username })
      new_params['avatar'] = url['secure_url']
    end

    if current_user.provider == 'google'
      is_valid = @user.update_without_password(new_params)
    else
      is_valid = @user.update_with_password(new_params)
    end

    if is_valid
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    end
      
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource_or_scope)
  #   super(resource_or_scope)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource_or_scope)
  #   super(resource_or_scope)
  # end
end
