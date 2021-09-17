class OrdersController < ApplicationController
  before_action :set_current_customer

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.where(customer_id: @customer.id)
    # 全ての商品×個数の和に消費税を掛けた値(合計金額)
    @total_price = (@cart_items.map { |cart_item| cart_item.item.price * cart_item.quantity }.sum * 1.08).floor
    # 現在の住所を使う場合
    if params[:now_address].present?
      @order = Order.new(
        postal_code: @customer.postal_code,
        address: @customer.address,
        name: @customer.last_name + @customer.first_name,
        payment_way: params[:order][:payment_way]
      )
    # 配送先登録した住所を使う場合
    elsif params[:select_address].present?
      address =  Address.find_by(id: params[:select]) # params[:select]は選択した住所のid
      @order = Order.new(
        postal_code: address.postal_code,
        address: address.address,
        name: address.name,
        payment_way: params[:order][:payment_way]
      )
    # 新しく住所を追加する場合
    elsif params[:new_address].present?
      @order = Order.new(order_params)
    else
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # 注文商品テーブルのレコードを作成
      @customer.cart_items.map do |cart_item|
        OrderItem.create(
          order_id: @order.id,
          item_id: cart_item.item_id,
          quantity: cart_item.quantity,
          make_status: 'cannot',
          price: (cart_item.item.price * 1.08).floor
        )
      end
      # カートアイテムを空にする
      @customer.cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      render :confirm
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = @customer.orders
  end

  def thanks

  end

  private

  def set_current_customer
    @customer = current_customer
  end

  def order_params
    params.require(:order)
    .permit(:postal_code, :address, :name, :postage, :total_price, :payment_way, :status)
    .merge(customer_id: current_customer.id)
  end
end
