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
		  # Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
		  "69.128.144.113"
		end
  end

  def user_location
  	Geocoder.search(self.remote_ip)
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
