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

ActiveRecord::Schema[7.1].define(version: 2024_04_30_025404) do
  create_table "calculation_results", force: :cascade do |t|
    t.string "room_id", null: false
    t.float "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_calculation_results_on_room_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "value"
    t.string "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_choices_on_player_id"
  end

  create_table "players", id: :string, force: :cascade do |t|
    t.string "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_players_on_room_id"
  end

  create_table "rooms", id: :string, force: :cascade do |t|
    t.string "password_for_join"
    t.date "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expired_at"], name: "index_rooms_on_expired_at"
  end

  add_foreign_key "calculation_results", "rooms"
  add_foreign_key "choices", "players"
  add_foreign_key "players", "rooms"
end
