class Admin::OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_order_path
    end

    private
    def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
    end
end

