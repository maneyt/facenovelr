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

ActiveRecord::Schema.define(version: 20140728180740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: true do |t|
    t.integer  "friender_id",                 null: false
    t.integer  "friendee_id",                 null: false
    t.boolean  "accepted",    default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "friendships", ["friendee_id"], name: "index_friendships_on_friendee_id", using: :btree
  add_index "friendships", ["friender_id", "friendee_id"], name: "index_friendships_on_friender_id_and_friendee_id", unique: true, using: :btree
  add_index "friendships", ["friender_id"], name: "index_friendships_on_friender_id", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "user_id",                   null: false
    t.string   "picture_file_file_name"
    t.string   "picture_file_content_type"
    t.integer  "picture_file_file_size"
    t.datetime "picture_file_updated_at"
    t.string   "description",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "thoughts", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "receiver_id", null: false
    t.string   "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "name",            null: false
    t.date     "birthday",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
