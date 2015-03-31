class BookmarkedLocationsController < ApplicationController

  def new
    @bookmarked_location = BookmarkedLocation.new
  end

  def create
    bookmarkedLocation = BookmarkedLocation.new(bookmarked_location_params)
    if logged_in?
      puts 'we are logged in.'
      bookmarkedLocation.user_id = session[:user_id]
      if bookmarkedLocation.save
        flash[:notice] = 'Bookmark saved!'
        redirect_to root_path
      end
    else
      puts 'we are not logged in'
      flash[:notice] = 'You must be logged in to use this feature.'
    end
  end

  private

  def bookmarked_location_params
    params.permit(:name, :latitude, :longitude)
  end
end
