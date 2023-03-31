class StaticPagesController < ApplicationController
  def home
    @room_user = RoomUser.last
    @room_user_words = @room_user.room_user_words
  end

  def start_game
    if params[:text].present?
      check_word = Word.find_by(text: params[:text]).present?
      room_user = RoomUser.last
      last_room_user_words = room_user.room_user_words.where(status: :correct, type_author: :robot).order(created_at: :desc).first&.text&.split(" ")&.last
      first_input = room_user.room_user_words.where(status: :correct, type_author: :robot).blank?
      check_condition = check_word and (first_input or params[:text].downcase.split(" ").first == last_room_user_words) 
      room_user.room_user_words.create!(room_user_id: room_user.id, text: params[:text].downcase, status: check_condition ? :correct : :incorrect, type_author: :human)
      if check_condition
        # words = Word.where("text like '%?%'", params[:text].downcase.split(" ").last)
        words = Word.all
        compare_word = words.map do |word|
          word.text.downcase if word.text.downcase.split(" ").first == params[:text].downcase.split(" ").last
        end
        if compare_word.compact_blank.present?
        room_user.room_user_words.create!(room_user_id: room_user.id, text: compare_word.compact_blank.sample, status: :correct, type_author: :robot)      
        end
      end
    end
    redirect_to root_path
  end

  def reset_game
    room_user = RoomUser.last
    room_user.room_user_words.destroy_all
    redirect_to root_path
  end
end
