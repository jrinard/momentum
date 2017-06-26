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

ActiveRecord::Schema.define(version: 20170621194012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "leaderName"
    t.integer  "part_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "date"
    t.time     "starttime"
    t.time     "endtime"
    t.string   "locationname"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.boolean  "recurring"
    t.integer  "attendance"
    t.integer  "volunteers"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "title"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "allergies"
    t.string   "parent"
    t.date     "birthdate"
    t.boolean  "backcheck"
    t.string   "notes"
    t.boolean  "member"
    t.boolean  "leader"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "part_id"
    t.string   "need"
    t.string   "position2"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_positions_on_department_id", using: :btree
    t.index ["part_id"], name: "index_positions_on_part_id", using: :btree
  end

  create_table "revent_exceptions", force: :cascade do |t|
    t.integer  "revent_id"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["revent_id"], name: "index_revent_exceptions_on_revent_id", using: :btree
  end

  create_table "revents", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.text     "recurring"
    t.string   "description"
    t.string   "locationname"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.integer  "attendance"
    t.integer  "volunteers"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "spectators", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "revent_id"
    t.integer  "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_spectators_on_event_id", using: :btree
    t.index ["part_id"], name: "index_spectators_on_part_id", using: :btree
    t.index ["revent_id"], name: "index_spectators_on_revent_id", using: :btree
  end

  create_table "units", force: :cascade do |t|
    t.string   "familyname"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "phonePrimary"
    t.string   "phoneSecondary"
    t.string   "emailPrimary"
    t.string   "emailSecondary"
    t.string   "notes"
    t.integer  "user_id"
    t.string   "accountOwner"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "family_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "positions", "departments"
  add_foreign_key "positions", "parts"
  add_foreign_key "revent_exceptions", "revents"
  add_foreign_key "spectators", "events"
  add_foreign_key "spectators", "parts"
  add_foreign_key "spectators", "revents"
end
