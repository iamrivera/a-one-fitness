class User < ApplicationRecord
    has_secure_password
    has_many :user_workouts
    has_many :workouts,  through: :user_workouts
    has_many :exercises, through: :workouts
    
    validates :username, uniqueness: true 


    def name 
        first_name + " " + last_name
    end
end