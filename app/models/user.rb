class User < ApplicationRecord
    
    has_many :restaurants 
    has_many :companies, through: :restaurants
    has_many :reviews, foreign_key: "reviewer_id", class_name: "Review" 
    has_many :reviewed_companies, through: :reviews, source :company 
    
    validates :username, :email, presence: true 
    validates :username, :email, uniqueness: true
    has_secure_password
end
