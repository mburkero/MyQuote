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

ActiveRecord::Schema[7.0].define(version: 2024_10_09_102127) do
  create_table "authors", force: :cascade do |t|
    t.string "authByear"
    t.string "authDyear"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authName", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "categoryName", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoryName"], name: "index_categories_on_categoryName", unique: true
  end

  create_table "quote_categories", force: :cascade do |t|
    t.integer "quote_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_quote_categories_on_category_id"
    t.index ["quote_id"], name: "index_quote_categories_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text "quoteText", null: false
    t.string "yearOfPublication"
    t.text "comment"
    t.boolean "isQuotePublic", default: true
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id", null: false
    t.index ["author_id"], name: "index_quotes_on_author_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "isAdmin", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "quote_categories", "categories"
  add_foreign_key "quote_categories", "quotes"
  add_foreign_key "quotes", "authors"
  add_foreign_key "quotes", "users"
end
