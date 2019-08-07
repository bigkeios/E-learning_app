class UsersController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: %i[show index edit update]
  before_action :correct_user, only: %i[edit update]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :admin_user, :admin_delete, only: %i[destroy]

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
  def show; end

  # GET users
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  # GET users/1/edit
  def edit; end

  # POST users/1/edit
  def update
    if @user.update_attributes(user_params)
      flash[:success] = t :updated_info
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # DELETE users/1
  def destroy
    if @user.destroy
      flash[:success] = t :delete_user_succ
    else
      flash[:danger] = t :delete_user_fail
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:danger] = t :no_user
      redirect_to root_path
    end
  end

  def admin_delete
    unless !correct_user && admin?
      flash[:danger] = t :no_delete_admin
      redirect_to root_path
    end
  end
end
