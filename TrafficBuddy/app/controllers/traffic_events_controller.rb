class TrafficEventsController < ApplicationController
  include TrafficEventsHelper

  def index
    @traffic_events = TrafficEvent.all
  end

  def parse
    parse_traffic
    flash[:notice] = "Traffic events updated"
    redirect_to traffic_events_url
  end
end
