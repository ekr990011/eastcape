class CommentsController < ApplicationController
  def create
    @forum = Forum.find(params[:forum_id])
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
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :reply)
    end
end
