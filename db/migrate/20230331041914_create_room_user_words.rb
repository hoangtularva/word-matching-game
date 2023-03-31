class CreateRoomUserWords < ActiveRecord::Migration[7.0]
  def change
    create_table :room_user_words do |t|
      t.references :word, foreign_key: true
      t.references :room_user, null: false, foreign_key: true
      t.text :text
      t.float :score
      t.integer :status
      t.integer :type_author
      

      t.timestamps
    end
  end
end
