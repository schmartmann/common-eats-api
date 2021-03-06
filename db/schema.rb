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

ActiveRecord::Schema.define(version: 2021_06_11_183022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_item_refinements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "course_item_id", null: false
    t.string "text", null: false
    t.string "selection_type", default: "radio", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_item_id"], name: "index_course_item_refinements_on_course_item_id"
  end

  create_table "course_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "course_id", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.float "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_items_on_course_id"
  end

  create_table "courses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_courses_on_menu_id"
  end

  create_table "cuisines", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menus", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "operation_hours", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "schedulable_type"
    t.uuid "schedulable_id"
    t.integer "day", null: false
    t.float "start_time", default: 0.0, null: false
    t.float "end_time", default: 23.75, null: false
    t.datetime "valid_from"
    t.datetime "valid_through"
    t.string "time_zone", default: "UTC", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedulable_type", "schedulable_id"], name: "index_operation_hours_on_schedulable"
  end

  create_table "restaurant_cuisines", force: :cascade do |t|
    t.uuid "cuisine_id", null: false
    t.uuid "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuisine_id"], name: "index_restaurant_cuisines_on_cuisine_id"
    t.index ["restaurant_id"], name: "index_restaurant_cuisines_on_restaurant_id"
  end

  create_table "restaurants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "street_address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "postal_code", null: false
    t.string "time_zone", default: "UTC", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "restauranteur_id", null: false
    t.index ["email"], name: "index_restaurants_on_email", unique: true
    t.index ["name"], name: "index_restaurants_on_name", unique: true
    t.index ["phone"], name: "index_restaurants_on_phone", unique: true
  end

  create_table "sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "expires_at"
    t.string "user_agent"
    t.uuid "user_id"
    t.string "device_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.boolean "customer", default: false, null: false
    t.boolean "restauranteur", default: false, null: false
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "course_item_refinements", "course_items"
  add_foreign_key "course_items", "courses"
  add_foreign_key "courses", "menus"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "restaurant_cuisines", "cuisines"
  add_foreign_key "restaurant_cuisines", "restaurants"
end
