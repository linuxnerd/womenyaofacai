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

ActiveRecord::Schema.define(version: 20141208141211) do

  create_table "productions", force: true do |t|
    t.string   "pid"
    t.string   "registration_code"
    t.string   "description"
    t.string   "production_type"
    t.string   "highest_yield"
    t.string   "lowest_yield"
    t.string   "real_yield"
    t.string   "starting_amount"
    t.string   "status"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "term"
    t.string   "issuer_code"
    t.string   "issuer_name"
    t.string   "currency"
    t.string   "collection_start_date"
    t.string   "collection_end_date"
    t.string   "term_type"
    t.string   "incoming_type"
    t.string   "risk_level"
    t.string   "initial_value"
    t.string   "production_value"
    t.text     "sales_area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
