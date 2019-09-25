class Company < ApplicationRecord
    has_many :restaurants 
    has_many :users, through: :restaurants 
    has_many :reviews 
    has_many :reviewers, through: reviews, source: :reviewer
    
    validates :name, :ceo, :net_worth 
    validates_uniqueness_of :name 
end
