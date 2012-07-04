class RemoveWeightFromPlantData < ActiveRecord::Migration
  def self.up
    remove_column :plant_data, :weight
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
