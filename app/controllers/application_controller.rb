class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :is_administrator?

    #helper methods used in session management processes
    def current_user #returns the user who is currently logged in
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in? #returns true if a user is logged in, false if not
        !current_user.nil?
    end

    def is_administrator? #returns whether the session holder is an admin or not
        session[:isAdmin]
    end

    private
    def require_login
        unless logged_in?
            flash[:error] = "you are not permitted to access this resource."
            redirect_to login_path
        end
    end
end
