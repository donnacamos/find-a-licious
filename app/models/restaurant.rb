class Restaurant < ApplicationRecord
    belongs_to :user 
    belongs_to :city
    # validates :name, :location, presence: true  
    # validates :name, length: { minimum: 3, 
    # too_long: "%{count} characters is the minimum allowed"
   # validates :city_id, presence: true 
   # validates_associated :city 

    # def city_attributes=(attributes)
    #     city = City.find_or_create_by(attributes)
    #     self.city = city if city.valid? || !self.city 
    # end 

    

    
end
