module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
      session.delete(:user_id)
      @current_user = nil
  end

  def logged_in_user?
      if !logged_in?
          flash[:danger] = "Please log in first"
          redirect_to login_path
      end
  end
  
  def correct_user?
      @user = User.find_by(id: params[:id])
      redirect_to root_path if current_user != @user
  end
end
