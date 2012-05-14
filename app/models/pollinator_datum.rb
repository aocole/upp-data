class PollinatorDatum < ActiveRecord::Base
  TYPE = ['honeybee', 'bumblebee', 'other']
  attr_accessible :comments, :number_of_pollinators, :pollinator_type, :species
  belongs_to :observation
  validates_presence_of :pollinator_type, :number_of_pollinators
  end
