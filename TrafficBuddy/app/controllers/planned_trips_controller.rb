class PlannedTripsController < ApplicationController
  def index
    @planned_trips = PlannedTrip.all
  end

  def destroy
    PlannedTrip.find(params[:id]).destroy
    flash[:success] = "Trip removed"
  end
end
