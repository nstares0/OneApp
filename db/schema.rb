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

ActiveRecord::Schema.define(version: 20150310221802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "artist_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "url"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "deviseusers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deviseusers", ["email"], name: "index_deviseusers_on_email", unique: true, using: :btree
  add_index "deviseusers", ["reset_password_token"], name: "index_deviseusers_on_reset_password_token", unique: true, using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "dimensions"
    t.string   "medium"
    t.integer  "artist_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "url"
    t.integer  "price"
    t.datetime "reservation_time"
    t.datetime "purchased_date"
  end

  create_table "items_deviseusers", force: :cascade do |t|
    t.integer  "deviseuser_id"
    t.integer  "item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "items_deviseusers", ["deviseuser_id"], name: "index_items_deviseusers_on_deviseuser_id", using: :btree
  add_index "items_deviseusers", ["item_id"], name: "index_items_deviseusers_on_item_id", using: :btree

  add_foreign_key "items_deviseusers", "deviseusers"
  add_foreign_key "items_deviseusers", "items"
end
