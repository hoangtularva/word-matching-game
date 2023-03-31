class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.text :text
      t.integer :type_word
      t.integer :status
      t.text :source

      t.timestamps
    end
  end
end
