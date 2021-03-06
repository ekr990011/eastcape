class CommentsController < ApplicationController
  before_action :find_forum
  before_action :find_comment, only: [:edit, :update, :destroy, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]
  invisible_captcha only: [:create, :update], honeypot: :website
  
  def create
    @comment = @forum.comments.new(comment_params)
    unless current_user.nil?
      @comment.user_id = current_user.id
    else
    end 
    
    
    if @comment.save
      redirect_to forum_path(@forum)
      flash[:success] = "Thanks for the Post!"
    else
      redirect_to '/'#forum_path(@forum)
      flash[:alert] = "Please provide input!"
    end
  end
  
  def edit
    @comments = Comment.all
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to @forum
      flash[:success] = "Thanks for the Update!"
    else
      render edit_forum_comment_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_to forum_path(@forum)
  end
  
  
  private
  
  
    def comment_owner
      unless ((current_user != nil) && (current_user == @comment.user))  || (current_user && current_user.admin?)
        flash[:danger] = "How dare you use your guile tactics on us!"
        redirect_to @forum
      end
    end
    
    def comment_params
      params.require(:comment).permit(:commenter, :reply)
    end
    
    def find_forum
      @forum = Forum.find(params[:forum_id])
    end
    
    def find_comment
      @comment = @forum.comments.find(params[:id])
    end
end
