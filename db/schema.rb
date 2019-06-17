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

ActiveRecord::Schema.define(version: 2019_06_13_051857) do

  create_table "betting_scenarios", force: :cascade do |t|
    t.string "description"
    t.integer "game_id"
    t.integer "scenario_type"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_betting_scenarios_on_game_id"
  end

  create_table "game_statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "home_team"
    t.string "visiting_team"
    t.integer "game_status"
    t.datetime "game_time"
    t.integer "leagues_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leagues_id"], name: "index_games_on_leagues_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "ammount_free"
    t.decimal "ammount_in_play"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "user_bets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "betting_scenario_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["betting_scenario_id"], name: "index_user_bets_on_betting_scenario_id"
    t.index ["user_id"], name: "index_user_bets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "password_digest"
    t.string "email"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "auth_token", default: ""
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
  end

end
