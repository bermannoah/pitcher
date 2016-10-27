class Status < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  
  has_many :pitches
end