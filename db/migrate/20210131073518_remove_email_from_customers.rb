class RemoveEmailFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :email, :string
  end
end
