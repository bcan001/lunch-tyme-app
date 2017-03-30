Geocoder.configure(
  # geocoding service
  lookup: :google,

  # IP address geocoding service (see below for supported options):
  :ip_lookup => :freegeoip,

  # to use an API key:
  :api_key => "AIzaSyDDtZt-otrjiJeIMORRliSUjrQUUjvjaHU",

  # geocoding service request timeout (in seconds)
  timeout: 3,

  # default units
  units: :km
)