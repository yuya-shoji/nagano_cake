class OrdersController < ApplicationController

  def new
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

end
