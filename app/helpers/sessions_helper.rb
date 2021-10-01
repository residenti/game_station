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

  def store_location
    session[:return_to] = request.url
  end

  def redirect_to_or_back(default, notice_message)
    location = session[:return_to] || default
    redirect_to location, notice_message
    session.delete(:return_to)
  end
end
