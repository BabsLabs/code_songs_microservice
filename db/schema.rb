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

ActiveRecord::Schema.define(version: 2020_01_09_010446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sentiments", force: :cascade do |t|
    t.string "name", null: false
    t.float "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "track_id"
    t.index ["track_id"], name: "index_sentiments_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.integer "mm_track_id"
    t.integer "mm_artist_id"
    t.string "artist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "youtube_link"
  end

  add_foreign_key "sentiments", "tracks"
end
