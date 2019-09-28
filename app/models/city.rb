class City < ApplicationRecord
    belongs_to :user 
    has_many :restaurants 
    has_many :users, through: :restaurants 

    validates :name, :state_abbreviation, :zip_code, presence: true 
    validates :name, uniqueness: true 
    validates :name, length: {minimum: 2} 
    validates :state_abbreviation, presence: true 
    validates :state_abbreviation, length: {maximum: 2}
    validates :zip_code, length: {maximum: 5} 

    validate :not_a_duplicate 
    


    def not_a_duplicate 

        if City.find_by(name: name, state_abbreviation: state_abbreviation, zip_code: zip_code, user_id: user_id) 
            errors.add("city", "has already been used - this city has already been created") 
        end 
    end 
end
