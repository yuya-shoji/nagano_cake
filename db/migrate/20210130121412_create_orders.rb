class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :delivery_name
      t.string :shipping_fee
      t.string :billing_amount
      t.integer :payment_method
      t.boolean :is_active
      t.timestamps
    end
  end
end
