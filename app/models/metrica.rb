class Metrica < ActiveRecord::Base
  has_many :medicions

  belongs_to :registro

  accepts_nested_attributes_for :medicions


  def to_label
    "#{nombre}"
  end

end
