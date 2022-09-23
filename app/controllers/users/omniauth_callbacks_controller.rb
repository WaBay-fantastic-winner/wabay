# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # callback for facebook
  def facebook
    callback_for(:facebook)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, :event => :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path, notice: '驗證失敗'
  end
end
