class User < ApplicationRecord
  has_many :words
  has_many :rooms
  has_many :room_users
end
