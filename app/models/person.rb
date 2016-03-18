class Person < ActiveRecord::Base

  has_one :location
  attr_accessible :location_attributes
  accepts_nested_attributes_for :location
end
