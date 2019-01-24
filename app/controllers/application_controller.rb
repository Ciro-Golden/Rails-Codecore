class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception


    helper_method :current_user, :logged_in? 


    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end
# return this user if, session user id (there is a user id that stored in our Database then find the user in our Database)

    def logged_in?
        !!current_user
    end


    def require_user
        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action!"
            redirect_to root_path
        end
    end

end
