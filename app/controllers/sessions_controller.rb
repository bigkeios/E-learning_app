class SessionsController < ApplicationController
  include SessionsHelper
  # GET /login
  def new
  end
  # POST /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_path 
    else
      flash.now[:danger] = 'Invalid email or password'
      render :new
    end
  end
  # DELETE /logout
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
