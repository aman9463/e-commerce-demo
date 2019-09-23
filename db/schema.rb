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

ActiveRecord::Schema.define(version: 2019_09_22_062313) do

  create_table "master_attributes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "default_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_name"], name: "index_master_attributes_on_default_name", unique: true
    t.index ["name"], name: "index_master_attributes_on_name", unique: true
  end

  create_table "master_colors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "master_attribute_id"
    t.string "name", null: false
    t.string "default_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_name"], name: "index_master_colors_on_default_name", unique: true
    t.index ["master_attribute_id"], name: "index_master_colors_on_master_attribute_id"
    t.index ["name"], name: "index_master_colors_on_name", unique: true
  end

  create_table "master_storages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "master_attribute_id"
    t.string "name", null: false
    t.string "default_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_name"], name: "index_master_storages_on_default_name", unique: true
    t.index ["master_attribute_id"], name: "index_master_storages_on_master_attribute_id"
    t.index ["name"], name: "index_master_storages_on_name", unique: true
  end

  create_table "product_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "desc"
    t.string "image"
    t.string "price"
    t.string "discounted_price"
    t.string "item_type"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_product_details_on_item_type_and_item_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "in_stock", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "storage_id", null: false
    t.bigint "color_id", null: false
    t.boolean "in_stock", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_variants_on_color_id"
    t.index ["product_id"], name: "index_variants_on_product_id"
    t.index ["storage_id"], name: "index_variants_on_storage_id"
  end

  add_foreign_key "master_colors", "master_attributes"
  add_foreign_key "master_storages", "master_attributes"
  add_foreign_key "variants", "master_colors", column: "color_id"
  add_foreign_key "variants", "master_storages", column: "storage_id"
end
