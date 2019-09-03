class UsersController < ApplicationController
  def index
  end

  def list
    #1をcurrent_user.idにする
    @items = Item.where(user_params)
  end

  def edit
  end

  def to_destroy
    
  end
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname,:lastname_kana, :firstname, :firstname_kana, :birth_year,:birth_month, :birth_day, :phone_number, address_attributes: [:id, :zip_code, :address_city, :address_number, :building,:prefecture_id])
  end
end
