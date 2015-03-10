module TrafficEventsHelper
  def parse_traffic
    Feedjira::Feed.add_common_feed_entry_element('georss:line', :as => :location)
    feed = Feedjira::Feed.fetch_and_parse 'http://vanmapp2.vancouver.ca/georss/roadahead_georss.xml'
    @feed = feed.entries
    clear_database
    feed.entries.each do |entry|
      if entry.categories.first != "Upcoming Project"
        tevent = TrafficEvent.new
        tevent.title = entry.title

        parse_latlon(tevent, entry.location)
        tevent.save
      end
    end
  end

  def parse_latlon(tevent, locstr)
    locarray = locstr.split(" ")
    size = locarray.length
    count = 0
    while count < size do
      latlon = LatLon.new
      latlon.traffic_event = tevent
      latlon.latitude = locarray[count]
      latlon.longitude = locarray[count + 1]
      latlon.save

      count += 2
    end
  end

  def clear_database
    TrafficEvent.delete_all
    LatLon.delete_all
  end
end
