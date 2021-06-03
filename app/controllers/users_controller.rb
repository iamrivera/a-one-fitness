class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def index

    end

    def new
        @user = User.new
    end

    def create
        if existing_user 
            login_user(existing_user)
        else
            signup_user
        end
    end

    def show
        @user = User.find(params[:id])
        @workouts = Workout.all
    end

    def edit
        current_user
    end

    def update
        @user = User.find(params[:id])
        @user.update(bio: params[:user][:bio], birthday: params[:user][:birthday], height_inches: params[:user][:height_inches], weight_pounds: params[:user][:weight_pounds])

        redirect_to user_path(@user)
    end

    private 

    def user_params #signup vs #edit params 
        params.require(:user).permit(:username, :first_name, :last_name, :email, :bio, :birthday, :height_inches, :weight_pounds, :password, :password_confirmation, workout_ids: [])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id 
    end

    
    def existing_user
        @user = User.find_by(username: params[:user][:username])
    end
    
    
    def login_user(user)
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

    def signup_user
        @user = User.create(user_params)
        set_session(@user)
        redirect_to user_path(@user)
    end
end
