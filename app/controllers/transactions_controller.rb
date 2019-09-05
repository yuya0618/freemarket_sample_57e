class TransactionsController < ApplicationController

  def buy
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
    # @image = @item.image

  end


end
