class CreateRoomSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :room_settings do |t|
      t.references :room, null: false, foreign_key: true
      t.float :points_per_turn

      t.timestamps
    end
  end
end
