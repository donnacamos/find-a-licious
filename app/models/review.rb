class Review < ApplicationRecord
    belongs_to :users 
    belongs_to :restaurants 

    validates :title, length: {maximum: 25}
    validates :content, length: {maximum: 250}
end
