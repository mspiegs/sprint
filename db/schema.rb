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

ActiveRecord::Schema.define(version: 20140313042827) do

  create_table "comments", force: true do |t|
    t.text     "details"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sprint_length"
    t.date     "start_date"
    t.integer  "start_number"
    t.string   "duration_number"
    t.string   "duration_length"
  end

  create_table "projects_users", force: true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "settings", force: true do |t|
    t.integer  "duration_number"
    t.string   "duration_length"
    t.date     "start_date"
    t.integer  "start_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "sprintblocks", force: true do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.integer  "project_id"
  end

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "audience"
    t.string   "want"
    t.string   "because"
    t.string   "estimate"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "project_id"
    t.integer  "sprintblock_id"
    t.integer  "sprint_number"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
