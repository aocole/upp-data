class PlantDatum < ActiveRecord::Base
  TYPE = ['net', 'no net', 'tuning fork - extra pollen']
  belongs_to :observation
  attr_accessible :comments, :number_of_fruits, :plant_type, :volume, :weight
  validates_presence_of :number_of_fruits, :plant_type
end
