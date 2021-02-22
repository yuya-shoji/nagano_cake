class Address < ApplicationRecord
    belongs_to :customer
    def all_address
    "〒" + self.postal_code + " " + self.address + " " + self.name
    end
    validates :id, :customer_id, :name, :postal_code, :address, :created_at, :updated_at, presence: true
end
