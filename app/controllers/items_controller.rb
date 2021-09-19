class ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @customer = current_customer
    @items = Item.page(params[:page])
    @total_items = Item.all
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
