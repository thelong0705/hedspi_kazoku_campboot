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

ActiveRecord::Schema.define(version: 2018_10_15_135533) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "representative_name"
    t.string "representative_role"
    t.datetime "foundation"
    t.boolean "vietnam_representative"
    t.text "business_content"
    t.string "code_language"
    t.integer "work_time"
    t.integer "work_hour"
    t.string "appeal"
    t.text "other"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compensations", force: :cascade do |t|
    t.integer "company_id"
    t.string "insurance"
    t.string "holiday"
    t.integer "paid_holidays"
    t.integer "holidays_no"
    t.integer "annual_salary"
    t.integer "month_salary"
    t.integer "bonus"
    t.integer "pay_rise"
    t.string "housing_allowance"
    t.string "commuting_allowance"
    t.text "other_allowance"
    t.string "retirement"
    t.text "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruits", force: :cascade do |t|
    t.integer "company_id"
    t.string "work_type"
    t.integer "employee_no"
    t.text "work_place"
    t.boolean "gender"
    t.text "applicable_student"
    t.string "japanese_level"
    t.string "english_level"
    t.text "job_description"
    t.string "personality_desired"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "picture"
    t.integer "gender"
    t.string "school"
    t.integer "school_year"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
