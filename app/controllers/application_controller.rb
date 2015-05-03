class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end

  def authenticate_user!(return_point = request.url)
    unless current_user
      set_return_point(return_point)
      redirect_to signin_path
    end
  end

  def set_return_point(path, overwrite = false)
    if overwrite || session[:return_point].blank?
      session[:return_point] = path
    end
  end

  def return_point
    session[:return_point] || root_path
  end
end
