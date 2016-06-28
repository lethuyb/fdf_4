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

ActiveRecord::Schema.define(version: 20160622072349) do

  create_table "categories", force: :cascade do |t|
    t.string   "categoryName"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["product_id"], name: "index_comments_on_product_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "order_details", force: :cascade do |t|
    t.integer  "quantilyOrdered"
    t.float    "priceEach"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id"
  add_index "order_details", ["product_id"], name: "index_order_details_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.float    "total"
    t.boolean  "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "productName"
    t.float    "price"
    t.string   "description"
    t.integer  "quantily"
    t.string   "images"
    t.string   "rating"
    t.integer  "categories_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "products", ["categories_id"], name: "index_products_on_categories_id"

  create_table "suggests", force: :cascade do |t|
    t.text     "suggest"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "suggests", ["user_id"], name: "index_suggests_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
