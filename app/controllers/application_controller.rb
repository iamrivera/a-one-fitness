class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    def logged_in? 
        session[:user_id].present?
    end

    def current_user
        @current_user = User.find(session[:user_id])
        @current_user
    end

    def set_session(user)
        session[:user_id] = user.id
    end
    
end
