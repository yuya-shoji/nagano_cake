class AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def update
  end

  def destroy
  end

private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address, :email)
  end

end
