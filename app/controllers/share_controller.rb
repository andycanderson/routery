class ShareController < ApplicationController

  def index
    # target user's id passed

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
    # target trip passed
    @trip_name = Trip.find(params[:id]).name
    @locations = Location.where(trip_id: params[:id])
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