class ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @customer = current_customer
    @genres = Genre.all
    if params[:content]
      content = params[:content]
      @items = Item.where('name LIKE ?', "%#{content}%").page(params[:page])
      @total_items = Item.where('name LIKE ?', "%#{content}%")
    elsif params[:select_genre]
      @items = Item.where(genre_id: params[:select_genre]).page(params[:page])
      @total_items = Item.where(genre_id: params[:select_genre])
    else
      @items = Item.page(params[:page])
      @total_items = Item.all
    end

  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
