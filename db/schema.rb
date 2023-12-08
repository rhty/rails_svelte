# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_08_232448) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "participants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "twitter_id", null: false
    t.string "twitter_account"
    t.uuid "race_id", null: false
    t.jsonb "prediction", null: false
    t.boolean "is_won"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id", "twitter_id"], name: "index_participants_on_race_id_and_twitter_id", unique: true
    t.index ["race_id"], name: "index_participants_on_race_id"
  end

  create_table "race_results", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "race_id", null: false
    t.jsonb "result_data", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_race_results_on_race_id"
  end

  create_table "races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "held_at", null: false
    t.integer "status", null: false
    t.uuid "restriction_id", null: false
    t.integer "horses_count", null: false
    t.datetime "deadline", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restriction_id"], name: "index_races_on_restriction_id"
  end

  create_table "restrictions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.text "format", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "participants", "races"
  add_foreign_key "race_results", "races"
  add_foreign_key "races", "restrictions"
end
