class Medicion < ActiveRecord::Base
  belongs_to :metrica
  belongs_to :test_instance

end
