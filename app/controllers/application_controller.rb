class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :weather
  helper_method :dollar
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def correct_forum_user
    if current_user == @forum.user_id
      @correct_forum_user = current_user
    end
  end
  
  def require_user
    redirect_to '/' unless current_user
  end
  
  def weather
    @weather = Weather.last
  end
  
  def dollar
    @dollar = Dollar.last
  end
  
end