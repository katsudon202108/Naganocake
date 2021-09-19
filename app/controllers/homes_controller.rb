class HomesController < ApplicationController
  def top
    @customer = current_customer
    @items = Item.latest
    @genres = Genre.all
  end
  def about
    @customer = current_customer
  end
end
