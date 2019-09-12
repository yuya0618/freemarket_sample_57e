class ItemsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!,except:[:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy, :purchase]
  before_action :set_card, only: [:buy, :complete]

  add_breadcrumb 'メルカリ', '/'

  def index
    @all_items = Item.all
    @items = Item.order("created_at DESC").limit(4)
    @women_items = Item.where(category_id:159..365).order("created_at DESC").limit(4)
    @mens_items = Item.where(category_id:357..500).order("created_at DESC").limit(4)
    @baby_items = Item.where(category_id:501..634).order("created_at DESC").limit(4)
    @interior_items = Item.where(category_id:635..774).order("created_at DESC").limit(4)
    @chanel_items = Item.where(brand_id:2447)
    .or(Item.where(brand_id:8376))
    .or(Item.where(brand_id:11783))
    .or(Item.where(brand_id:12826))
    .or(Item.where(brand_id:13618)).order("created_at DESC").limit(4)
    @nike_items = Item.where(brand_id:3813)
    .or(Item.where(brand_id:9489))
    .or(Item.where(brand_id:11906))
    .or(Item.where(brand_id:12912))
    .or(Item.where(brand_id:14771)).order("created_at DESC").limit(4)
    @vuitton_items = Item.where(brand_id:6155)
    .or(Item.where(brand_id:11287))
    .or(Item.where(brand_id:13052))
    .or(Item.where(brand_id:14448)).order("created_at DESC").limit(4)
    @supureme_items = Item.where(brand_id:8413).order("created_at DESC").limit(4)

  end

  def show
      add_breadcrumb @item.name
      @next = Item.where("id > ?", @item.id).order("id DESC").first
      @previous = Item.where("id < ?", @item.id).order("id ASC").first
      @items = Item.order("created_at DESC").limit(3)
      @images = @item.images.order("created_at DESC").limit(5)
      # @parent = Category.all.order("id ASC").limit(13)
      @parent = Category.where(ancestry:nil)

  end


  def new
    @item = Item.new
    @item.images.build
    @categories = Item.new
    @category_parent = Category.all.where(ancestry: nil)
    @category_children = Category.all.where(ancestry: '1')
    @category_gchildren = Category.all.where(ancestry: '1/14')
    @brands = Brand.all.limit(200)
  end


  def edit
    @categories = Item.new
    @category_parent = Category.all.where(ancestry: nil)
    @category_children = Category.all.where(ancestry: '1')
    @category_gchildren = Category.all.where(ancestry: '1/14')
    @brands = Brand.all.limit(200)
  end


  def create
    @item = Item.create!(item_params)
    @item.images.create!(image_params)
    redirect_to root_path, notice: '商品が投稿されました'
  end


  def update
    @item.update!(item_params)  if @item.user_id == current_user.id
    redirect_to item_path(@item)
  end


  def destroy
    @item.destroy if @item.user == current_user
    redirect_to list_user_path(current_user.id)
  end

  def search
    add_breadcrumb params[:q][:name_or_details_cont]
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

  def children
    @children = Category.find(params[:parentId].to_i).children
    respond_to do |format|
      format.html { redirect_to :root }
      format.js { render 'children.js.erb'}
    end
  end

  def gchildren
    @gchildren = Category.find(params[:childrenId].to_i).children
    respond_to do |format|
      format.html { redirect_to :root }
      format.js { render 'gchildren.js.erb'}
    end
  end

  def size
    if Category.find(params[:childrenId].to_i).categories_sizes != []
      ccat_sizes = Category.find(params[:childrenId].to_i).categories_sizes.map{|x| x[:size_id]}
      @size = Size.where(id: ccat_sizes)
      respond_to do |format|
        format.html { redirect_to :root }
        format.js { render 'size.js.erb'}
      end
    elsif Category.find(params[:gchildrenId].to_i).categories_sizes != []
      gcat_sizes = Category.find(params[:gchildrenId].to_i).categories_sizes.map{|x| x[:size_id]}
      @size = Size.where(id: gcat_sizes)
      respond_to do |format|
        format.html { redirect_to :root }
        format.js { render 'size.js.erb'}
      end
    else
    end
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
        :category_id,
        :size_id,
        :brand_id,
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
