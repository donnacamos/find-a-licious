class RestaurantsController < ApplicationController
     

  def index
    if params[:user_id]
      @restaurants = User.find(params[user_id]).restaurants
    else
      @restaurants = Restaurant.all 
    end 
  end

    def new 
      @restaurant = Restaurant.new 
    end 

    def create 
      @restaurant = current_user.created_restaurants.build(restaurant_params)
      if @restaurant.valid? 
        @restaurant.save
        redirect_to restaurant_path(@restaurant)  
      else 
        render :new 
        end 
    end 


    def show 
     @restaurant = Restaurant.find_by(id: params[:id])
    end 

    def edit 
      @restaurant = Restaurant.find_by(id: params[:id])
    end 

    def update
      @restaurant = Restaurant.find_by(id: params[:id])
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else 
        render :edit
      end 
    end 


    def destroy 
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy

      redirect_to restaurants_path
     end 

    private 

  
    def restaurant_params 
        params.require(:restaurant).permit(:name, :type, :location, :price_range)
    end 
end
