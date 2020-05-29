# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_29_025411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_airports_on_code"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "flight_id"
    t.bigint "passenger_id"
    t.integer "cost"
    t.integer "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["passenger_id"], name: "index_bookings_on_passenger_id"
  end

  create_table "bookings_passengers", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "passenger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_bookings_passengers_on_booking_id"
    t.index ["passenger_id"], name: "index_bookings_passengers_on_passenger_id"
  end

  create_table "flights", force: :cascade do |t|
    t.bigint "to_id"
    t.bigint "from_id"
    t.integer "cost"
    t.integer "passenger_capacity"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_flights_on_from_id"
    t.index ["to_id"], name: "index_flights_on_to_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "passengers"
  add_foreign_key "bookings_passengers", "bookings"
  add_foreign_key "bookings_passengers", "passengers"
  add_foreign_key "flights", "airports", column: "from_id"
  add_foreign_key "flights", "airports", column: "to_id"
end
