class OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
    @addresses = Address.all.map do |address|
      { name: address.name, address: address.address, postal_code: address.postal_code }
    end
  end

  def confirm
    @customer = current_customer
    if params[:now_address].present?
      @order = Order.new(postal_code: @customer.postal_code, address: @customer.address, name: @customer.last_name + @customer.first_name, payment_way: params[:payment_way])
    elsif params[:select_address].present?
      address =  Address.find_by(id: params[:select])
      @order = Order.new(postal_code: address.postal_code, address: address.address, name: address.name)
    elsif params[:new_address].present?
      @order = Order.new(order_params)
    else
      render :new
    end
  end

  def create

  end

  def show

  end

  def index

  end

  def thanks

  end

  private

  # def current_customer_record
  #   @customer = current_customer
  # end

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_way).merge(customer_id: current_customer.id)
  end
end
