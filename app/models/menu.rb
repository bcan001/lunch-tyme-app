class Menu

	
	def initialize(args)	
		@restaurant_id = args[:restaurant_id]
		@restaurant_lat = args[:restaurant_lat]
		@restaurant_lon = args[:restaurant_lon]


		# @yelp_url = "https://www.yelp.com/menu/" + @restaurant_id
		@zomato_api_endpoint = "https://developers.zomato.com/api/v2.1"
		@restaurant = get_restaurant_from_zomato
		
	end

	def get_restaurant_from_zomato
		require 'open-uri'
		require 'json'

		params = {
				"lat" => @restaurant_lat,
				"lon" => @restaurant_lon
			}

		uri = URI.parse("#{@zomato_api_endpoint}/geocode")
		uri.query = URI.encode_www_form(params)
		result = JSON.parse(open(uri, {"user-key" => "c811bf533cfe6a3a6cdd61875a78ea39"}).read)

		result[:location][:nearby_restaurants].each do |restaurant|



		end

		# binding.pry


	end


	def build_menu
		# category => 'Fatso Burger'. within category is: description => 'All Fatso Burgers served on a toasted bub, grilled on an open flame and includes, Fatso Sauce, Lettuce, Tomato and Onions (Want Grilled Onion? Just ask!). Add Bacon or Fried Egg for $1.25'
			# item => 'Single Fatso'. has price: $4.65

		# 1. go to construct_yelp_url
		# 2. scrape data and build hash

		# https://github.com/bcan001/skyscraper/blob/9736262de7989d7ed46db4cb1160e6065bbdd59e/lib/tasks/scraper.rake
		

		# zomato api key
		# c811bf533cfe6a3a6cdd61875a78ea39

		# get to /geocode. {user-key: <api-key>, lat: <latitude>, lon: <longitude>}
		# get to /dailymenu. need zomato restaurant_id {user_key: <api-key>, res_id: <zomato restaurant_id>}





		@menu = {categories: [
				{
					name:'Fatso Burger',
					description:'All Fatso Burgers served on a toasted bub, grilled on an open flame and includes, Fatso Sauce, Lettuce, Tomato and Onions (Want Grilled Onion? Just ask!). Add Bacon or Fried Egg for $1.25', items: [
							{name: 'Single Fatso', price: '$4.65'},
							{name: 'Double Fatso', price: '$6.65'},
							{name: 'Triple Fatso', price: '$8.65'},
							{name: 'Quadruple Fatso', price: '$10.65'}
						]
					},
				{
					name:'Fatso Burger w/cheese',
					description:'All Fatso Burgers w/cheese served on a toasted bub, grilled on an open flame and includes, Fatso Sauce, Lettuce, Tomato and Onions (Want Grilled Onion? Just ask!). Add Bacon or Fried Egg for $1.25', items: [
							{name: 'Single Fatso w/cheese', price: '$5.65'},
							{name: 'Double Fatso w/cheese', price: '$6.65'},
							{name: 'Triple Fatso w/cheese', price: '$7.65'},
							{name: 'Quadruple Fatso w/cheese', price: '$11.65'}
						]
					},
				{
					name:'Fatso Smash Burger',
					description:'Our Fatso Patty, Smashed, Served on a Toasted Bun, Grilled on a Flat Top Grill and Includes Fatso Sauce, Lettuce, Tomato and Onion (Want Grilled Onion? Just ask!). Add Bacon or Fried Egg for $1.25', items: [
							{name: 'Single Smash', price: '$3.65'},
							{name: 'Double Smash', price: '$9.65'},
							{name: 'Triple Smash', price: '$11.65'},
							{name: 'Quadruple Smash', price: '$14.65'}
						]
				}
			]
		}
	end


end


