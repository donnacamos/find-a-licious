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
        if @review.valid?
          @review.save 
            redirect_to restaurant_path(@review.restaurant)
        else 
            render :new 
        end 
    end 

    def show 
      @review = Review.find_by(id: params[:id])
     end 
 
     def edit 
       @review = Review.find_by(id: params[:id])
     end 
 
     def update
       @review = Review.find_by(id: params[:id])
       if @review.update(review_params)
         redirect_to review_path(@review)
       else 
         render :edit
       end 
     end 
 
 
     def destroy 
       @review = Review.find(params[:id])
       @review.destroy
 
       redirect_to reviews_path
      end 

    private 
    
      def review_params
        params.require(:review).permit(:rating, :content)
       end 
    end 

   