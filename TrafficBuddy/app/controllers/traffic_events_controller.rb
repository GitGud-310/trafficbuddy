class TrafficEventsController < ApplicationController
  def parse_traffic
    feeds = Feedjira::Feed.fetch_and_parse 'http://vanmapp2.vancouver.ca/georss/roadahead_georss.xml'
  end

  def index
    @traffic_events = TrafficEvent.all
  end
end
