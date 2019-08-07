module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    current_user
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

  def logged_in_user
    return if logged_in?
    flash[:danger] = t :log_in_first
    redirect_to login_path
  end

  def correct_user?
    User.find_by(id: params[:id]) == current_user
  end

  def correct_user
    return if correct_user?
    flash[:danger] = t :not_allowed
    redirect_to root_path
  end

  def admin?
    if logged_in?
      current_user.admin
    else
      false
    end
  end

  def admin_user
    return if admin?
    flash[:danger] = t :not_allowed
    redirect_to root_path
  end
end
