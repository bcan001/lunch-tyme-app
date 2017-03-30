class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    restaurants_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end


  def remote_ip
    if Rails.env.production?
		  request.remote_ip
		else
		  # Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
		  "69.128.144.113"
		end
  end

  def user_location
  	Geocoder.search(remote_ip)
  end


end
