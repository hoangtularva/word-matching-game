class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.text :text
      t.integer :type_word, default: 0
      t.integer :status, default: 0
      t.text :source

      t.timestamps
    end
  end
end
