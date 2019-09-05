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
    # binding.pry
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
  end

  def step3
  end

  def step4
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
  end

  def step5
    session[:address_attributes] = user_params[:address_attributes]
    @user = User.new
    @user.build_address(session[:address_attributes])

  end
  def create
    @user = User.new(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], lastname: session[:lastname],lastname_kana: session[:lastname_kana], firstname: session[:firstname], firstname_kana: session[:firstname_kana], birth_year: session[:birth_year], birth_month: session[:birth_month], birth_day: session[:birth_day], phone_number: session[:phone_number], address_attributes: session[:address_attributes])
    unless session[:provider_data] == {}
    @user.sns_credentials.build(
      uid: session[:provider_data]["uid"],
      provider: session[:provider_data]["provider"])
    end
    if @user.save
      sign_in @user
    end
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname,:lastname_kana, :firstname, :firstname_kana, :birth_year,:birth_month, :birth_day, :phone_number, address_attributes: [:id, :zip_code, :address_city, :address_number, :building,:prefecture_id])
  end

end
