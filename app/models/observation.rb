class Observation < ActiveRecord::Base
  WEATHER = %w{sunny rainy overcast windy}
  belongs_to :ppatch
  has_many :plant_data
  has_many :pollinator_data
  attr_accessible :name, :observed_at, :ppatch, :temperature, :weather

  validates_presence_of :name, :observed_at, :ppatch, :temperature
  validates_numericality_of :temperature
  validates_inclusion_of :weather1, :in => WEATHER
  validates_inclusion_of :weather2, :in => WEATHER
end
