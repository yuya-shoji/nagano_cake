class RemoveShippingPostalCodeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipping_postal_code, :string
  end
end
