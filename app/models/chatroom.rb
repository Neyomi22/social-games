class Chatroom < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :event
    # has_many :users, through: :messages
end
