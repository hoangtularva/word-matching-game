class Room < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: 'author_id'

  has_many :room_users
  has_many :room_settings
end
