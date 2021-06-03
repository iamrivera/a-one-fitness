class WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
    end

    def new
        @workout = Workout.new
        current_user
    end

    def create
        # @user = User.find(session[:id]) #replace with current_user
        @workout = current_user.workouts.create(workout_params.merge(creator: current_user.username))
        # @user.workouts << @workout

        redirect_to workout_path(@workout)
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def edit
        # @user = User.find(session[:id])
        @workout = Workout.find(params[:id])
    end

    def update
        @workout = Workout.find(params[:id])
        @workout.update(workout_params)
        redirect_to workout_path(@workout)
    end

    def remove
        @workout = Workout.find(params[:id])
        @user = User.find(session[:id]) 
        @user.workouts.delete(@workout)
        redirect_to user_path(@user)
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
