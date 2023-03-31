class CreateRoomUserWords < ActiveRecord::Migration[7.0]
  def change
    create_table :room_user_words do |t|
      t.references :word, null: false, foreign_key: true
      t.references :room_user, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
