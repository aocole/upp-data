class CreatePpatches < ActiveRecord::Migration
  def self.up
    create_table :ppatches do |t|
      t.string :name

      t.timestamps
    end
  end
end
