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
        # raise params.inspect
        @workout = Workout.find(params[:id])
    end

    def edit

    end

    def update
        
    end

    def destroy
        @workout = Workout.find(params[:id])
        @workout.destroy 
        redirect_to user_path(params[:user_id])
    end 

    private 

    def workout_params
        params.require(:workout).permit(:name, :description, exercise_ids: [], exercises_attributes: [:name])
    end
end
