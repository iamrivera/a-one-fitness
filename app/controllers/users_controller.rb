class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :show, :index]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
            if @user.save
                login_user(@user)
            else
                render :new
            end

        # if existing_user 
        #     login_user(existing_user)
        # else
        #     signup_user
        # end
    end

    def show
        @user = User.find(params[:id])
        @workouts = Workout.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(username: params[:user][:username], bio: params[:user][:bio], birthday: params[:user][:birthday], height_inches: params[:user][:height_inches], weight_pounds: params[:user][:weight_pounds]) #update accordingly to account for Omniauth - add password and password confirmation

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
        user = User.find_by(username: params[:user][:username])
    end
    
    
    def login_user(user)
        # return head(:forbidden) unless user.authenticate(params[:user][:password])
        session[:user_id] = user.id 
        redirect_to user_path(user)
    end

    def signup_user
        @user = User.new(user_params)
        if @user.save 
            set_session(@user)
            redirect_to user_path(@user)
        else
            render :new 
        end
    end
end
