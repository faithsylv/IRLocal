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

ActiveRecord::Schema.define(version: 2021_04_29_091617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.text "name"
    t.text "logo"
    t.text "description"
    t.integer "established"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "images", default: [], array: true
  end

  create_table "brands_shops", id: false, force: :cascade do |t|
    t.integer "brand_id"
    t.integer "shop_id"
  end

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.text "image"
  end

  create_table "categories_shops", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.text "name"
    t.text "logo"
    t.text "tagline"
    t.text "description"
    t.text "founders"
    t.integer "established"
    t.text "website"
    t.text "image"
    t.text "address"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "images", default: [], array: true
  end

end
