class RoomUserWord < ApplicationRecord
  belongs_to :room_user
  belongs_to :word, optional: true

  enum status: {incorrect: 0, correct: 1}
  enum type_author: {robot: 0, human: 1}
end
