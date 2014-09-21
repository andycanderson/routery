class ShareController < ApplicationController

  def index
    @share = true
    @user_name = User.find(params[:id]).name
    @locations = Location.where(user_id: params[:id])
    @arr = []
    @descriptions = []
    @names = []
    @locations.each do |location| 
      @arr<<location.coordinates
      @names<<[location.name]
      @descriptions<<[location.description] 
    end
    
  end

  def show
    @share = true
    trip = Trip.find(params[:id])
    @trip_name = trip.name
    @locations = Location.where(trip_id: params[:id])
    @user_name = User.find_by(id: trip.user_id).name
    @arr = []
    @descriptions = []
    @names = []
    @locations.each do |location| 
      @arr<<location.coordinates
      @names<<[location.name]
      @descriptions<<[location.description] 
    end
  end

  def getlink
    # add params trip_id


    @shareTrip = "localhost:3000/share/#{}"
    @shareAll = "localhost:3000/shareAll/#{}"
  end

end