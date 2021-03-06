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

ActiveRecord::Schema.define(version: 6) do

  create_table "fighters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "weight_class"
    t.integer "wins"
    t.integer "losses"
    t.integer "statid"
    t.integer "draws"
    t.string "fighter_status"
    t.boolean "title_holder"
    t.text "thumbnail"
    t.text "belt_thumbnail"
    t.integer "rating"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "fighter_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.integer "wins"
    t.integer "losses"
    t.boolean "have_fought_before?"
    t.integer "rating"
  end

end
