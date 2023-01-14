class ApplicationController < ActionController::Base
    
    before_action :set_current_user
    before_action :require_user_logged_in 
    
 #returns true is a user is logged in, otherwise returns false


  
    private

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id]) 
        else
        
        end
    end

    def require_user_logged_in
        unless logged_in?
            redirect_to sign_in_path, alert: "Sign in to perform this action" 
        end
    end
    def logged_in?
        !Current.user.nil?
     end

end
