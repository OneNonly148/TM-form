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

ActiveRecord::Schema.define(version: 20170823020242) do

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote2s", force: :cascade do |t|
    t.string "site"
    t.string "price"
    t.string "fiber"
    t.integer "distance"
    t.integer "speed"
    t.integer "contract"
    t.string "package"
    t.string "brand"
    t.string "service"
    t.string "location"
    t.boolean "bundle"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.integer "user_id"
    t.string "siteA"
    t.string "locatA"
    t.string "UPEA"
    t.string "siteB"
    t.string "locatB"
    t.string "UPEB"
    t.integer "speed"
    t.string "class"
    t.string "level"
    t.integer "contract"
    t.string "type"
    t.integer "distance"
    t.string "inter_link"
    t.integer "discount"
    t.string "Rbrand"
    t.string "RBOM"
    t.integer "RQuantity"
    t.integer "RDiscount"
    t.string "intWiring"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "fax"
    t.string "email"
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
