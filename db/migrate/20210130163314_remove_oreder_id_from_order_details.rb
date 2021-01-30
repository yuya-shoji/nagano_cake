class RemoveOrederIdFromOrderDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :oreder_id, :integer
  end
end
