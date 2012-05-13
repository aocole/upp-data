class CreatePlantData < ActiveRecord::Migration
  def change
    create_table :plant_data do |t|
      t.string :plant_type
      t.integer :number_of_fruits
      t.decimal :weight
      t.decimal :volume
      t.text :comments
      t.integer :observation_id

      t.timestamps
    end
    add_foreign_key :plant_data, :observations, :dependent => :delete
  end
end
