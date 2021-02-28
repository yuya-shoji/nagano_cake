class OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @addresses = current_customer.addresses.all
    @address = Address.new
    @order = Order.new
  end

  def confirm
   # @payment_method = params[:order][:payment].to_i
    obj = order_params
    obj[:payment_method] = obj[:payment_method].to_i
    #byebug
    @order = Order.new(obj)
    if params[:order][:select] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    else
      # @address = Address.new(address_params)
      # @address.customer_id = current_customer.id
    #   if @address.save
    #     @order.postal_code = @address.postal_code
    #     @order.name = @address.name
    #     @order.address = @address.address
    #   else
    #     render :new
    #   end
    end
    @cart_items = CartItem.where(customer_id:current_customer.id)
    @total = 0

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    current_customer.cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.item_id = cart_item.item_id
    @order_detail.amount = cart_item.amount
    @order_detail.price = cart_item.item.price
    @order_detail.making_status = 0
    @order_detail.order_id = @order.id
    @order_detail.save!
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @cart_items = CartItem.where(customer_id:current_customer.id)
    @total = 0
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status, :price)
  end

  def address_params
    params.require(:order).permit(:address, :postal_code, :name, :customer_id)
  end

end
