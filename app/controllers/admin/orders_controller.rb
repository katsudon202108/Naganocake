class Admin::OrdersController < Admin::AdminApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
<<<<<<< HEAD
    @order_item = @order.order_items
=======
    @order_item = OrderItem.all
>>>>>>> origin/develop
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "check"
      @order.order_items.update_all(make_status: OrderItem.make_statuses[:wait])
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :payment_way, :status, :name, :address, :postal_code)
  end

end
