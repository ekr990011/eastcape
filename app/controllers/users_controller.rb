class UsersController < ApplicationController
  invisible_captcha only: [:create], honeypot: :website
  
  def new
    @meta_tag="noindex nofollow"
    
    @user = User.new
  end
  
  def create
    @meta_tag="noindex"
    
    @user = User.new(user_params)
    if 
      @user.save
      session[:user_id] = @user.id
      redirect_to '/forums'
    else
      redirect_to '/signup'
      flash[:danger] = "Oh no! Someone already has that name."
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
end
