class RemoveBillingAmountFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :billing_amount, :string
  end
end
