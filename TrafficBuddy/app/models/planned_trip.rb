class PlannedTrip < ActiveRecord::Base
  has_many :lat_lons
  belongs_to :user
end
