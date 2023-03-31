class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.integer :type_room, default: 0

      t.timestamps
    end
  end
end
