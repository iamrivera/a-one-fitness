
# docportal

Welcome to A1 Fitness! 
A1 Fitness was created to simulate a basic web application that manages an online fitness community. Users can register to create workouts using a library of existing exercies and/or by creating their own. All users must register directly via the platform or using Omniauth.


# Development
A1 Fitness was developed using Rails and various gems such as Omniauth and Bcrypt. 

# Structure 
```
|_ App
   |_ Controllers 
      |_ Application Controller 
      |_ Sessions_controller
      |_ Exercises_controller
      |_ Users_controller
      |_ Workouts_controller
   |_ Models
      |_ Exercise
      |_ User
      |_ Workout
      |_ User_workout
      |_ Workout_exercise
   |_ Views
      |_ Exercises (Show / New / Edit / Index)
      |_ Users (Show / New / Edit / Index)
      |_ Workoutss (Show / New / Edit / Index)
      |_ Sessions (New)
```

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/iamrivera/a-one-fitness.

# License
This is available as open source under the terms of the MIT License.
