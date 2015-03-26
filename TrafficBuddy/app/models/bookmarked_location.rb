class BookmarkedLocation < ActiveRecord::Base
  has_one :lat_lon
  belongs_to :user
end
