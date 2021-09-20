class Admin::OrderItemsController < Admin::AdminApplicationController
  def update
    @order_item = OrderItem.find_by(item_id: params[:order_item][:item_id])
    @order_item.update(order_params)
    redirect_to admin_orders_path
  end

  private
  def order_params
    params.require(:order_item).permit(:item_id, :order_id, :quantity, :price, :make_status)
  end
end
