class UsersController < ApplicationController
  
  def index
  end

  def list
    add_breadcrumb '商品一覧'
    #1をcurrent_user.idにする
    @items = Item.find(current_user.id)
  end

  def edit
    add_breadcrumb '編集ページ'
  end

  def to_destroy
    add_breadcrumb 'ログアウト'
  end
end
