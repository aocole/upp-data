class Add < ActiveRecord::Migration
  def change
    rename_column :observations, :weather, :weather1
    add_column :observations, :weather2, :string
  end
end
