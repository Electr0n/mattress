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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121201072141) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "manufacturers", ["slug"], :name => "index_manufacturers_on_slug"

  create_table "mattress_stuff_price_for_sizes", :force => true do |t|
    t.decimal  "price",       :precision => 10, :scale => 0
    t.integer  "size_id"
    t.integer  "mattress_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "mattress_stuff_price_for_sizes", ["mattress_id"], :name => "index_mattress_stuff_price_for_sizes_on_mattress_id"
  add_index "mattress_stuff_price_for_sizes", ["size_id"], :name => "index_mattress_stuff_price_for_sizes_on_size_id"

  create_table "mattress_stuff_sizes", :force => true do |t|
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mattress_stuff_sizes", ["height"], :name => "index_mattress_stuff_sizes_on_height"
  add_index "mattress_stuff_sizes", ["width"], :name => "index_mattress_stuff_sizes_on_width"

  create_table "mattresses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "product_series_id"
    t.string   "image"
    t.integer  "price"
    t.text     "short_description"
    t.string   "big_image"
    t.datetime "best_selled_from"
    t.boolean  "best_selled"
    t.string   "width"
    t.string   "height"
    t.string   "hardness"
    t.string   "slug"
  end

  add_index "mattresses", ["product_series_id"], :name => "index_mattresses_on_product_series_id"
  add_index "mattresses", ["slug"], :name => "index_mattresses_on_slug"

  create_table "page_parts", :force => true do |t|
    t.string   "key"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "intro"
    t.string   "slug"
  end

  add_index "page_parts", ["key"], :name => "index_page_parts_on_key"
  add_index "page_parts", ["slug"], :name => "index_page_parts_on_slug"

  create_table "product_series", :force => true do |t|
    t.string   "title"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
  end

  add_index "product_series", ["manufacturer_id"], :name => "index_product_series_on_manufacturer_id"
  add_index "product_series", ["slug"], :name => "index_product_series_on_slug"
  add_index "product_series", ["title"], :name => "index_product_series_on_title"

  create_table "seos", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "keywords"
    t.string   "description"
    t.string   "model_type"
    t.integer  "model_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "seos", ["model_id"], :name => "index_seos_on_model_id"
  add_index "seos", ["model_type"], :name => "index_seos_on_model_type"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
