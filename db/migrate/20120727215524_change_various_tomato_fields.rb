class ChangeVariousTomatoFields < ActiveRecord::Migration
  def self.up
    rename_column :plant_data, :number_of_fruits, :total_number_of_fruits
    add_column :plant_data, :number_of_fruits_measured, :integer
  end

  def self.down
    rename_column :plant_data, :total_number_of_fruits, :number_of_fruits
    remove_column :plant_data, :number_of_fruits_measured
  end
end
