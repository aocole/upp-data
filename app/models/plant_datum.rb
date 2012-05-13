class PlantDatum < ActiveRecord::Base
  belongs_to :observation
  attr_accessible :comments, :number_of_fruits, :observation_id, :plant_type, :volume, :weight
  validates_presence_of :number_of_fruits, :plant_type
end
