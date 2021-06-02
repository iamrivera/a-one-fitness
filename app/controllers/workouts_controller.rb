class WorkoutsController < ApplicationController
    def index

    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.create(workout_params)
        redirect_to workout_path(@workout)


    end

    def show
        @workout = Workout.find(session[:id])
    end

    def edit

    end

    def update
        
    end

    private 

    def workout_params
        params.require(:workout).permit(:name, :description)
    end
end
