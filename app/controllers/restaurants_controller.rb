class RestaurantsController < ApplicationController
    def cheap_restaurants
        @restaurants = Restaurant.cheap_restaurants
    end 
end
