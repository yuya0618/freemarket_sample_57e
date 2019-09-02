class UsersController < ApplicationController
  


  def index
  # add_breadcrumb 'マイページ', :users_path
  end

  def list
    # add_breadcrumb '商品一覧', :list_users_path

    #1をcurrent_user.idにする
    @items = Item.where(user_id: 1)
  end

  def edit
    # add_breadcrumb '情報編集', :edit_user_path
  end

  def to_destroy
    # add_breadcrumb 'ログアウト'
    
  end
end
