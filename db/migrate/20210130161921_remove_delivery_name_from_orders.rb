class RemoveDeliveryNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_name, :string
  end
end
