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

ActiveRecord::Schema.define(version: 2022_08_15_103015) do

  create_table "donate_items", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "usesr_id", null: false
    t.integer "project_id", null: false
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_donate_items_on_project_id"
    t.index ["usesr_id"], name: "index_donate_items_on_usesr_id"
  end

  create_table "follow_projects", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_follow_projects_on_project_id"
    t.index ["user_id"], name: "index_follow_projects_on_user_id"
  end

  create_table "like_messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "text_message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text_message_id"], name: "index_like_messages_on_text_message_id"
    t.index ["user_id"], name: "index_like_messages_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "text_messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_text_messages_on_project_id"
    t.index ["user_id"], name: "index_text_messages_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "donate_item_id", null: false
    t.integer "price"
    t.boolean "pay_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["donate_item_id"], name: "index_transactions_on_donate_item_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "user_ranks", force: :cascade do |t|
    t.string "level"
    t.integer "condition"
    t.integer "bonus_feedback"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_ranks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "total_donation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "donate_items", "projects"
  add_foreign_key "donate_items", "usesrs"
  add_foreign_key "follow_projects", "projects"
  add_foreign_key "follow_projects", "users"
  add_foreign_key "like_messages", "text_messages"
  add_foreign_key "like_messages", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "text_messages", "projects"
  add_foreign_key "text_messages", "users"
  add_foreign_key "transactions", "donate_items"
  add_foreign_key "transactions", "users"
  add_foreign_key "user_ranks", "users"
end
