require 'httparty'
require 'pry'

# class Location(city, state)
# TenDayForecast
# CurrentConditions

def get_json(state, city)
  HTTParty.get("http://api.wunderground.com/api/b0938627f87459c4/conditions/q/#{state}/#{city}.json").parsed_response
end

def ten_day(state, city)
  HTTParty.get("http://api.wunderground.com/api/b0938627f87459c4/forecast10day/q/#{state}/#{city}.json").parsed_response
end


p "Im gonna get your weather, what is the abrieviation of you states name?"
  state = gets.chomp

p "Now I need you city"
  city = gets.chomp


long_forecast = ten_day(state, city)
response = get_json(state, city)
binding.pry

current_observation = response["current_observation"]
current_temp_f = current_observation["temp_f"]
current_temp_c = current_observation["temp_c"]
current_humidity = current_observation["relative_humidity"]
current_wind = current_observation["wind_mph"]
current_gusts = current_observation["wind_gust_mph"]
current_uv = current_observation["UV"]

tendays = {}

long_forecast["forecast"]["txt_forecast"]["forecastday"].each do |f|
  tendays[f["period"]] = [f["title"], f["fcttext"]]
end

puts "in #{city}, #{state} the current temperature in Fareignieght is #{current_temp_f} while the current
tempurature in Celcius is #{current_temp_c}. The humidity in your location is #{current_humidity} percent with #{current_wind} mph
steady wind and #{current_gusts} gusts to counter the boggyness."
puts "Your experiencing a UV light score of#{current_uv}, and your precise lognituude and latitude is #{current_latitude},
 and #{current_longitude}."
puts "I hope that this weather report was useful! Take care."

puts tendays[0]
puts tendays[1]
puts tendays[2]
puts tendays[3]
puts tendays[4]
puts tendays[5]
puts tendays[6]
puts tendays[7]
puts tendays[8]
puts tendays[9]
puts tendays[10]
puts tendays[11]
puts tendays[12]
puts tendays[13]
puts tendays[14]
puts tendays[15]
puts tendays[16]
puts tendays[17]


binding.pry

#b0938627f87459c4
