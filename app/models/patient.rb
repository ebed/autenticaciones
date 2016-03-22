class Patient < ActiveRecord::Base
  has_one :persona
  has_one :ficha
  accepts_nested_attributes_for :persona
  accepts_nested_attributes_for :ficha
end
