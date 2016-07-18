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

ActiveRecord::Schema.define(version: 20160615010357) do

  create_table "bookings", force: :cascade do |t|
    t.string   "host"
    t.string   "capacity"
    t.integer  "opening_id"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "checked",     default: false
    t.boolean  "approved"
  end

  create_table "openings", force: :cascade do |t|
    t.integer  "timeslot_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "openings", ["timeslot_id"], name: "index_openings_on_timeslot_id"
  add_index "openings", ["venue_id"], name: "index_openings_on_venue_id"

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "photo"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "admin",            default: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
