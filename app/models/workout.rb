class Workout < ApplicationRecord
    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises
    has_many :user_workouts
    has_many :users, through: :user_workouts 
    accepts_nested_attributes_for :exercises

    def exercises_attributes=(exercises_hashes)
        exercises_hashes.each do |i, exercise_attributes| 
            exercise = Exercise.find_or_create_by(name: exercise_attributes[:name])
            self.workout_exercises.build(exercise: exercise) 
        end
    end
end