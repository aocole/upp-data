class CreatePpatches < ActiveRecord::Migration
  def change
    create_table :ppatches do |t|
      t.string :name

      t.timestamps
    end
  end
end
