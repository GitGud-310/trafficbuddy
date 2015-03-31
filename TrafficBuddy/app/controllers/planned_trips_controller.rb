class PlannedTripsController < ApplicationController
  def index
    @planned_trips = PlannedTrip.all
  end

  def new
    @planned_trip = PlannedTrip.new
  end

  def create
    @planned_trip = PlannedTrip.create
  end

  def update
    @planned_trip = PlannedTrip.find(params[:id])
    @planned_trip.update(trips_param)
    redirect_to root_path
  end

  def trips_param
    params.require(:planned_trip).permit(:start_loc, :end_loc)
  end

  def destroy
    PlannedTrip.find(params[:id]).destroy
    flash[:success] = "Trip removed"
  end
end
