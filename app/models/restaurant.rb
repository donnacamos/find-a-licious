class Restaurant < ApplicationRecord
    belongs_to :user 
    belongs_to :city 
    has_many :reviews 
    has_many :reviews, through: :users 

     validates :name, :type, :price_range, :address, presence: true  
     validates :name, :address, uniqueness: true  
     validates :name, length: { minimum: 3} 
    

   

    

    
end
