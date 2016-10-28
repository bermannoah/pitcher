class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
  
  has_many :pitches
  
  has_secure_password
  
  def collect_statuses(user)
    status_array = []  
    user.pitches.each do |pitch|
      status_array << pitch.status.id
    end
    status_finder(status_array)
  end
  
  def status_finder(status_array)
    found_statuses = []
    status_array.each do |status|
      found_statuses << Status.find(status)
    end
    found_statuses
  end
end
