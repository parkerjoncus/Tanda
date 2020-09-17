class User < ApplicationRecord
  has_secure_password
  has_many :organizations
  has_many :shifts
  
  validates :email, presence: true, uniqueness: true
end
