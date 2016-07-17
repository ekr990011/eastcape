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
  
  def edit
    @forum = Forum.find(params[:id])
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
  
end