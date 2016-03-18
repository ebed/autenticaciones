class Specialist < ActiveRecord::Base
  has_one :persona

  accepts_nested_attributes_for :persona
end
