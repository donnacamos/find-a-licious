class Restaurant < ApplicationRecord
    belongs_to :user 
    belongs_to :review 

    def self.cheap_restaurants 
        where(:price_range < 2) 
    end 
end
