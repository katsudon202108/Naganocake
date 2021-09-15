class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def caution
  end

  def hide
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

end
