class RestaurantsController < ApplicationController
    before_action :check_for_logged_in, except: [:index] 

    def new 
        if params[:city_id] && city = City.find_by_id(params[:city_id]) 
        @restaurant = city.restaurants.build 
        else 
        @restaurant = Restaurant.new 
        @restaurant.build_city  
        end  
    end 

    def create 
        @restaurant = current_user.restaurants.build(restaurant_params)
        @restaurant.user_id = current_user.id 
        if @restaurant.save 
            redirect_to restaurant_path(@restaurant)
        else 
            @restaurant.build_city unless @restaurant.city  
            render :new
        end 
    end 

    def index
        if params[:city_id] && city = City.find_by_id(params[:city_id])
          #nested route
          @restaurants = city.restaurants 
        else
           if params[:price_range] 
              @restaurants = Restaurants.search_by_price_range(params[:price_range]).order_by_price_range.includes(:city,:user)
              @restaurants = Restaurants.order_by_price_range if @restaurants == []
            else
              @restaurants = Restaurant.includes(:city,:user).order_by_price_range 
              @cheap = @restaurants.cheap 
              @median = @restaurants.median 
              @expensive = @restaurants.expensive 
            end
        end
      end

    def show 
      set_restaurant 
    end 

    def edit 
      set_restaurant
    end 

    def update 
        set_restaurant 
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(@restaurant)
        else 
            render :edit
        end 
    end 

    def destroy 
        set_restaurant
        @restaurant.destroy
        redirect_to restaurants_path
    end 

    private 

    def set_restaurant 
        @restaurant = Restaurant.find_by(id: params[:id])
        if !@restaurant 
          redirect_to restaurants_path  
        end 
    end 

    def restaurant_params 
        params.require(:restaurant).permit(:name, :type, :location, :price_range)
    end 
end
