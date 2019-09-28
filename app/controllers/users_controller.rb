class UsersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    #loading the signup form
    def new
      @user = User.new
    end
  
    #signup
    def create
      @user = User.new(user_params)
      if @user.save 
        session[:user_id] = @user.id 
        redirect_to user_path(@user)   
      else
        render :new
      end
    end

   def show 
     @user = User.find(params[:id]) 
   end 

   def index 
    @users = User.all
   end 


  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
  end
