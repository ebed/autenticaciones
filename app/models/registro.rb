class Registro < ActiveRecord::Base
  belongs_to :ficha
  has_one :specialist
  has_many :test_instances
  accepts_nested_attributes_for :ficha
  accepts_nested_attributes_for :test_instances

end
