class Booking < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :event
  
  # validations
  validates :user_id, presence: true, uniqueness: { scope: :event_id }
  validates :event_id, presence: true

  validate :max_participants_validation

  def max_participants_validation
    if event.bookings.count >= event.number_of_participants
      errors.add(:base, "Fully booked")
    end
  end
end
