class PlannedTripsController < ApplicationController

  def index
    @planned_trips = PlannedTrip.all
  end

  def create
    @planned_trip = PlannedTrip.create()
    @planned_trip.update_attribute(:start_loc, params[:start_location])
    @planned_trip.update_attribute(:end_loc, params[:end_location])
  end

  def destroy
    PlannedTrip.find(params[:id]).destroy
    flash[:success] = "Trip removed"
    redirect_to root_path
  end
end
