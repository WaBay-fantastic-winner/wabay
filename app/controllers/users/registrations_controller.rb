# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_user!, only: [:profile]
  before_action :configure_account_update_params, only: [:update]

  def profile
    if user_signed_in? 
      @projects = current_user.projects
    else  
      redirect_to new_user_session_path
    end 

  end

  # PUT /resource
  def update
    if current_user.uid == nil
      super
   else
      current_user.update(params.require(:user).permit(:username, :password, :description, :avatar_url))
      redirect_to '/users/profile'
   end
  end

  # DELETE /resource
  def destroy
    super
  end

  private

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username description avatar_url])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username description avatar_url])
  end
end

