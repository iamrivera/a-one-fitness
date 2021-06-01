class SessionsController < ApplicationController

    def new
        # @user = User.new()
    end
    
    def create
        @user = User.find(params[:id])
    end

    def destroy
        session.delete(:id)
        redirect_to "/" #set up home page
    end

end