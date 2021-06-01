class WorkoutsController < ApplicationController
    def index

    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.create()
    end

    def show

    end

    def edit

    end

    def update
        
    end
end
