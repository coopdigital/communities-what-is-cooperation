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

ActiveRecord::Schema.define(version: 20171220104153) do

  create_table "activities", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.integer "submission_id", null: false
    t.integer "activity_id", null: false
    t.integer "position", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "postcode", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "uuid", null: false
    t.text "involvement"
    t.integer "distance"
    t.string "distance_mode"
    t.boolean "this_1"
    t.boolean "finished", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
