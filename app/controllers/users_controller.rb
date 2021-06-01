class UsersController < ApplicationController
    def index

    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:id] = @user.id 
        redirect_to user_path(@user)
    end

    def show
        @user = User.find(params[:id])
        @workouts = Workout.all
    end

    def edit

    end

    def update
        
    end

    private 

    def user_params #signup vs #edit params 
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
