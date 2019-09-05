class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :list]


  def index
    @user = current_user
  end

  def list
    add_breadcrumb '商品一覧'

    @items = @user.items

  end

  def edit
    add_breadcrumb '編集ページ'
  end

  def to_destroy
    add_breadcrumb 'ログアウト'

  end

  def credit
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :lastname,:lastname_kana, :firstname, :firstname_kana, :birth_year,:birth_month, :birth_day, :phone_number, address_attributes: [:id, :zip_code, :address_city, :address_number, :building,:prefecture_id])
  end

  private
    def set_user
      @user = current_user
    end
end
