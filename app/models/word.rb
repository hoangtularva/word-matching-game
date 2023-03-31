class Word < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  has_many :room_user_words

  validates :text, uniqueness: true
end
