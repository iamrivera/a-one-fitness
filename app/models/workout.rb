class Workout < ApplicationRecord
    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises
    has_many :user_workouts
    has_many :users, through: :user_workouts 
    accepts_nested_attributes_for :exercises

    def exercises_attributes=(exercise_attributes)
        exercise_attributes.values.each do |exercise_attribute|
            exercise = Exercise.find_or_create_by(exercise_attribute)
            self.categories << exercise
        end
    end
end