class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user

    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def logged_in?
    current_user.present?
  end

  def require_user
    return true if logged_in?
    render template: 'sessions/new'
    return false
  end


end
