class ForumsController < ApplicationController
  before_action :forum_owner, only: [:edit, :update, :destroy]
  invisible_captcha only: [:create, :update], honeypot: :website

  
  def _forum_homepage
    @forum_homepage = Forum.limit(3)
  end
  
  def index
    @forums = Forum.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @forum = Forum.find(params[:id])
    @comment = Comment.where(forum_id: @forum)
  end
  
  def new
    @forum = Forum.new
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
 
  def create
  @forum = Forum.new(forum_params)
    unless current_user.nil?
     @forum.user_id = current_user.id
    else
    end 
  
    if @forum.save
      redirect_to @forum
      flash[:success] = "Thanks for the Post!"
    else
      render new_forum_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def update
  @forum = Forum.find(params[:id])
 
    if @forum.update(forum_params)
      redirect_to @forum
      flash[:success] = "Thanks for the Update!"
    else
      render edit_forum_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_to forums_path
  end
  
  private
  
  def forum_params
    params.require(:forum).permit(:title, :post)
  end
  
  def forum_owner
    @forum = Forum.find(params[:id])
    unless ((current_user != nil) && (current_user == @forum.user))  || (current_user && current_user.admin?)
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to @forum
    end
  end
  
end
  
