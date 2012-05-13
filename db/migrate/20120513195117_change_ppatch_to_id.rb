class ChangePpatchToId < ActiveRecord::Migration
  def change
    remove_column :observations, :ppatch
    add_column :observations, :ppatch_id, :integer
    add_foreign_key :observations, :ppatches
  end
end
