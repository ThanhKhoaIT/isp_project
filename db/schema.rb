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

ActiveRecord::Schema.define(version: 20141112231558) do

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "package_id"
    t.float    "price",      limit: 24
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.float    "total",      limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.float    "position_x",   limit: 24
    t.float    "position_y",   limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_name"
  end

  create_table "cities_packages", force: true do |t|
    t.integer  "city_id"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "package_id"
    t.text     "body"
    t.integer  "parent_comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.boolean  "viewed",     default: false
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
    t.integer  "city_from_id"
    t.integer  "city_to_id"
    t.float    "price",        limit: 24
    t.integer  "total_hour"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_use"
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
    t.string   "description"
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

  create_table "requests", force: true do |t|
    t.string   "cities"
    t.string   "flights"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "approved",   default: false
  end

  create_table "rooms", force: true do |t|
    t.integer  "hotel_id"
    t.float    "price_per_day", limit: 24
    t.integer  "maxi_people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.boolean  "active"
    t.string   "token_active"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
