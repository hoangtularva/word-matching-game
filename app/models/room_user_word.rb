class RoomUserWord < ApplicationRecord
  belongs_to :room_user
  belongs_to :word
end
