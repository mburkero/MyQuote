class SessionsController < ApplicationController
    #rendering login screen
    def login
    end

    #login process logic
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) && user.status == "Active" #if login credentails match
            #assigning session parameters
            session[:user_id] = user.id 
            session[:fname] = user.fname
            session[:isAdmin] = user.isAdmin
            #sending admins to admin sessions, standard users to user sessions
            if session[:isAdmin]
                redirect_to admin_path, notice: "Logged in successfully!"
            else
                redirect_to userhome_path, notice: "Logged in successfully!"
            end
        else #if login credentials don't match, reset login sheet
            flash.now[:error] = "Invalid email or password. Try again!"
            render 'login'
        end
    end
    #handling logout process
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out."
    end
end
