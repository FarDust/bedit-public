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
    new_params = manage_params(params, current_user)
    if modified_avatar?(params)
      url = avatar_url(params['user']['avatar'])
      new_params['avatar'] = url
    end
    if update_valid_user(current_user, new_params)
      return
    else
      super
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

  private

  def update_valid_user(user, params)
    if valid_google_user?(user, params)
      redirect_google_user(user, params)
      true
    elsif user.update_with_password(params)
      redirect_normal_user(user, params)
      true
    else
      false
    end
  end

  def modified_avatar?(params)
    params.key?('user') && params['user'].key?('avatar')
  end

  def avatar_url(avatar)
    url = Cloudinary::Uploader.upload(avatar, options = { public_id: current_user.username })
    url['secure_url']
  end

  def redirect_normal_user(user,params)
    set_flash_message(:notice, :updated)
    sign_in(user)
    redirect_to(after_update_path_for(user))
  end

  def redirect_google_user(user, params)
    if valid_google_user?(user, params)
      set_flash_message(:notice, :updated)
      sign_in(user, bypass: true)
      redirect_to(after_update_path_for(user))
    end
  end

  def manage_params(params,current_user)
    if google_user?(current_user)
      manage_google_params(params)
    else
      manage_normal_params(params)
    end
  end

  def manage_normal_params(params)
    params.require(:user).permit(:email, :username, :current_password, :password,
                                 :password_confirmation)
  end

  def manage_google_params(params)
    params[:user].delete('password')
    params[:user].delete('password_confirmation')
    new_params = params.require(:user).permit(:email, :username)
    new_params
  end

  def google_user?(user)
    user.provider == 'google'
  end

  def valid_google_user?(user, params)
    is_valid = user.update_without_password(params) if google_user?(user)
    is_valid
  end

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