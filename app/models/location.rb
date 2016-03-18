class Location < ActiveRecord::Base
  belongs_to :persona,:dependent => :destroy
end
