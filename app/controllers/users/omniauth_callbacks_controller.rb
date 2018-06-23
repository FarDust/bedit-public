# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      success(@user)
    else
      error(@user)
    end
  end

  def success(user)
    flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Google')
    sign_in_and_redirect(user, event: :authentication)
  end

  def error(user)
    session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
    # Removing extra as it can overflow some session stores
    redirect_to(new_user_registration_url, alert: user.errors.full_messages.join("\n"))
  end
end
