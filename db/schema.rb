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

ActiveRecord::Schema.define(version: 20160929123047) do

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

  create_table "candidates", force: :cascade do |t|
    t.integer   "status",                                                              default: 0, null: false
    t.geography "location",   limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.float     "heading"
    t.float     "pitch"
    t.integer   "owner_id",                                                                        null: false
    t.integer   "expert_id"
    t.datetime  "created_at",                                                                      null: false
    t.datetime  "updated_at",                                                                      null: false
    t.index ["expert_id"], name: "index_candidates_on_expert_id", using: :btree
    t.index ["location"], name: "index_candidates_on_location", using: :gist
    t.index ["owner_id"], name: "index_candidates_on_owner_id", using: :btree
  end

  create_table "classification_votes", force: :cascade do |t|
    t.boolean  "positive",          default: true, null: false
    t.integer  "classification_id",                null: false
    t.integer  "user_id",                          null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["classification_id"], name: "index_classification_votes_on_classification_id", using: :btree
    t.index ["user_id"], name: "index_classification_votes_on_user_id", using: :btree
  end

  create_table "classifications", force: :cascade do |t|
    t.integer  "status",       default: 0, null: false
    t.jsonb    "data"
    t.integer  "candidate_id",             null: false
    t.integer  "user_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["candidate_id"], name: "index_classifications_on_candidate_id", using: :btree
    t.index ["user_id"], name: "index_classifications_on_user_id", using: :btree
  end

  create_table "confs", force: :cascade do |t|
    t.string    "title"
    t.integer   "zoom"
    t.geography "center",             limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.float     "heading_center"
    t.float     "pitch_center"
    t.geography "bounds",             limit: {:srid=>4326, :type=>"polygon", :geographic=>true}
    t.integer   "proximity_distance"
    t.datetime  "created_at",                                                                    null: false
    t.datetime  "updated_at",                                                                    null: false
    t.index ["bounds"], name: "index_confs_on_bounds", using: :gist
    t.index ["center"], name: "index_confs_on_center", using: :gist
  end

  create_table "message_votes", force: :cascade do |t|
    t.boolean  "positive",   default: true, null: false
    t.integer  "user_id",                   null: false
    t.integer  "message_id",                null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  create_table "tasks", force: :cascade do |t|
    t.boolean  "multiple"
    t.string   "widget_type"
    t.jsonb    "content"
    t.integer  "workflow_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["workflow_id"], name: "index_tasks_on_workflow_id", using: :btree
  end

  create_table "tutorial_steps", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "sub",                         null: false
    t.string   "name"
    t.string   "email"
    t.boolean  "tutorial",   default: false,  null: false
    t.string   "role",       default: "user", null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["sub"], name: "index_users_on_sub", unique: true, using: :btree
  end

  create_table "workflows", force: :cascade do |t|
    t.string   "name",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "first_task_id"
    t.index ["first_task_id"], name: "index_workflows_on_first_task_id", using: :btree
  end

  add_foreign_key "candidates", "users", column: "expert_id"
  add_foreign_key "candidates", "users", column: "owner_id"
  add_foreign_key "classification_votes", "classifications"
  add_foreign_key "classification_votes", "users"
  add_foreign_key "classifications", "candidates"
  add_foreign_key "classifications", "users"
  add_foreign_key "message_votes", "messages"
  add_foreign_key "message_votes", "users"
  add_foreign_key "messages", "candidates"
  add_foreign_key "messages", "users"
  add_foreign_key "news", "admins", column: "author_id"
  add_foreign_key "tasks", "workflows"
  add_foreign_key "workflows", "tasks", column: "first_task_id"
end
