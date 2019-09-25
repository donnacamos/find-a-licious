class City < ApplicationRecord
    has_many :restaurants 
    has_many :users, through: :restaurants 

    validates :name
    validates_uniqueness_of :name 

end
