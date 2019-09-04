# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    # GET /resource/sign_up
    # before_action :step1, only:[:step2,:step4,:step5]
    # before_action :step2, only: [:step4,:step5]
    # before_action :step4, only: [:step5]
  def new
  end

  def step1
    @user = User.new
    # binding.pry
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:firstname] = user_params[:firstname]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:lastname] = user_params[:lastname]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new

    # binding.pry
  end

  def step3
  end

  def step4
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
  end

  def step5
    # binding.pry
    session[:address_attributes] = user_params[:address_attributes]
    @user = User.new
    @user.build_address(session[:address_attributes])
    # binding.pry
  end
  def create
    @user = User.new(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], lastname: session[:lastname],lastname_kana: session[:lastname_kana], firstname: session[:firstname], firstname_kana: session[:firstname_kana], birth_year: session[:birth_year], birth_month: session[:birth_month], birth_day: session[:birth_day], phone_number: session[:phone_number], address_attributes: session[:address_attributes])
    if @user.save
      # ログインするための情報を保管
      sign_in @user
    end
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname,:lastname_kana, :firstname, :firstname_kana, :birth_year,:birth_month, :birth_day, :phone_number, address_attributes: [:id, :zip_code, :address_city, :address_number, :building,:prefecture_id])
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
