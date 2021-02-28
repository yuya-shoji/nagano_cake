class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details
    validates :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, presence:true
    enum payment_method: {
        クレジットカード: 0,
        銀行振込: 1
    }
end
