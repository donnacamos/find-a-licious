class ReviewsController < ApplicationController
    before_action :check_for_logged_in, only: [:new, :create, :edit, :update] 
    
    def index 
      @restaurant = Restaurant.find_by_id(params[:restaurant_id])
      if @restaurant  
        @reviews = @restaurant.reviews 
      else 
        redirect_to restaurants_path 
      end 
    end 
    
    def new 
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @review = @restaurant.reviews.build 
    end 

    def create 
        @restaurant = restaurant.find_by_id(params[:restaurant_id])
        @review = current_user.reviews.build(review_params)
        @review.restaurant = @restaurant  
        if @review.save 
            redirect_to restaurant_path(@review.restaurant)
        else 
            render :new 
        end 
    end 

    private 
    
      def review_params
        params.require(:review).permit(:content, :rating)
      end 
    end 

   