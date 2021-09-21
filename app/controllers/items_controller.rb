class ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @customer = current_customer
    @genres = Genre.all
    @sell_items = Item.where(is_active: "true")
    @total_items = @sell_items
    if params[:content]
      content = params[:content]
      @items = @sell_items.where('name LIKE ?', "%#{content}%").page(params[:page]).per(6)
      @total_items = @sell_items.where('name LIKE ?', "%#{content}%")
    elsif params[:select_genre]
      @items = @sell_items.where(genre_id: params[:select_genre]).page(params[:page]).per(6)
      @total_items = @sell_items.where(genre_id: params[:select_genre])
    else
      @items = @sell_items.page(params[:page]).per(6)
    end
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
