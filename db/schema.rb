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

ActiveRecord::Schema.define(version: 2021_08_10_163705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_artists_on_name"
    t.index ["slug"], name: "index_artists_on_slug", unique: true
  end

  create_table "charts", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_charts_on_name"
    t.index ["slug"], name: "index_charts_on_slug", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "chart_id"
    t.bigint "track_id"
    t.integer "position", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chart_id", "position"], name: "index_entries_on_chart_id_and_position", unique: true
    t.index ["chart_id"], name: "index_entries_on_chart_id"
    t.index ["track_id"], name: "index_entries_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "title"
    t.string "slug"
    t.text "lyrics"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
    t.index ["slug"], name: "index_tracks_on_slug", unique: true
    t.index ["title"], name: "index_tracks_on_title"
  end

end
