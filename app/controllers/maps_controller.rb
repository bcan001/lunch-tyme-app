class MapsController < ApplicationController

	def index

		@user_city = user_location.first.data['city']
		@user_latitude = user_location.first.data['latitude']
		@user_longitude = user_location.first.data['longitude']

	  @close_restaurants = Yelp.client.search(@user_city,user_search_params,user_locale)

	 	
	 	# binding.pry

	end

	private

	def user_locale
		{
			cc: 'US',
			lang: 'en'
		}
	end

	def user_search_params
		# https://www.yelp.com/developers/documentation/v2/search_api
		{
			term: 'food',
			limit: 3,
			sort: 0 # 0=best matched, 1=distance, 2=highest rated
			# category_filter: , # category to filter search results https://www.yelp.com/developers/documentation/v2/all_category_list
			# radius_filter: , # search radius, in meters. The max value is 40000 meters (25 miles).
			# deals_filter , # search for restaurants with deals. boolean
		}
	end
end



