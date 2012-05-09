class Observation < ActiveRecord::Base
  attr_accessible :name, :observed_at, :ppatch, :temperature, :weather

end
