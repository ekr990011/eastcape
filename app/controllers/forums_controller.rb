class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end
  
  def show
    @forum = Forum.find(params[:id])
  end
  
  def new
    @forum = Forum.new
  end
 
  def create
  @forum = Forum.new(forum_params)
 
    if @forum.save
      redirect_to @forum
      flash[:success] = "Thanks for the Post!"
    else
      render new_forum_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  private
  
  def forum_params
    params.require(:Forum).permit(:title, :post)
  end
end
