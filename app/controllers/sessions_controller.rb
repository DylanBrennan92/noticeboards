class SessionsController < ApplicationController
    skip_before_action :require_user_logged_in


    #log out a user by destroying the session
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end

    #allows for a new sign_in, will point to session/new.html.erb
    def new
    end

    #Create to sign in an existing user - throws alert error if not valid credentials 
    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"

        else
            flash[:alert] = "Invalid login credentials"
            render :new
        end
    end
 

    
end
