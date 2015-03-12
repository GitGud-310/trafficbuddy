class TrafficEventsController < ApplicationController
  include TrafficEventsHelper

  def index
    parse_traffic
    @traffic_events = TrafficEvent.all
  end
end
