class CitiesController < ApplicationController

    def new 
        @city = City.new 
    end 

    def create 
        @city = current_user.cities.build(city_params)  
        if city.valid?
            city.save
            redirect_to city_path(@city)
        else 
            render :new 
        end  
    end
    
    def edit 
        @city = City.find_by(id: params[:id])
    end 

    def update
        @city = City.find_by(id: params[:id])
        if @city.update(city_params)
            redirect_to city_path(@city)
        else 
            render :edit
        end 
    end 

    def index 
        @cities = City.all
    end 


    private 

    def city_params 
        params.require(:city).permit(:name, :state_abbreviation, :zip_code)
    end 
end
