class RestaurantsController < ApplicationController
	include RestaurantsHelper

	before_action :set_current_user_location

	def index
		if params[:find_food_based_on_history]
			# search for food based on algorithm. WHEN THEY CLICK DECIDE FOR ME
			@user_search_params = return_user_search_params_based_on_current_user_history
			@restaurants = Yelp.client.search(current_user.current_location_city,@user_search_params,current_user.user_locale)
  	elsif params[:find_food_based_on_search]
  		if params[:search] != '' && params[:search]
	      # search for food based on what they search for
	      @user_search_params = return_user_search_params_based_on_search
	      @restaurants = Yelp.client.search(current_user.current_location_city,@user_search_params,current_user.user_locale)
	    else
	    	flash.notice = 'Please enter something to search for!'
				redirect_to controller: 'restaurants', action: 'index'
		  	return false
	    end
	  else
	  	# no search is entered. display appropriate restaurants
	  	@user_search_params = return_user_search_params_without_search
	  	fetch_retaurants_of_the_day_and_past_week_for_index
  	end
  end

  private
  		
  def fetch_retaurants_of_the_day_and_past_week_for_index
  	@restaurants = Yelp.client.search(current_user.current_location_city,@user_search_params,current_user.user_locale)

  	# NEED 3 RESTAURANTS OF THE DAY (TODAY)
	  # NEED 5 RESTAURANTS FOR TODAY, YESTERDAY, DAY BEFORE (PAGINATED)

	  @restaurants_of_the_day = @restaurants[0..4]
	  # @restaurants_of_the_day_history = [{}]
  end



end

