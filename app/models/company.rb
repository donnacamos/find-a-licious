class Company < ApplicationRecord
    has_many :restaurants 
    has_many :restaurants, through: :users 
end
