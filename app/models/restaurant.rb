class Restaurant < ApplicationRecord
    belongs_to :user 
    belongs_to :company 
    validates :name, :location, presence: true  
    validates :name, length: { minimum: 3, 
    too_long: "%{count} characters is the minimum allowed"}
    validates :company_id, presence: true 
    validates_associated :company 

    def company_attributes=(attributes)
        company = Company.find_or_create_by(attributes)
        self.company = company if company.valid? || !self.company 
    end 

    

    
end
