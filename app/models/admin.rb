class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :id, :email, :encrypted_password, :created_at, :updated_at, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
