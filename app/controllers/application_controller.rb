class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :log_in, :log_out
  before_action :require_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def require_user
    if !logged_in?
        flash[:notice] = 'You are need to log in to perform this action'
        redirect_to root_path
    end
  end

end
