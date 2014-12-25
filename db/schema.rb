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

ActiveRecord::Schema.define(version: 20141209062753) do

  create_table "agents", force: true do |t|
    t.string   "name",       null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agents", ["name"], name: "index_agents_on_name"
  add_index "agents", ["team_id"], name: "index_agents_on_team_id"

  create_table "capture_histories", force: true do |t|
    t.string   "ident_code",  null: false
    t.datetime "action_time", null: false
    t.integer  "agent_id",    null: false
    t.integer  "portal_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "capture_histories", ["action_time"], name: "index_capture_histories_on_action_time"
  add_index "capture_histories", ["agent_id"], name: "index_capture_histories_on_agent_id"
  add_index "capture_histories", ["ident_code"], name: "index_capture_histories_on_ident_code"
  add_index "capture_histories", ["portal_id"], name: "index_capture_histories_on_portal_id"

  create_table "deploy_histories", force: true do |t|
    t.string   "ident_code",      null: false
    t.datetime "action_time",     null: false
    t.integer  "agent_id",        null: false
    t.integer  "portal_id",       null: false
    t.integer  "resonator_level", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deploy_histories", ["action_time"], name: "index_deploy_histories_on_action_time"
  add_index "deploy_histories", ["agent_id"], name: "index_deploy_histories_on_agent_id"
  add_index "deploy_histories", ["ident_code"], name: "index_deploy_histories_on_ident_code"
  add_index "deploy_histories", ["portal_id"], name: "index_deploy_histories_on_portal_id"
  add_index "deploy_histories", ["resonator_level"], name: "index_deploy_histories_on_resonator_level"

  create_table "destroye_histories", force: true do |t|
    t.string   "ident_code",      null: false
    t.datetime "action_time",     null: false
    t.integer  "agent_id",        null: false
    t.integer  "portal_id",       null: false
    t.integer  "resonator_level", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destroye_histories", ["action_time"], name: "index_destroye_histories_on_action_time"
  add_index "destroye_histories", ["agent_id"], name: "index_destroye_histories_on_agent_id"
  add_index "destroye_histories", ["ident_code"], name: "index_destroye_histories_on_ident_code"
  add_index "destroye_histories", ["portal_id"], name: "index_destroye_histories_on_portal_id"
  add_index "destroye_histories", ["resonator_level"], name: "index_destroye_histories_on_resonator_level"

  create_table "link_histories", force: true do |t|
    t.string   "ident_code",     null: false
    t.datetime "action_time",    null: false
    t.integer  "agent_id",       null: false
    t.integer  "to_portal_id",   null: false
    t.integer  "from_portal_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_histories", ["action_time"], name: "index_link_histories_on_action_time"
  add_index "link_histories", ["agent_id"], name: "index_link_histories_on_agent_id"
  add_index "link_histories", ["from_portal_id"], name: "index_link_histories_on_from_portal_id"
  add_index "link_histories", ["ident_code"], name: "index_link_histories_on_ident_code"
  add_index "link_histories", ["to_portal_id"], name: "index_link_histories_on_to_portal_id"

  create_table "portals", force: true do |t|
    t.integer  "latE6",      null: false
    t.integer  "lngE6",      null: false
    t.string   "address",    null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portals", ["latE6", "lngE6"], name: "e6_index", unique: true

  create_table "teams", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], name: "index_teams_on_name"

end
