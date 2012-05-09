class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :name
      t.string :ppatch
      t.datetime :observed_at
      t.string :weather
      t.integer :temperature

      t.timestamps
    end
  end
end
