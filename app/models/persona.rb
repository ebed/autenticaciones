class Persona < ActiveRecord::Base
  belongs_to :patient, :dependent => :destroy
  belongs_to :specialist, :dependent => :destroy
  has_one :location
  accepts_nested_attributes_for :location
end
