class SessionsController < ApplicationController
  invisible_captcha only: [:create], honeypot: :password_confirmation
  
  def new
    @meta_tag = "noindex nofollow"
  end
  
  def create
  @user = User.find_by_username(params[:session][:username])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to '/forums'
  else
    redirect_to new_session_path
    flash[:alert] = "Oops.. Houston, we have a problem..."
  end 
  end
  
  def destroy
    @meta_tag= "noindex"
    
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
