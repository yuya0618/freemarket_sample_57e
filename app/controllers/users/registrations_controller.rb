# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    # GET /resource/sign_up
    before_action :step1, only: [:step2,:step4,:step5]
    before_action :step2, only: :step4
    before_action :step4, only: :step5
  def step1
    @user = User.new
  end

  def step2
    session[:user_params] = user_params
    @user = User.new(user_params)
    # binding.pry
  end

  def step3
  end

  def step4
    session[:user_params].new(user_params[:phone_number])
    @user = User.new(user_params)
    @user.build_address
    binding.pry
  end

  def step5
    # binding.pry
    session[:address_attributes] = user_params[:address_attributes]
    @user = User.new(session[:user_params])
    @user.build_address(session[:address_attributes])
    # binding.pry
  end
  session = []
  def create
    @user = User.new(session[:user_params])
    @user.build_address(session[:address_attributes])
    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
    end
  end
  private
  def user_params
    params.require(:user).permit(:id, :nickname, :email, :password, :password_confirmation, :lastname,:lastnmae_kana, :firstname, :first_name_kana, :birthdate, :phone_number, address_attributes: [:id, :zip_code, :address_city, :address_number, :building])
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
