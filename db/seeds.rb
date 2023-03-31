user = User.create! email: "test@email.com"
words = ["cành lá", "lá cây", "sáng tạo", "sáng chế", "chế tác", "heo con", "con heo", "heo quay", "xinh đẹp", "đẹp đẽ", "hào hoa", "hoa hậu", "hậu hĩnh"]
words.each do |word|
  Word.create! author: user, text: word
end
room = Room.create!(name: "Room 1", author: user)
room_user = room.room_users.create!(user_id: user.id)
