class PollinatorDatum < ActiveRecord::Base
  attr_accessible :comments, :number_of_pollinators, :observation_id, :pollinator_type, :species
end
