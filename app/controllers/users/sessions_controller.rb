# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  def new
    super
    # binding.pry
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user
      if user.valid_password?(params[:user][:password]) 
        sign_in_and_redirect user
      else
        flash[:error] =  "Please enter the valid password."
      end
    end
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
