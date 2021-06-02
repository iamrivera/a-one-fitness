class User < ApplicationRecord
    has_secure_password
    has_many :user_workouts
    has_many :workouts,  through: :user_workouts
    has_many :exercises, through: :workouts
    
end