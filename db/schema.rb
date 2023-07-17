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

ActiveRecord::Schema[7.0].define(version: 2023_07_13_190152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concert_halls", force: :cascade do |t|
    t.integer "concert_id"
    t.string "hall_name"
    t.text "city_name"
    t.datetime "date"
    t.integer "total_seats"
    t.integer "reserved_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.string "name"
    t.string "band"
    t.text "description"
    t.string "artist"
    t.text "image"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "concert_hall_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.string "password"
    t.string "password_confirmation"
    t.string "password_digest"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  end

end
