class Admin::OrdersController < Admin::AdminApplicationController

  def index
    @orders = Order.all
  end

  def show
    
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @item.update(item_params)
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :payment_way, :status, :name, :address, :postal_code, ordered_items_attributes:[:id])
  end

end
