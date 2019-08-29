class Users::AddressesController < Devise::RegistrationsController
  # GET /resource/confirmation/new
  def step4
    # session[:phone_number] = user_params[:phone_number]
    @address = Address.new
  end
  def new
  end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end