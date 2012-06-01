class Add < ActiveRecord::Migration
  def self.up
    rename_column :observations, :weather, :weather1
    add_column :observations, :weather2, :string
  end
end
