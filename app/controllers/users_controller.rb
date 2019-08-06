class UsersController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user?, only: %i[show index edit update]
  before_action :correct_user?, only: %i[edit update]
  before_action :set_user, only: %i[show edit update destroy]

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
    unless @user
      flash[:danger] = t :flsh_no_user
      redirect_to root_path
    end
  end

  # GET users
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  # GET users/1/edit
  def edit; end

  # POST users/1/edit
  def update
    if @user.update_attributes(user_params)
      flash[:success] = t :flsh_updated_info 
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # DELETE users/1
  def destroy
    @user.destroy
    if @user.destroyed?
      flash[:success] = t :flsh_delete_user_succ
    else
      flash[:danger] = t :flsh_delete_user_fail
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def set_user
    @user = User.find_by(id: params[:id])
    return unless @user
  end
end
