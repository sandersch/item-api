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

ActiveRecord::Schema.define(version: 2021_11_06_044949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armor_bases", force: :cascade do |t|
    t.integer "group"
    t.string "name"
    t.integer "weight"
    t.integer "rt"
    t.integer "ap"
    t.integer "cva"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "armor_details", force: :cascade do |t|
    t.bigint "armor_base_id", null: false
    t.bigint "item_property_id"
    t.integer "enchant"
    t.integer "ensorcell"
    t.integer "sanctify"
    t.integer "critial_services"
    t.integer "damage_services"
    t.integer "sighting_services"
    t.datetime "loresong_unlocked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["armor_base_id"], name: "index_armor_details_on_armor_base_id"
    t.index ["item_property_id"], name: "index_armor_details_on_item_property_id"
  end

  create_table "item_properties", force: :cascade do |t|
    t.string "kind"
    t.string "effect"
    t.integer "amount"
    t.boolean "temporary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slot_type", null: false
    t.bigint "slot_id", null: false
    t.index ["slot_type", "slot_id"], name: "index_item_properties_on_slot"
  end

  create_table "items", force: :cascade do |t|
    t.string "details_type", null: false
    t.bigint "details_id", null: false
    t.integer "weight"
    t.string "noun"
    t.string "name"
    t.string "long_description"
    t.string "show_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["details_type", "details_id"], name: "index_items_on_details"
  end

  add_foreign_key "armor_details", "armor_bases", column: "armor_base_id"
  add_foreign_key "armor_details", "item_properties"
end
