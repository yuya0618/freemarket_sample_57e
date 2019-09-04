class UsersController < ApplicationController
  def index
  end

  def list
    #1をcurrent_user.idにする
    @items = Item.find(current_user.id)
  end

  def edit
  end

  def to_destroy
  end
end
