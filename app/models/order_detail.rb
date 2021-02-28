class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    validates :price, :amount, presence: true
end
