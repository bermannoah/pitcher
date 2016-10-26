class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
  
  has_many :pitches
  
  has_secure_password
end
