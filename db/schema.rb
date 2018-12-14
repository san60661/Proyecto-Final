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

ActiveRecord::Schema.define(version: 2018_12_13_204307) do

  create_table "assignments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.integer "initPrice"
    t.integer "residence_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "date"
    t.text "startDate"
    t.integer "actualPrice"
    t.boolean "end"
  end

  create_table "bids", force: :cascade do |t|
    t.integer "user_id"
    t.integer "auction_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_bids_on_auction_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "hotsales", force: :cascade do |t|
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "residence_id"
    t.string "description"
    t.string "date"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "auction_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_inscriptions_on_auction_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "reserves", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "residence_id"
    t.text "date"
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.string "location"
    t.string "image"
    t.string "country"
    t.string "home"
    t.string "province"
    t.boolean "locked"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "premium"
    t.boolean "admin"
    t.string "card"
    t.integer "cvv"
    t.date "birth"
    t.text "expiration"
    t.integer "credits", default: 2
    t.string "surname"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
