class Item < ApplicationRecord
    attachment :image
    belongs_to :genre
    has_many :cart_items
    has_many :order_details
    validates :name, :price, :is_active, presence: true
end
