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

ActiveRecord::Schema.define(version: 20160521164319) do

  create_table "assignment_trackings", force: :cascade do |t|
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.string   "topic"
    t.text     "solution"
    t.string   "git_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.text     "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.string   "course_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "course_cost"
  end

  create_table "courses_videos", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "video_id"
  end

  add_index "courses_videos", ["course_id", "video_id"], name: "courses_videos_index", unique: true

  create_table "keys", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_tackings", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "student_id"
    t.string   "git_url"
    t.string   "key"
    t.string   "value"
    t.text     "completed"
    t.text     "remaining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "student_courses", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "college"
    t.string   "branch"
    t.integer  "year"
    t.text     "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "experience"
    t.string   "field"
    t.text     "address"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "videos", force: :cascade do |t|
    t.string   "url"
    t.string   "video_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
