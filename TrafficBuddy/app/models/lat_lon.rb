class LatLon < ActiveRecord::Base
  validates :latitude,:longitude,  presence: true
  validates :latitude,:longitude, numericality: true

  belongs_to  :traffic_event
end
