class CartItemsController < ApplicationController
  def index
    @customer = current_customer
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items
      if @cart_items.find_by(item_id: params[:item_id]).present?
        cart_item = @cart_items.find_by(item_id: params[:item_id])
        cart_item.quantity += params[:quantity].to_i
        cart_item.save
        @cart_item.delete
      end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find_by(item_id: params[:item_id])
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
