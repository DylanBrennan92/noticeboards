class RegistrationsController < ApplicationController
    skip_before_action :require_user_logged_in 
    
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Account successfully created"
        else
            render :new , notice: 'Issue creating Account'
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
