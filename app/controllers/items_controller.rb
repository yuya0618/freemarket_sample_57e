class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'メルカリ', '/'

  # GET /items
  # GET /items.json
  def index
    @items = Item.order("created_at DESC").limit(4)
    # binding.pry
  end

  # GET /items/1
  # GET /items/1.json
  def show

  add_breadcrumb @item.name

  @next = Item.where("id > ?", @item.id).order("id DESC").first
  @previous = Item.where("id < ?", @item.id).order("id ASC").first

  @items = Item.order("created_at DESC").limit(3)
  @images = @item.images.order("created_at DESC").limit(5)

  end

  # GET /items/new
  def new
    add_breadcrumb '商品出品'
    @item = Item.new
    @categories = Item.new
  end

  # GET /items/1/edit
  def edit
    add_breadcrumb '商品情報編集'
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.create
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    # TODO 1をcurrent_user.idにする
    @item.destroy if @item.user_id == 1
    redirect_to list_users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.fetch(:item, {})
    end
end