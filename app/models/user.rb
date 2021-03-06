class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email

  def remote_ip
    if Rails.env.production?
		  request.remote_ip
		else
			# '73.110.34.185'
			# "148.90.78.177"
		  Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
		  # "69.128.144.127"
		end
  end

  def user_location
  	# binding.pry
  	Geocoder.search(self.remote_ip)
  	# Geocoder.search('50.131.44.114')
  end

	def current_location_city
		self.user_location.first.data['city']
	end

	def current_location_latitude
		self.user_location.first.data['latitude']
	end

	def current_location_longitude
		self.user_location.first.data['longitude']
	end

  def user_locale
		{
			cc: 'US',
			lang: 'en'
		}
	end

end
