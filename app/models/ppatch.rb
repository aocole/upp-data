class Ppatch < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :observations
end
