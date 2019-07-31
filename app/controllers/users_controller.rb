class UsersController < ApplicationController
    # GET users/new
    def new
        @user = User.new
    end
    # POST users/new
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path
        else
            render :new
        end
    end
    # GET users/1
    def show
        @user = User.find_by(id: params[:id])
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
