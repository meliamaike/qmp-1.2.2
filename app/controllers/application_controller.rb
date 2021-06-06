class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  before_action :validate_logged_user!

  def validate_logged_user!
    if !current_user
      redirect_to '/login'
    end
  end

  def current_user

    user_id = session[:user_id]
    if user_id
      User.find(user_id)
    end
  end

  def logged_in?
    current_user.present?
  end


  # rescue_from ActionController::RoutingError, with: -> { render_404  }
  # rescue_from ActionController::UnknownController, with: -> { render_404  }
  # rescue_from ActiveRecord::RecordNotFound, with: -> { render_404  }
  #
  # rescue_from Exception, :with => :render_500
  #
  # def render_500(exception)
  #   @exception = exception
  #   render :template => "errores/server_error", :status => 500
  # end
  #
  # def render_404
  #   respond_to do |format|
  #     format.html { render template: 'errores/not_found', status: 404 }
  #     format.all { render nothing: true, status: 404 }
  #   end
  # end

end
