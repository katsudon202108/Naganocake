class AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses
      render :index
    end
  end

  def edit
    @customer = current_customer
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name).merge(customer_id: current_customer.id)
  end
end
