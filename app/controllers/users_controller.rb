class UsersController < ApplicationController

  def index
  end

  def list
    #1をcurrent_user.idにする
    @items = Item.where(user_id: 1)
  end

  def edit
  end

  def to_destroy
    
  end

end
