class RestaurantsController < ApplicationController

  def index

    if params[:search].present?
      @restaurants = Restaurant.near(params[:search])
      @my_ip_location = Geocoder.coordinates(params[:search])
      @geo_locate = false
    else
      @restaurants = Restaurant.near(helpers.remote_ip)
      @my_ip_location = Geocoder.coordinates(helpers.remote_ip)
      @geo_locate = true
    end

  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
  end
end
