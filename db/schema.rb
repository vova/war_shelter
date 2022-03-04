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

ActiveRecord::Schema.define(version: 2022_03_04_112233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "place_statuses", force: :cascade do |t|
    t.integer "name"
    t.index ["name"], name: "index_place_statuses_on_name", unique: true
  end

  create_table "transports", force: :cascade do |t|
    t.integer "name"
    t.boolean "company_transfer", default: false
    t.index ["name", "company_transfer"], name: "index_transports_on_name_and_company_transfer", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wiki_pages", force: :cascade do |t|
    t.integer "page_id"
    t.string "title"
    t.text "body"
    t.integer "version"
    t.index ["page_id", "version"], name: "index_wiki_pages_on_page_id_and_version", unique: true
  end

end
