class Ficha < ActiveRecord::Base
    belongs_to :patient
    has_many :registros
    accepts_nested_attributes_for :registros
end
