class RestaurantsController < ApplicationController
    def new 
        if params[:user_id] && user = User.find_by_id(params[:user_id]) 
        @restaurant = user.restaurants.build 
        else 
        @restaurant = Restaurant.new 
        end  
    end 

    def create 
        @restaurant = current_user.restaurants.build(restaurant_params)
        @restaurant.user_id = current_user.id 
        if @restaurant.save 
            redirect_to restaurant_path(@restaurant)
        else 
            render :new
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
