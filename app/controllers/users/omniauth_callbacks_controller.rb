class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session[:provider_data] = request.env["omniauth.auth"].except("extra")
      session[:nickname] = request.env["omniauth.auth"].info.name
      session[:email] = request.env["omniauth.auth"].info.email
      session[:provider_data]["uid"] = request.env["omniauth.auth"].uid
      session[:provider_data]["provider"] = provider.to_s
      binding.pry
      redirect_to signup_registration_path
    end
  end
  
  def failure
    redirect_to root_path && return
  end
end
