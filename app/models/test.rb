class Test < ActiveRecord::Base
  has_many :medicions
  belongs_to :registro
  has_many :test_instances

  def to_label
    "#{nombre}"
  end

end
