class ExercisesController < ApplicationController
    def index

    end

    def new

    end

    def create
        @exercise = Exercise.create()
    end

    def show
        @user = User.find(session[:id]) 
        @exercise = Exercise.find(params[:id])
    end

    def edit

    end

    def update
        
    end

    def destroy
        @exercise = Exercise.find(params[:id])
        @exercise.destory 
    end
end
