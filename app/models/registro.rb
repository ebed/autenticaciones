class Registro < ActiveRecord::Base
  belongs_to :ficha
  has_one :specialist
  accepts_nested_attributes_for :ficha
end
