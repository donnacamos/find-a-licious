class Restaurant < ApplicationRecord
    belongs_to :user 
    has_many :users, through: :reviews 
end
