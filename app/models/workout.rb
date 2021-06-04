class Workout < ApplicationRecord
    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises
    has_many :user_workouts
    has_many :users, through: :user_workouts 
    # accepts_nested_attributes_for :exercises, reject_if: proc { |attributes| attributes['name'].blank? }

    def exercises_attributes=(exercises_hashes)
        exercises_hashes.each do |i, exercise_attributes| 
            unless exercise_attributes[:name].empty? 
                exercise = Exercise.find_or_create_by(name: exercise_attributes[:name])
                self.workout_exercises.build(exercise: exercise) 
            end
        end
    end


    def self.by_creator(user_id)
        where(creator: User.find(user_id).username)
    end
end