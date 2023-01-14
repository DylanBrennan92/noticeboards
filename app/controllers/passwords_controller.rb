class PasswordsController < ApplicationController

    #check user logged in - in app_controller before any actions
    before_action :require_user_logged_in

    def edit
    end
    def update
        if Current.user.update(password_params)
            redirect_to root_path, notice: "Password successfully changed!"
        else
            render :edit

        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
