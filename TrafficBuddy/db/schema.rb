# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150330050936) do

  create_table "lat_lons", force: true do |t|
    t.decimal  "latitude",         precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",        precision: 15, scale: 10, default: 0.0
    t.integer  "traffic_event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lat_lons", ["traffic_event_id"], name: "index_lat_lons_on_traffic_event_id", using: :btree

  create_table "planned_trips", force: true do |t|
    t.string   "start_loc"
    t.string   "end_loc"
    t.decimal  "start_lat",  precision: 15, scale: 10, default: 0.0
    t.decimal  "start_lon",  precision: 15, scale: 10, default: 0.0
    t.decimal  "end_lat",    precision: 15, scale: 10, default: 0.0
    t.decimal  "end_lon",    precision: 15, scale: 10, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "planned_trips", ["user_id"], name: "index_planned_trips_on_user_id", using: :btree

  create_table "traffic_events", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.time     "updatetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.decimal  "latitude",        precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",       precision: 15, scale: 10, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
