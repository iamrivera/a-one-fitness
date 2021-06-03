class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.autheticate(params[:password])
        session[:user_id] = @user.id 
    end

    def destroy
        session.delete(:id)
        redirect_to "/" #set up home page
    end

end