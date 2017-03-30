class RestaurantsController < ApplicationController

	def index

		@user_city = user_location.first.data['city']
		@user_latitude = user_location.first.data['latitude']
		@user_longitude = user_location.first.data['longitude']

	  @close_restaurants = Yelp.client.search(@user_city,user_search_params,user_locale)

	 

	 


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



# {
#     "businesses": [
#         {
#             "categories": [
#                 [
#                     "Local Flavor",
#                     "localflavor"
#                 ],
#                 [
#                     "Mass Media",
#                     "massmedia"
#                 ]
#             ],
#             "display_phone": "+1-415-908-3801",
#             "id": "yelp-san-francisco",
#             "image_url": "http://s3-media3.fl.yelpcdn.com/bphoto/nQK-6_vZMt5n88zsAS94ew/ms.jpg",
#             "is_claimed": true,
#             "is_closed": false,
#             "location": {
#                 "address": [
#                     "140 New Montgomery St"
#                 ],
#                 "city": "San Francisco",
#                 "coordinate": {
#                     "latitude": 37.7867703362929,
#                     "longitude": -122.399958372115
#                 },
#                 "country_code": "US",
#                 "cross_streets": "Natoma St & Minna St",
#                 "display_address": [
#                     "140 New Montgomery St",
#                     "Financial District",
#                     "San Francisco, CA 94105"
#                 ],
#                 "geo_accuracy": 9.5,
#                 "neighborhoods": [
#                     "Financial District",
#                     "SoMa"
#                 ],
#                 "postal_code": "94105",
#                 "state_code": "CA"
#             },
#             "mobile_url": "http://m.yelp.com/biz/yelp-san-francisco",
#             "name": "Yelp",
#             "phone": "4159083801",
#             "rating": 2.5,
#             "rating_img_url": "http://s3-media4.fl.yelpcdn.com/assets/2/www/img/c7fb9aff59f9/ico/stars/v1/stars_2_half.png",
#             "rating_img_url_large": "http://s3-media2.fl.yelpcdn.com/assets/2/www/img/d63e3add9901/ico/stars/v1/stars_large_2_half.png",
#             "rating_img_url_small": "http://s3-media4.fl.yelpcdn.com/assets/2/www/img/8e8633e5f8f0/ico/stars/v1/stars_small_2_half.png",
#             "review_count": 7140,
#             "snippet_image_url": "http://s3-media4.fl.yelpcdn.com/photo/YcjPScwVxF05kj6zt10Fxw/ms.jpg",
#             "snippet_text": "What would I do without Yelp?\n\nI wouldn't be HALF the foodie I've become it weren't for this business.    \n\nYelp makes it virtually effortless to discover new...",
#             "url": "http://www.yelp.com/biz/yelp-san-francisco"
#         }
#     ],
#     "total": 2316
# }














