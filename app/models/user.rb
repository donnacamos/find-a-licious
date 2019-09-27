class User < ApplicationRecord
    
    has_many :restaurants 
    has_many :restaurants, through: :cities 
 
    has_secure_password
    validates :username, :email, presence: true 
    validates :username, uniqueness: true
    
end
