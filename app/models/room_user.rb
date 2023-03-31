class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :messages
  has_many :room_user_words
end
