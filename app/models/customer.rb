class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :addresses
  has_many :orders
  has_many :cart_items
  validates :id, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted, :created_at, :updated_at ,presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
