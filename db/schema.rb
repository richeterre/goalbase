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

ActiveRecord::Schema.define(version: 20150418185225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "matches", force: :cascade do |t|
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches_away_players", id: false, force: :cascade do |t|
    t.integer "match_id"
    t.integer "player_id"
  end

  add_index "matches_away_players", ["match_id"], name: "index_matches_away_players_on_match_id", using: :btree
  add_index "matches_away_players", ["player_id"], name: "index_matches_away_players_on_player_id", using: :btree

  create_table "matches_home_players", id: false, force: :cascade do |t|
    t.integer "match_id"
    t.integer "player_id"
  end

  add_index "matches_home_players", ["match_id"], name: "index_matches_home_players_on_match_id", using: :btree
  add_index "matches_home_players", ["player_id"], name: "index_matches_home_players_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.uuid     "uuid",       default: "uuid_generate_v4()", null: false
  end

end
