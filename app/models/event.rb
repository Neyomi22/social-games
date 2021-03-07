class Event < ApplicationRecord
  #association
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # event picture
  has_one_attached :photo
  
  # validations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :sport, presence:true
  validates :duration, presence: true
end
