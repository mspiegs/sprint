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

ActiveRecord::Schema.define(version: 20140129045252) do

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

end
