class RemoveShippingFeeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipping_fee, :string
  end
end
