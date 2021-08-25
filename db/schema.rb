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

ActiveRecord::Schema.define(version: 2021_08_25_145310) do

  create_table "categories", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.decimal "balance"
    t.decimal "percentage"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "category_transactions", force: :cascade do |t|
    t.integer "category_id"
    t.integer "user_transaction_id"
    t.boolean "primary_category"
    t.index ["category_id"], name: "index_category_transactions_on_category_id"
    t.index ["user_transaction_id"], name: "index_category_transactions_on_user_transaction_id"
  end

  create_table "user_transactions", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.decimal "amount"
    t.date "created_at"
    t.index ["user_id"], name: "index_user_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "hashed_password"
    t.string "profile_image", default: ""
    t.string "pay_dates", default: ""
    t.decimal "balance", default: "0.0"
    t.decimal "paycheck", default: "0.0"
  end

  add_foreign_key "categories", "users"
  add_foreign_key "category_transactions", "categories"
  add_foreign_key "category_transactions", "user_transactions"
  add_foreign_key "user_transactions", "users"
end
