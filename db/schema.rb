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

ActiveRecord::Schema.define(version: 20160505133429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "char_equips", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "char_equips", ["character_id"], name: "index_char_equips_on_character_id", using: :btree
  add_index "char_equips", ["equipment_id"], name: "index_char_equips_on_equipment_id", using: :btree

  create_table "char_skills", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "skill_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "char_skills", ["character_id"], name: "index_char_skills_on_character_id", using: :btree
  add_index "char_skills", ["skill_id"], name: "index_char_skills_on_skill_id", using: :btree

  create_table "char_stats", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "stat_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "char_stats", ["character_id"], name: "index_char_stats_on_character_id", using: :btree
  add_index "char_stats", ["stat_id"], name: "index_char_stats_on_stat_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "sheet_template_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "bio"
    t.integer  "player_id"
  end

  add_index "characters", ["player_id"], name: "index_characters_on_player_id", using: :btree
  add_index "characters", ["sheet_template_id"], name: "index_characters_on_sheet_template_id", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "damage"
    t.string   "category",     null: false
    t.string   "sub_category"
    t.string   "armor"
    t.string   "weight"
    t.string   "reach"
    t.string   "effects"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "to_user_id", null: false
    t.string   "status",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friends", ["to_user_id"], name: "index_friends_on_to_user_id", using: :btree
  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "game_sessions", force: :cascade do |t|
    t.string   "session_name", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "game_sessions", ["user_id"], name: "index_game_sessions_on_user_id", using: :btree

  create_table "game_sheets", force: :cascade do |t|
    t.integer  "sheet_template_id"
    t.integer  "game_session_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "game_sheets", ["game_session_id"], name: "index_game_sheets_on_game_session_id", using: :btree
  add_index "game_sheets", ["sheet_template_id"], name: "index_game_sheets_on_sheet_template_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_session_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "players", ["game_session_id"], name: "index_players_on_game_session_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "session_items", force: :cascade do |t|
    t.integer  "game_session_id"
    t.integer  "equipment_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "session_items", ["equipment_id"], name: "index_session_items_on_equipment_id", using: :btree
  add_index "session_items", ["game_session_id"], name: "index_session_items_on_game_session_id", using: :btree

  create_table "sheet_skills", force: :cascade do |t|
    t.integer  "sheet_template_id"
    t.integer  "skill_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sheet_skills", ["sheet_template_id"], name: "index_sheet_skills_on_sheet_template_id", using: :btree
  add_index "sheet_skills", ["skill_id"], name: "index_sheet_skills_on_skill_id", using: :btree

  create_table "sheet_stats", force: :cascade do |t|
    t.integer  "sheet_template_id"
    t.integer  "stat_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sheet_stats", ["sheet_template_id"], name: "index_sheet_stats_on_sheet_template_id", using: :btree
  add_index "sheet_stats", ["stat_id"], name: "index_sheet_stats_on_stat_id", using: :btree

  create_table "sheet_templates", force: :cascade do |t|
    t.string   "game_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "rank",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stats", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "rank",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "user_name",                         null: false
    t.string   "profile_pic"
    t.string   "name",                              null: false
    t.string   "phone_number"
    t.string   "email",                             null: false
    t.string   "encrypted_password",    limit: 128, null: false
    t.string   "confirmation_token",    limit: 128
    t.string   "remember_token",        limit: 128, null: false
    t.string   "password_confirmation"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "char_equips", "characters"
  add_foreign_key "char_equips", "equipment"
  add_foreign_key "char_skills", "characters"
  add_foreign_key "char_skills", "skills"
  add_foreign_key "char_stats", "characters"
  add_foreign_key "char_stats", "stats"
  add_foreign_key "characters", "sheet_templates"
  add_foreign_key "game_sheets", "game_sessions"
  add_foreign_key "game_sheets", "sheet_templates"
  add_foreign_key "players", "game_sessions"
  add_foreign_key "players", "users"
  add_foreign_key "session_items", "equipment"
  add_foreign_key "session_items", "game_sessions"
  add_foreign_key "sheet_skills", "sheet_templates"
  add_foreign_key "sheet_skills", "skills"
  add_foreign_key "sheet_stats", "sheet_templates"
  add_foreign_key "sheet_stats", "stats"
end
