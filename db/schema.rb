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

ActiveRecord::Schema.define(:version => 20120513225123) do

  create_table "observations", :force => true do |t|
    t.string   "name"
    t.datetime "observed_at"
    t.string   "weather1"
    t.integer  "temperature"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "weather2"
    t.integer  "ppatch_id"
  end

  create_table "plant_data", :force => true do |t|
    t.string   "plant_type"
    t.integer  "number_of_fruits"
    t.decimal  "weight"
    t.decimal  "volume"
    t.text     "comments"
    t.integer  "observation_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pollinator_data", :force => true do |t|
    t.string   "pollinator_type"
    t.integer  "number_of_pollinators"
    t.string   "species"
    t.text     "comments"
    t.integer  "observation_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "ppatches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
