class TrafficEventsController < ApplicationController
  include TrafficEventsHelper, ApplicationHelper

  def index
    get_api_key
    @traffic_events = TrafficEvent.all
  end

  def parse
    parse_traffic
    flash[:notice] = "Traffic events updated"
    redirect_to traffic_events_url
  end
end
