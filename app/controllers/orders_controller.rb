class OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
  end

  def confirm

  end

  def create

  end

  def show

  end

  def index

  end

  def thanks

  end
end
