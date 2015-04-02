class BookmarkedLocationsController < ApplicationController

  def index
    @bookmarked_location = BookmarkedLocation.all
  end

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

  def show
    @bookmarked_location=BookmarkedLocation.find(params[:id])
  end

  def delete
    BookmarkedLocation.find(params[:id]).destroy
    flash[:success] = "Bookmark removed"
    redirect_to root_path
  end

  def destroy
    BookmarkedLocation.find(params[:id]).destroy
    flash[:success] = "Bookmark removed"
    redirect_to root_path
  end

  def destroy_all
    @bookmarked_locations = BookmarkedLocation.where(user_id: session[:user_id])
    @bookmarked_locations.destroy_all
    flash[:success] = "Bookmarks removed"
    redirect_to root_path
  end

  private

  def bookmarked_location_params
    params.permit(:name, :latitude, :longitude)
  end
end
