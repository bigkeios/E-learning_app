class UsersController < ApplicationController
    include SessionsHelper
    before_action :logged_in_user?, only: [:show, :index, :edit, :update]

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
    # GET users
    def index
        @users = User.paginate(page: params[:page], per_page: 20)
    end
    # GET users/1/edit
    def edit
        @user = User.find_by(id: params[:id])
    end

    #POST users/1/edit
    def update
        @user = User.find_by(id: params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Updated information"
            redirect_to user_path(@user)
        else
            render :edit
        end
    end
    
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

        def logged_in_user?
            if !logged_in?
                flash[:danger] = "Please log in first"
                redirect_to login_path
            end
        end
end
