class HomeController < ApplicationController
	def index
		if @current_user != nil
			redirect_to "/locations"
		end
	end
end
