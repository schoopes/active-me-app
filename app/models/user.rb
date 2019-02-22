class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :zip_code, presence: true

  has_many :favorites
end
