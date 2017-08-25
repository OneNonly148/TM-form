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

ActiveRecord::Schema.define(version: 20170825012611) do

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "user_id"
    t.string "valName1"
    t.string "valCat1"
    t.string "valUPE1"
    t.string "valName2"
    t.string "valCat2"
    t.string "valUPE2"
    t.string "valSpeed"
    t.string "valSclass"
    t.string "valSlevel"
    t.string "valContract"
    t.string "valScat"
    t.string "valSdiscount"
    t.string "valStype"
    t.string "valSdistance"
    t.string "valRouter"
    t.string "valRbom"
    t.string "valRquantity"
    t.string "valRdiscount"
    t.string "valRwiring"
    t.string "valStatus"
    t.string "valUname"
    t.string "valUphone"
    t.string "valUfax"
    t.string "valUemail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.boolean "admin"
    t.integer "access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
