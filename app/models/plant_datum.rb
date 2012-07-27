class PlantDatum < ActiveRecord::Base
  TYPE = ['net', 'no net', 'tuning fork - extra pollen']
  belongs_to :observation
  attr_accessible :comments, :total_number_of_fruits, :number_of_fruits_measured, :plant_type, :volume, :weight
  validates_presence_of :total_number_of_fruits, :number_of_fruits_measured, :plant_type
  attr_accessor :water_volume_with_tomatoes, :water_volume_without_tomatoes
end
