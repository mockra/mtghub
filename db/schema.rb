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

ActiveRecord::Schema.define(version: 20130528021108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "title"
    t.string   "main_type"
    t.string   "sub_type"
    t.integer  "power"
    t.integer  "toughness"
    t.integer  "cmc"
    t.string   "mana_cost",    array: true
    t.integer  "loyalty"
    t.string   "image_url"
    t.text     "description"
    t.string   "gatherer_url"
    t.string   "rarity"
    t.integer  "mtg_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["cmc"], name: "index_cards_on_cmc", using: :btree
  add_index "cards", ["main_type"], name: "index_cards_on_main_type", using: :btree
  add_index "cards", ["power"], name: "index_cards_on_power", using: :btree
  add_index "cards", ["title"], name: "index_cards_on_title", using: :btree
  add_index "cards", ["toughness"], name: "index_cards_on_toughness", using: :btree

  create_table "cards_decks", force: true do |t|
    t.integer "card_id"
    t.integer "deck_id"
  end

  create_table "cards_sideboards", force: true do |t|
    t.integer "card_id"
    t.integer "sideboard_id"
  end

  create_table "decks", force: true do |t|
    t.string   "title"
    t.string   "format"
    t.string   "tags",       array: true
    t.string   "colors",     array: true
    t.integer  "origin_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["origin_id"], name: "index_decks_on_origin_id", using: :btree

  create_table "mtg_blocks", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mtg_sets", force: true do |t|
    t.string   "title"
    t.string   "code"
    t.integer  "mtg_block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mtg_sets", ["title"], name: "index_mtg_sets_on_title", using: :btree

  create_table "sideboards", force: true do |t|
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestion_additions", force: true do |t|
    t.integer "card_id"
    t.integer "suggestion_id"
  end

  create_table "suggestion_deletions", force: true do |t|
    t.integer "card_id"
    t.integer "suggestion_id"
  end

  create_table "suggestion_sideboard_additions", force: true do |t|
    t.integer "card_id"
    t.integer "suggestion_id"
  end

  create_table "suggestion_sideboard_deletions", force: true do |t|
    t.integer "card_id"
    t.integer "suggestion_id"
  end

  create_table "suggestions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

end
