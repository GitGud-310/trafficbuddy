class TrafficEventsController < ApplicationController
  include TrafficEventsHelper

  def index
    @traffic_events = TrafficEvent.all
  end

  def parse
    parse_traffic
  end
end
