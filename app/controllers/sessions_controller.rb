class SessionsController < ApplicationController
    
    def new

    end

    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.password_digest = "0"
        end

        session[:user_id] = @user.id
        @user = User.find(@user.id) 
        @user.update(first_name: auth[:info][:name].split[0])
        @user.update(last_name: auth[:info][:name].split[1])
        @user.update(username: "ChangeMe#{rand(123).to_s}") unless !@user.username.empty?

        redirect_to user_path(@user)
    end

    def login
        @user = User.find_by_username(params[:username])
        session[:user_id] = @user.id
        
        redirect_to user_path(@user)
    end

    def destroy
        session.delete(:user_id)
        redirect_to "/" #set up home page
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end