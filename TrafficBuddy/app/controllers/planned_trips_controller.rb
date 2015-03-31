class PlannedTripsController < ApplicationController

  def index
    @planned_trips = PlannedTrip.all
  end

  def create
    @planned_trip = PlannedTrip.new(params[:planned_trip])
    @planned_trip.user_id = session[:user_id]
    @planned_trip.start_loc = params[:start_location]
    @planned_trip.end_loc = params[:end_location]
    @planned_trip.save
  end

  def destroy
    PlannedTrip.find(params[:id]).destroy
    flash[:success] = "Trip removed"
    redirect_to root_path
  end

  def destroy_all
    @planned_trips = PlannedTrip.where(user_id: session[:user_id])
    @planned_trips.destroy_all
    flash[:success] = "Trips removed"
    redirect_to root_path
  end
end
