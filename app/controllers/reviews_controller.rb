class ReviewsController < ApplicationController
    def new 
        @review = Review.new 
    end 

    def create 
        @review = current_user.reviews.build(review_params)
        @review.user_id = current_user.id 
        if @review.save 
            redirect_to review_path(@review) 
        else 
            render :new
        end 
    end 

    def show 
        set_review 
      end 
  
      def edit 
        set_review 
      end 
  
      def update 
          set_review 
          if @review.update(review_params)
              redirect_to review_path(@review)
          else 
              render :edit
          end 
      end 
  
      def destroy 
          set_review
          @review.destroy
          redirect_to review_path
      end 
  
      private 
  
      def set_review  
          @review = Review.find_by(id: params[:id])
          if !@review  
            redirect_to reviews_path  
          end 
      end 
  
      def review_params 
          params.require(:review).permit(:title, :content) 
      end 
end
