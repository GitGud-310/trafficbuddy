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

ActiveRecord::Schema.define(version: 20150306015116) do

  create_table "lat_lons", force: true do |t|
    t.decimal  "latitude",         precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",        precision: 15, scale: 10, default: 0.0
    t.integer  "traffic_event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lat_lons", ["traffic_event_id"], name: "index_lat_lons_on_traffic_event_id", using: :btree

  create_table "traffic_events", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.time     "updatetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
