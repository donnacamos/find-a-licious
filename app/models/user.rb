class User < ApplicationRecord
    
    has_many :restaurants 
    has_many :restaurants, through: :cities 
    has_many :reviews, foreign_key: "reviewer_id", class_name: "Review" 
    has_many :reviewed_restaurants, through: :reviews
    
    validates :username, :email, presence: true 
    validates :username, :email, uniqueness: true
    has_secure_password 
end
