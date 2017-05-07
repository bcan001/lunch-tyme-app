module RestaurantsHelper

	def return_user_search_params_based_on_current_user_history
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

	def return_user_search_params_without_search
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

	def return_user_search_params_based_on_search
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
