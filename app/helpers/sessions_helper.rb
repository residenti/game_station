module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user_id)
    session[:user_id] = user_id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !!current_user
  end
end
