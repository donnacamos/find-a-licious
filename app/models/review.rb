class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :restaurant 

    validates :title, length: {maximum: 25}
    validates :content, length: {maximum: 250}
end
