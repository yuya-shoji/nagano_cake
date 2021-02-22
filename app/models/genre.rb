class Genre < ApplicationRecord
    has_many :items
    validates :id, :name, :created_at, :updated_at, presence: true
end
