class RestaurantsController < ApplicationController
     

  def index
      @restaurants = Restaurant.all 
  end

    def new 
      @restaurant = Restaurant.new 
    end 

    def create 
      @restaurant = current_user.created_restaurants.build(restaurant_params)
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)  
      else 
        render :new 
        end 
    end 


    def show 
     
    end 

    def edit 

    end 

   

    def destroy 
       
    end 

    private 

  
    def restaurant_params 
        params.require(:restaurant).permit(:name, :type, :location, :price_range)
    end 
end
