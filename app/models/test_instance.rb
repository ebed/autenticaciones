class TestInstance < ActiveRecord::Base
  belongs_to :registro
  has_many :medicions
  belongs_to :test

  accepts_nested_attributes_for :test
  accepts_nested_attributes_for :medicions
end
