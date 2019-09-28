class User < ApplicationRecord
    
    has_many :restaurants 
    has_many :cities, through: :restaurants  
    has_many :reviews, through: :restaurants
     
 
    has_secure_password
    validates :username, :email, presence: true 
    validates :username, :email, uniqueness: true

    def self.from_omniauth(auth) 
          where(email: auth.info.email).first_or_initialize do |user|
            user.username = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
          end
        end

    
end
