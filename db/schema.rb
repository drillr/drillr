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

ActiveRecord::Schema.define(version: 20151128183017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "point_value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "answers", force: :cascade do |t|
    t.text     "body"
    t.integer  "drill_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["drill_id"], name: "index_answers_on_drill_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drill_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "drill_groups", ["category_id"], name: "index_drill_groups_on_category_id", using: :btree

  create_table "drills", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "drill_group_id"
    t.integer  "base_points"
    t.integer  "skill_level"
    t.text     "hint"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "drills", ["drill_group_id"], name: "index_drills_on_drill_group_id", using: :btree

  create_table "selected_drills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drill_id"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "selected_drills", ["drill_id"], name: "index_selected_drills_on_drill_id", using: :btree
  add_index "selected_drills", ["user_id"], name: "index_selected_drills_on_user_id", using: :btree

  create_table "solutions", force: :cascade do |t|
    t.integer  "drill_id"
    t.text     "body"
    t.string   "match_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "solutions", ["drill_id"], name: "index_solutions_on_drill_id", using: :btree

  create_table "user_achievements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "achievement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_achievements", ["achievement_id"], name: "index_user_achievements_on_achievement_id", using: :btree
  add_index "user_achievements", ["user_id"], name: "index_user_achievements_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "points"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "drills"
  add_foreign_key "answers", "users"
  add_foreign_key "drill_groups", "categories"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "selected_drills", "drills"
  add_foreign_key "selected_drills", "users"
  add_foreign_key "solutions", "drills"
  add_foreign_key "user_achievements", "achievements"
  add_foreign_key "user_achievements", "users"
end
