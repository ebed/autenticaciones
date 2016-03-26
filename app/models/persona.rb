class Persona < ActiveRecord::Base
  belongs_to :patient, :dependent => :destroy
  belongs_to :specialist, :dependent => :destroy
  has_one :location
  accepts_nested_attributes_for :location

  def to_label
    "#{first_name}  #{last_name}"
  end
end
