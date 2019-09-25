class ReviewsController < ApplicationController
    before_action :check_for_logged_in, only: [:new, :create, :edit, :update] 
    
    def index 
      @company = Company.find_by_id(params[:company_id])
      if @company 
        @reviews = @company.reviews 
      else 
        redirect_to companies_path 
      end 
    end 
    
    def new 
        @company = Company.find_by_id(params[:company_id])
        @review = @company.reviews.build 
    end 

    def create 
        @company = company.find_by_id(params[:company_id])
        @review = current_user.reviews.build(review_params)
        @review.company = @company 
        if @review.save 
            redirect_to company_path(@review.company)
        else 
            render :new 
        end 
    end 

    private 
    
      def review_params
        params.require(:review).permit(:content, :rating)
      end 
    end 

   