# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_31_041914) do
  create_table "messages", force: :cascade do |t|
    t.integer "room_user_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_user_id"], name: "index_messages_on_room_user_id"
  end

  create_table "room_settings", force: :cascade do |t|
    t.integer "room_id", null: false
    t.float "points_per_turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_settings_on_room_id"
  end

  create_table "room_user_words", force: :cascade do |t|
    t.integer "word_id"
    t.integer "room_user_id", null: false
    t.text "text"
    t.float "score"
    t.integer "status"
    t.integer "type_author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_user_id"], name: "index_room_user_words_on_room_user_id"
    t.index ["word_id"], name: "index_room_user_words_on_word_id"
  end

  create_table "room_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "author_id", null: false
    t.string "name"
    t.integer "type_room", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_rooms_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.integer "role"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.integer "author_id", null: false
    t.text "text"
    t.integer "type_word", default: 0
    t.integer "status", default: 0
    t.text "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_words_on_author_id"
  end

  add_foreign_key "messages", "room_users"
  add_foreign_key "room_settings", "rooms"
  add_foreign_key "room_user_words", "room_users"
  add_foreign_key "room_user_words", "words"
  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
  add_foreign_key "rooms", "users", column: "author_id"
  add_foreign_key "words", "users", column: "author_id"
end
