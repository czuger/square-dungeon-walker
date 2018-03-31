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

ActiveRecord::Schema.define(version: 20180331100832) do

  create_table "dungeon_data", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dungeon_instances", force: :cascade do |t|
    t.string "dungeon_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "difficulty", default: "medium", null: false
    t.integer "hero1_level", default: 1, null: false
    t.integer "hero2_level"
    t.integer "hero3_level"
    t.integer "hero4_level"
    t.integer "hero5_level"
    t.integer "hero6_level"
    t.integer "size", default: 5, null: false
  end

end
