require 'httparty'

class CitiesController < ApplicationController
  def index
    cities = ['Abuja,NG', 'London,GB', 'Nairobi,KE', 'Washington,US', 'Abu Dhabi,UAE']
    @cities = []

    cities.each do |city|
      response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPENWEATHER_API_KEY']}")

      cities_data = JSON.parse(response.body)

      city_details = {
        name: cities_data["name"],
        temperature: cities_data["main"]["temp"],
        humidity: cities_data["main"]["humidity"],
        wind_speed: cities_data["wind"]["speed"],
        description: cities_data["weather"].first["description"]
      }

      @cities << city_details
    end
  end

  def show
    city_name = params[:id]
    resp = HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?q=#{city_name}&appid=#{ENV['OPENWEATHER_API_KEY']}")
    city_forecast_data = JSON.parse(resp.body)
    @city_forecast = city_forecast_data
  end
end
