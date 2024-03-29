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

ActiveRecord::Schema.define(version: 2020_07_02_003832) do

  create_table "calcdata", force: :cascade do |t|
    t.integer "classnum"
    t.string "gradekind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "s"
    t.string "a"
    t.string "b"
    t.string "c"
    t.string "d"
  end

  create_table "seccalcs", force: :cascade do |t|
    t.integer "s"
    t.integer "a"
    t.integer "b"
    t.integer "c"
    t.integer "d"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
