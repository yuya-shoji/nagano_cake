class Address < ApplicationRecord
    belongs_to :customer
    def all_address
    "〒" + self.postal_code + " " + self.address + " " + self.name
    end
    validates :postal_code, :address, :name, presence: true
end
