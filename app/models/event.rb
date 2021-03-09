class Event < ApplicationRecord
  #association
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # event picture
  has_one_attached :photo
  
  #longitude and latitude
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  
  # validations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :starts_at, presence: true
  validates :location, presence: true
  validates :sport, presence:true
  validates :duration, presence: true
  

end
