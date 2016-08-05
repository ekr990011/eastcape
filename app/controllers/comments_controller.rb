class CommentsController < ApplicationController
  before_action :find_forum
  before_action :find_comment, only: [:edit, :update, :destroy]
  
  
  def create
    @comment = @forum.comments.create(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to @forum
      flash[:success] = "Thanks for the Post!"
    else
      redirect_to forum_path(@forum)
      flash[:alert] = "Please provide input!"
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
  @comment = Comment.find(params[:id])
 
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
