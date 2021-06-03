class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    def logged_in? 
        session[:id].present?
    end

    def current_user
        @current_user = User.find(session[:id])
        @current_user
    end
    
end
