class Booking < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :event
  
  # validations
  validates :user_id, presence: true
  validates :event_id, presence: true, uniqueness: {scope: :user_id}

end
