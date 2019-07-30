class UsersController < ApplicationController
    # GET users/new
    def new
        @user = User.new
    end
    # POST users/new
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path #become login when login is avail
        else
            render :new
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
