class Admin::OrdersController < Admin::AdminApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :payment_way, :status, :name, :address, :postal_code)
  end

end
