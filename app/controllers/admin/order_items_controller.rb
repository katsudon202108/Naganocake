class Admin::OrderItemsController < Admin::AdminApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order_items = OrderItem.where(order_id: @order_item.order_id)
    @maked = @order_items.where(make_status: 'maked')
    if @order_item.make_status == "making" && @order_item.order.status == "check"
      @order_item.order.update(status: "making")
    elsif @maked.count == @order_items.count
      @order_item.order.update(status: "ready")
    end
    redirect_to admin_order_path(@order_item.order_id)
  end


  private
  def order_item_params
    params.require(:order_item).permit(:make_status, :order_id, :item_id, :quantity, :price)
  end


end
