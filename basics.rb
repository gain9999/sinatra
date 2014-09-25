# 5631358821 Siraphob Boonvanich
# 5631332421 Viranpat Vongswasdi
require 'sinatra'
require 'geocoder'
require 'timezone'
 
get '/' do
  erb :form
end
 
Timezone::Configure.begin do |c| 
  c.username = 'gain9999' # get your username from http://www.geonames.org/login 
  # then go to http://www.geonames.org/manageaccount and click enable at the bottom of the page
end
post '/form' do
  city = params[:message]
  latlong = Geocoder.coordinates(city.capitalize)
  timezone = Timezone::Zone.new(:latlon => latlong)
 
  #t = timezone.time Time.now.strftime("%H:%M %p") # 2014-09-23 13:46:25 UTC
  t = timezone.time Time.now
  t2 = t.to_s.split(' ')
  time = t2[1].split(':')
  h = time[0].to_i
  m = time[1]
  if(h>12) 
    h = h - 12
    clock = "PM"
  else 
    clock = "AM"
  end
  "<center>The current time in #{city} is <br><br><h1> #{h}:#{m}#{clock}  </h1><center/>"
 
end
