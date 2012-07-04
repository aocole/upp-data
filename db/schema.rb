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

ActiveRecord::Schema.define(:version => 20120704045112) do

  create_table "observations", :force => true do |t|
    t.string   "name"
    t.datetime "observed_at"
    t.string   "weather1"
    t.integer  "temperature"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "weather2"
    t.integer  "ppatch_id"
  end

  add_index "observations", ["ppatch_id"], :name => "observations_ppatch_id_fk"

  create_table "plant_data", :force => true do |t|
    t.string   "plant_type"
    t.integer  "number_of_fruits"
    t.decimal  "volume",           :precision => 10, :scale => 0
    t.text     "comments"
    t.integer  "observation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plant_data", ["observation_id"], :name => "plant_data_observation_id_fk"

  create_table "pollinator_data", :force => true do |t|
    t.string   "pollinator_type"
    t.integer  "number_of_pollinators"
    t.string   "species"
    t.text     "comments"
    t.integer  "observation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pollinator_data", ["observation_id"], :name => "pollinator_data_observation_id_fk"

  create_table "ppatches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "observations", "ppatches", :name => "observations_ppatch_id_fk"

  add_foreign_key "plant_data", "observations", :name => "plant_data_observation_id_fk", :dependent => :delete

  add_foreign_key "pollinator_data", "observations", :name => "pollinator_data_observation_id_fk", :dependent => :delete

end
