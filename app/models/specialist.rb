class Specialist < ActiveRecord::Base
  has_one :persona
  has_many :registros

  accepts_nested_attributes_for :persona
  accepts_nested_attributes_for :registros
end
