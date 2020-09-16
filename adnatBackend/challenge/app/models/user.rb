class User < ApplicationRecord
  has_secure_password
  has_many :organizations
  
  validates :email, presence: true, uniqueness: true
end
