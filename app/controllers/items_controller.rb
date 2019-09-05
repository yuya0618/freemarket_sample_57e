class ItemsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!,except:[:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy, :purchase]
  before_action :set_card, only: [:buy, :complete]

  add_breadcrumb 'メルカリ', '/'

  def index
    @items = Item.order("created_at DESC").limit(4)

  end


  def show
    add_breadcrumb @item.name
    @next = Item.where("id > ?", @item.id).order("id DESC").first
    @previous = Item.where("id < ?", @item.id).order("id ASC").first
    @items = Item.order("created_at DESC").limit(3)
    @images = @item.images.order("created_at DESC").limit(5)
  end


  def new
    add_breadcrumb '商品出品'
    @item = Item.new
    @item.images.build
    @categories = Item.new
    @category_parent = Category.all.limit(13)
  end


  def edit
    add_breadcrumb '商品情報編集'
  end


  def create
    binding.pry
    @item = Item.create!(item_params)
    @item.images.create!(image_params)
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
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer,
      currency: 'jpy'
    )
      #TODO秋葉 db追加後、追記する
      # @item.update(order_status: true, buyer_id: current_user.id)
      redirect_to complete_item_path(@item)
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

    def image_params
      params.require(:images).permit({image: []})
    end

    def set_card
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      @cards = Array.new
      users_cards = current_user.credit_cards
      users_cards.each do |card|
        customer = Payjp::Customer.retrieve(card.customer)
        @cards << customer.cards.retrieve(card.card)
      end
    end
end
