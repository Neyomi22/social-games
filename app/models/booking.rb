class Booking < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :event
  
  # validations
  validates :user_id, presence: true
  validates :event_id, presence: true, uniqueness: {scope: :user_id}

  validate :max_participants_validation

  def max_participants_validation
    if event.bookings.count >= event.number_of_participants
      errors.add(:base, "Fully booked")
    end
  end
end
