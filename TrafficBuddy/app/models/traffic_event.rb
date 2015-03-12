class TrafficEvent < ActiveRecord::Base
  has_many  :lat_lons
end
