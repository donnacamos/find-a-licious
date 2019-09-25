class RestaurantsController < ApplicationController
    before_action :check_for_logged_in, except: [:index] 

    def new 
        if params[:company_id] && company = Company.find_by_id(params[:company_id]) 
        @restaurant = company.restaurants.build 
        else 
        @restaurant = Restaurant.new 
        @restaurant.build_company 
        end  
    end 

    def create 
        @restaurant = current_user.restaurants.build(restaurant_params)
        @restaurant.user_id = current_user.id 
        if @restaurant.save 
            redirect_to restaurant_path(@restaurant)
        else 
            @restaurant.build_company unless @restaurant.company 
            render :new
        end 
    end 

    def index
        if params[:company_id] && company = Company.find_by_id(params[:company_id])
          #nested route
          @restaurants = companies.restaurants 
        else
           if params[:price_range] 
              @restaurants = Restaurants.search_by_price_range(params[:price_range]).order_by_price_range.includes(:company,:user)
              @restaurants = Restaurants.order_by_price_range if @restaurants == []
            else
              @restaurants = Restaurant.includes(:company,:user).order_by_price_range 
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
