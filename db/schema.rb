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

ActiveRecord::Schema.define(version: 20141102141348) do

  create_table "cities", force: true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.float    "position_x", limit: 24
    t.float    "position_y", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "package_id"
    t.string   "body"
    t.integer  "parent_comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.integer  "city_form"
    t.integer  "city_to"
    t.float    "price",      limit: 24
    t.integer  "total_hour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "star"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_cities", force: true do |t|
    t.integer  "package_id"
    t.integer  "city_id"
    t.integer  "step"
    t.integer  "total_days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_flights", force: true do |t|
    t.integer  "package_id"
    t.integer  "flight_id"
    t.float    "price",      limit: 24
    t.integer  "total_hour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: true do |t|
    t.string   "discription"
    t.float    "total_amount",       limit: 24
    t.float    "discount",           limit: 24
    t.integer  "total_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "rooms", force: true do |t|
    t.integer  "hotel_id"
    t.float    "price_per_day", limit: 24
    t.integer  "maxi_people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
