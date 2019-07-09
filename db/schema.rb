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

ActiveRecord::Schema.define(version: 2019_07_09_190746) do

  create_table "competitors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.integer "weight_in_lbs"
    t.integer "height_in_inches"
    t.integer "reach_in_inches"
    t.integer "age"
    t.integer "wins"
    t.integer "losses"
  end

  create_table "events", force: :cascade do |t|
    t.text "date"
    t.string "city"
    t.string "state"
    t.string "venue"
    t.integer "attendance"
    t.integer "gate"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "event_id"
    t.integer "competitor_id"
  end

end
