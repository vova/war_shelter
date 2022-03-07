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

ActiveRecord::Schema.define(version: 2022_03_07_074823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodation_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_accommodation_types_on_name", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phone"
    t.string "phone2"
    t.boolean "vaccination"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "places", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.integer "accommodation_type_id"
    t.string "city"
    t.string "region"
    t.integer "rooms_available"
    t.integer "beds"
    t.integer "kids_beds"
    t.boolean "is_pets_allowed"
    t.integer "capacity", default: 2, null: false
    t.integer "additional_child_place", default: 0
    t.integer "coordinator_id"
    t.integer "status", default: 0
    t.integer "price_per_day"
    t.integer "price_per_month"
    t.string "currency"
    t.string "address"
    t.integer "distance_from_center"
    t.datetime "available_since"
    t.datetime "available_till"
    t.string "phone"
    t.string "phone2"
    t.boolean "is_realtor"
    t.string "contact_name"
    t.string "geo"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "comment"
    t.string "floor"
    t.boolean "is_newbuilding"
    t.integer "assigned_to"
    t.index ["accommodation_type_id"], name: "index_places_on_accommodation_type_id"
    t.index ["assigned_to"], name: "index_places_on_assigned_to"
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.boolean "company_transfer", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "company_transfer"], name: "index_transports_on_name_and_company_transfer", unique: true
  end

  create_table "user_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_user_statuses_on_status", unique: true
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
    t.integer "status_id"
    t.integer "coordinator_id"
    t.string "from"
    t.string "destination"
    t.integer "adults"
    t.integer "kids"
    t.string "kids_comment"
    t.boolean "pets"
    t.string "phone"
    t.string "phone2"
    t.string "geo"
    t.integer "accommodation_pref"
    t.integer "transport_id"
    t.datetime "date_arrival"
    t.string "request_id"
    t.boolean "vaccination"
    t.text "comment"
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "wikis", force: :cascade do |t|
    t.integer "page_id"
    t.string "title", limit: 100, null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_wikis_on_page_id"
  end

end
