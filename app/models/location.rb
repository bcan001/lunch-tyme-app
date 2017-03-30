class Location < ApplicationRecord
	geocoded_by :ip_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
end
