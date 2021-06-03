class UsersController < ApplicationController
    def index

    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        # session[:id] = @user.id 
        redirect_to user_path(@user)
    end

    def show
        @user = User.find(params[:id])
        @workouts = Workout.all
    end

    def edit
        @user = User.find(session[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(bio: params[:user][:bio], birthday: params[:user][:birthday], height_inches: params[:user][:height_inches], weight_pounds: params[:user][:weight_pounds])

        redirect_to user_path(@user)
    end

    private 

    def user_params #signup vs #edit params 
        params.require(:user).permit(:first_name, :last_name, :email, :bio, :birthday, :height_inches, :weight_pounds, :password, :password_confirmation, workout_ids: [])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id 
    end

end
