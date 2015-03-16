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

ActiveRecord::Schema.define(version: 20150316054618) do

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "sat_min_score"
    t.integer  "sat_max_score"
    t.decimal  "tuition_fees"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "dob"
    t.string   "bio"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_colleges", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "dob"
    t.string   "current_school"
    t.string   "current_level"
    t.string   "country"
    t.integer  "sat_score"
    t.integer  "mentor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "sex"
  end

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "tuition_fees"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
