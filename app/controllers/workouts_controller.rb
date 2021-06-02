class WorkoutsController < ApplicationController
    def index
        @user = User.find(session[:id])
        @workouts = Workout.all
    end

    def new
        @workout = Workout.new
        @user = User.find(session[:id])
    end

    def create
        @workout = Workout.create(workout_params)
        @user = User.find(session[:id])
        @user.workouts << @workout
        redirect_to workout_path(@workout)
    end

    def show
        @user = User.find(session[:id]) 
        @workout = Workout.find(params[:id])
    end

    def edit
        
    end

    def update
        
    end

    def remove
        @workout = Workout.find(params[:id])
        @user = User.find(session[:id]) 
        @user.workouts.delete(@workout)
        redirect_to user_path(@user)
    end

    def destroy
        raise params.inspect
        @workout = Workout.find(params[:id])
        @workout.destroy 
        redirect_to user_path(params[:user_id])
    end 

    private 

    def workout_params
        params.require(:workout).permit(:name, :description, exercise_ids: [], exercises_attributes: [:name])
    end
end
