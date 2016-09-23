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

ActiveRecord::Schema.define(version: 20160923154411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree
  end

  create_table "candidate_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "points_confirmed"
    t.integer  "points_rejected"
    t.integer  "points_success"
    t.integer  "points_failure"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "icon_unknown_file_name"
    t.string   "icon_unknown_content_type"
    t.integer  "icon_unknown_file_size"
    t.datetime "icon_unknown_updated_at"
    t.string   "icon_negative_confirmed_file_name"
    t.string   "icon_negative_confirmed_content_type"
    t.integer  "icon_negative_confirmed_file_size"
    t.datetime "icon_negative_confirmed_updated_at"
    t.string   "icon_negative_rejected_file_name"
    t.string   "icon_negative_rejected_content_type"
    t.integer  "icon_negative_rejected_file_size"
    t.datetime "icon_negative_rejected_updated_at"
    t.string   "icon_negative_unknown_file_name"
    t.string   "icon_negative_unknown_content_type"
    t.integer  "icon_negative_unknown_file_size"
    t.datetime "icon_negative_unknown_updated_at"
    t.string   "icon_positive_confirmed_file_name"
    t.string   "icon_positive_confirmed_content_type"
    t.integer  "icon_positive_confirmed_file_size"
    t.datetime "icon_positive_confirmed_updated_at"
    t.string   "icon_positive_rejected_file_name"
    t.string   "icon_positive_rejected_content_type"
    t.integer  "icon_positive_rejected_file_size"
    t.datetime "icon_positive_rejected_updated_at"
    t.string   "icon_positive_unknown_file_name"
    t.string   "icon_positive_unknown_content_type"
    t.integer  "icon_positive_unknown_file_size"
    t.datetime "icon_positive_unknown_updated_at"
  end

  create_table "candidate_votes", force: :cascade do |t|
    t.boolean  "positive"
    t.integer  "user_id",      null: false
    t.integer  "candidate_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["candidate_id"], name: "index_candidate_votes_on_candidate_id", using: :btree
    t.index ["user_id"], name: "index_candidate_votes_on_user_id", using: :btree
  end

  create_table "candidates", force: :cascade do |t|
    t.string    "status"
    t.geography "location",          limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.float     "heading"
    t.float     "pitch"
    t.integer   "candidate_type_id",                                                          null: false
    t.integer   "owner_id",                                                                   null: false
    t.integer   "expert_id"
    t.datetime  "created_at",                                                                 null: false
    t.datetime  "updated_at",                                                                 null: false
    t.index ["candidate_type_id"], name: "index_candidates_on_candidate_type_id", using: :btree
    t.index ["expert_id"], name: "index_candidates_on_expert_id", using: :btree
    t.index ["location"], name: "index_candidates_on_location", using: :gist
    t.index ["owner_id"], name: "index_candidates_on_owner_id", using: :btree
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.integer  "required_points"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "message_votes", force: :cascade do |t|
    t.boolean  "positive"
    t.integer  "user_id",    null: false
    t.integer  "message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_votes_on_message_id", using: :btree
    t.index ["user_id"], name: "index_message_votes_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id",      null: false
    t.integer  "candidate_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["candidate_id"], name: "index_messages_on_candidate_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "author_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_news_on_author_id", using: :btree
  end

  create_table "tutorial_steps", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.boolean  "tutorial",               default: true,    null: false
    t.string   "role",                   default: "user",  null: false
    t.integer  "level_id",                                 null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["level_id"], name: "index_users_on_level_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "candidate_votes", "candidates"
  add_foreign_key "candidate_votes", "users"
  add_foreign_key "candidates", "candidate_types"
  add_foreign_key "candidates", "users", column: "expert_id"
  add_foreign_key "candidates", "users", column: "owner_id"
  add_foreign_key "message_votes", "messages"
  add_foreign_key "message_votes", "users"
  add_foreign_key "messages", "candidates"
  add_foreign_key "messages", "users"
  add_foreign_key "news", "admins", column: "author_id"
  add_foreign_key "users", "levels"
end
