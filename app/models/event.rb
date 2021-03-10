class Event < ApplicationRecord
  # Call back after create
  
  #association
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  
  # event picture
  has_many_attached :photos
  
  #longitude and latitude
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  
  after_create :create_chatroom
  # validations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :starts_at, presence: true
  validates :location, presence: true
  validates :number_of_participants, presence: true
  validates :skill_level, presence: true 
  validates :sport, presence:true
  validates :duration, presence: true
  
  private

  def create_chatroom
    Chatroom.create(event_id: self.id)
  end
end
