class ItemsController < ApplicationController
  require 'payjp'

  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy, :purchase]
  before_action :set_card, only: [:buy, :complete]

  add_breadcrumb 'メルカリ', '/'

  def index
    @items = Item.order("created_at DESC").limit(4)

  end

  def show
    def show
      add_breadcrumb @item.name
      @next = Item.where("id > ?", @item.id).order("id DESC").first
      @previous = Item.where("id < ?", @item.id).order("id ASC").first
      @items = Item.order("created_at DESC").limit(3)
      @images = @item.images.order("created_at DESC").limit(5)
      @category = Category.all

  end


  def new
    @item = Item.new
    @item.images.build
    @categories = Item.new
  end


  def edit
    # add_breadcrumb '出品した商品、出品中', :edit_item_path
  end


  def create
    @item = Item.create!(item_params)
    redirect_to root_path, notice: '商品が投稿されました'
  end


  def update
    @item.update(item_params)  if @item.user == current_user
    redirect_to item_path(@item)
  end


  def destroy
    @item.destroy if @item.user == current_user
    redirect_to list_user_path(current_user.id)
  end

  def buy
  end

  def purchase
    cards = current_user.credit_cards
    card = cards[0]
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: card.user,
      currency: 'jpy'
    )
    if charge["captured"]
      @item.update(order_status: true, buyer_id: current_user.id)
      redirect_to complete_item_path(@item)
    else
      render :buy
    end
  end


  def complete
  end


  private
    def set_item
      @item = Item.find(params[:id])

    end

    def item_params
      params.require(:item).permit(
        :name,
        :price,
        :details,
        :condition,
        :delivery_fee,
        :delivery_method,
        :delivery_location,
        :delivery_term,
        images_attributes: :image).merge(user_id: current_user.id)
    end

    def set_card
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      @cards = Array.new
      users_cards = current_user.credit_cards
      users_cards.each do |card|
        customer = Payjp::Customer.retrieve(card.user)
        @cards << user.cards.retrieve(card.card_number)
      end
    end
end
