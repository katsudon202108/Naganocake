class HomesController < ApplicationController
  def top
    @customer = current_customer
    @items = Item.latest
  end
  def about
    @customer = current_customer
  end
end
