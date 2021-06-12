class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  # before_action :validate_logged_user!

  # def validate_logged_user!
  #   if !current_user
  #     redirect_to "/login"
  #   end
  # end

  def current_user

    user_id = session[:user_id]
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
    return true if logged_in?
    render template: 'sessions/new'
    return false
  end


end
