class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    user_id=session[:user_id]
    if user_id
      User.find(user_id)
    else
      nil
    end
  end

  def logged_in?
    current_user.present?
  end

  def require_user
    if logged_in?
      return true
      render template: 'sessions/new'
    else
      return false
      redirect_to login_path, alert: "Tenes que estar logueado para realizar esta accion" if current_user.nil?
    end
  end


end
