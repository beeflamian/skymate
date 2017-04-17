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

ActiveRecord::Schema.define(version: 20170415001909) do

  create_table "flight_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "aircraft"
    t.string   "company"
    t.string   "departing_from"
    t.string   "arriving"
    t.string   "duration"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "flights", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "itineraries_id"
    t.datetime "departing_time"
    t.datetime "arriving_time"
    t.string   "seat"
    t.string   "flight_class"
    t.boolean  "wifi"
    t.string   "power"
    t.float    "price",          limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["itineraries_id"], name: "index_flights_on_itineraries_id", using: :btree
  end

  create_table "flights_flight_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "flights_id"
    t.integer  "flight_details_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["flight_details_id"], name: "index_flights_flight_details_on_flight_details_id", using: :btree
    t.index ["flights_id"], name: "index_flights_flight_details_on_flights_id", using: :btree
  end

  create_table "itineraries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "trip_resquests_id"
    t.date     "departing_date"
    t.date     "return_date"
    t.float    "price",             limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["trip_resquests_id"], name: "index_itineraries_on_trip_resquests_id", using: :btree
  end

  create_table "itinerary_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "itineraries_id"
    t.integer  "first_flight"
    t.integer  "second_flight"
    t.integer  "third_flight"
    t.integer  "fourth_flight"
    t.integer  "fifth_flight"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["itineraries_id"], name: "index_itinerary_details_on_itineraries_id", using: :btree
  end

  create_table "trip_resquests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "roundtrip",                                      null: false
    t.string   "departing_from",                                 null: false
    t.string   "destination",                                    null: false
    t.datetime "start_departing_date",                           null: false
    t.datetime "end_departing_date",                             null: false
    t.datetime "start_return_date"
    t.datetime "end_return_date"
    t.integer  "adult_number",                       default: 1, null: false
    t.integer  "infant_number",                      default: 0, null: false
    t.string   "priority",                                       null: false
    t.string   "statue",                                         null: false
    t.text     "note",                 limit: 65535
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
