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

ActiveRecord::Schema.define(version: 20160629205657) do

  create_table "borrowers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "purpose"
    t.text     "description"
    t.integer  "money"
    t.integer  "raised"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "lender_id"
    t.integer  "borrower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "histories", ["borrower_id"], name: "index_histories_on_borrower_id"
  add_index "histories", ["lender_id"], name: "index_histories_on_lender_id"

  create_table "lenders", force: :cascade do |t|
    t.string   "lfirst_name"
    t.string   "llast_name"
    t.string   "lemail"
    t.integer  "lmoney"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
