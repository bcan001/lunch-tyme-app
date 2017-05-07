class RestaurantsController < ApplicationController

	def index
		if params[:find_food_based_on_history]
			# search for food based on algorithm

  	elsif params[:find_food_based_on_search]
  		if params[:search] != '' && params[:search]
	      # search for food based on what they search for

	    else
	    	flash.notice = 'Please enter something to search for!'
				redirect_to controller: 'restaurants', action: 'index'
		  	return false
	    end
  	end

	end





end

