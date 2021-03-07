class Booking < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :event
  
  # validations
  validates :user_id, presence: true, uniqueness: { scope: :event_id }
  validates :event_id, presence: true

end
