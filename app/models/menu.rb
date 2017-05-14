class Menu

	def initialize(args)	
		@restaurant_id = args[:restaurant_id]
		@restaurant_lat = args[:restaurant_lat]
		@restaurant_lon = args[:restaurant_lon]
		@yelp_restaurant = args[:yelp_restaurant]
		@zomato_restaurant_id = nil
		@menu_url = nil
		# @daily_menu = nil

		@yelp_menu_endpoint = "https://www.yelp.com/menu/"
		@zomato_api_endpoint = "https://developers.zomato.com/api/v2.1"

		@restaurant = get_restaurant_from_zomato
		# scrape_yelp_for_menu(@restaurant_id)
	end

	# def scrape_yelp_for_menu(yelp_restaurant_id)
	# 	# yelp_restaurant_id = @restaurant_id
	# 	@yelp_menu_url = @yelp_menu_endpoint + yelp_restaurant_id
	# 	@response = HTTParty.get(@yelp_menu_url)
	# end

	def get_restaurant_from_zomato
		require 'open-uri'
		require 'json'

		@params = {
				"lat" => @restaurant_lat,
				"lon" => @restaurant_lon
			}

		@result = query_zomato({"user-key" => "c811bf533cfe6a3a6cdd61875a78ea39"},{"lat" => @restaurant_lat,"lon" => @restaurant_lon},'geocode')

		@result['nearby_restaurants'].each do |nearby_restaurant|
			# compare with @yelp_restaurant to get nearby_restaurant['restaurant']['R']['res_id']
			# nearby_restaurant['restaurant']['name']
			# nearby_restaurant['restaurant']['address']
			# nearby_restaurant['restaurant']['city']

			@zomato_address = nearby_restaurant['restaurant']['location']['address'].scan(/\d+/).join
			@yelp_address = @yelp_restaurant[:address].scan(/\d+/).join

			if @zomato_address.include?(@yelp_address) || @yelp_address.include?(@zomato_address)
				@zomato_restaurant_id = nearby_restaurant['restaurant']['R']['res_id']
			end

		end

		# if @zomato_restaurant_id == nil
		# 	@zomato_restaurant_id = @result['nearby_restaurants'][0]['restaurant']['R']['res_id']
		# end


		@result = query_zomato({"user-key" => "c811bf533cfe6a3a6cdd61875a78ea39"},{"res_id" => @zomato_restaurant_id},'restaurant')

		@menu_url = @result['menu_url']



		# @result = query_zomato({"user_key" => "c811bf533cfe6a3a6cdd61875a78ea39"},{"res_id" => @zomato_restaurant_id},'dailymenu')

		# @daily_menu = @result

	end


	def query_zomato(header_params,query_params,endpoint_extension)
		@params = header_params
		# binding.pry
		@uri = URI.parse("#{@zomato_api_endpoint}/#{endpoint_extension}")
		@uri.query = URI.encode_www_form(@params)
		JSON.parse(open(@uri, header_params).read)
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





		@menu = {
			# daily_menu: @daily_menu,
			menu_url: @menu_url,
			categories: [
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


