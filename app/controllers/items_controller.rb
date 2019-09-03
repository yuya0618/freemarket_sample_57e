class ItemsController < ApplicationController
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
  end


  def edit
    add_breadcrumb '商品情報編集'
  end


  def create
    @item = Item.create!(item_params)
    redirect_to root_path
  end


  def update
    # TODO秋葉 １をcurrent_user.idにする
    @item.update(item_params)  if @item.user_id == 1
    redirect_to item_path(@item)
  end


  def destroy
    # TODO秋葉 1をcurrent_user.idにする
    @item.destroy if @item.user_id == 1
    redirect_to list_users_path
  end

  def buy
  end

  def purchase
    # TODO秋葉 User.find(1)をcurrent_userにする
    cards = User.find(1).credit_card
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
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :details, :condition, :delivery_fee, :delivery_method, :delivery_location, :delivery_term, images_attributes: :image).merge(user_id: 1)
    end

    def set_card
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      @cards = Array.new
      # TODO 秋葉User.find(1)をcurrent_userにする
      users_cards = User.find(1).cards
      users_cards.each do |card|
        customer = Payjp::Customer.retrieve(card.customer)
        @cards << customer.cards.retrieve(card.card)
      end
    end

end