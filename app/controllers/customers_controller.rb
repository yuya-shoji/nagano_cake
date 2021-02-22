class CustomersController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def unsubscribe
    @customer = Customer.find_by(params[:id])
  end

  def withdraw
     @customer = Customer.find_by(params[:id])
     @customer.update(is_deleted: false)
     reset_session
     redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :telephone_number, :email, :password, :postal_code, :address)
  end
end