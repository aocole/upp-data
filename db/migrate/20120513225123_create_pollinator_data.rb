class CreatePollinatorData < ActiveRecord::Migration
  def change
    create_table :pollinator_data do |t|
      t.string :pollinator_type
      t.integer :number_of_pollinators
      t.string :species
      t.text :comments
      t.integer :observation_id

      t.timestamps
    end
    add_foreign_key :pollinator_data, :observations, :dependent => :delete
  end
end
