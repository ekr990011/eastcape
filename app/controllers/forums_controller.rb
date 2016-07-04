class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end
  
  def show
    @forum = Forum.find(params[:id])
  end
  
  def new
  end
 
  def create
  @forum = Forum.new(forum_params)
 
  @forum.save
  redirect_to @forum
  end
  
  private
  
  def forum_params
    params.require(:Forum).permit(:title, :post)
  end
end
