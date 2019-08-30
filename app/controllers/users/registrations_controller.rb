# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
    # GET /resource/sign_up
  def step1
    @user = User.new
  end

  def step2
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    # session[:firstname] = user_params[:firstname]
    # session[:firstname_kana] = user_params[:firstname_kana]
    # session[:lastname] = user_params[:lastname]
    # session[:lastname_kana] = user_params[:lastname_kana]
    # session[:birthdate] = user_params[:birthdate]
    @user = User.new
  end

  def step3
  end

  def step4
    # session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step5
    # session[:zipcode] = addres_params[:zipcode]
    @user = User.new
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname,:lastnmae_kana, :firstname, :first_name_kana, :birthdate, :phone_number)
  end

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end
  # def address_params
  #   params.require(:addres).permit(:zipcode, :prefecture_id, :address_city, :address_number, :building, { :user_ids => []})
  # end


  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
