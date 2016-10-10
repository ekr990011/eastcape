class ActivitiesController < ApplicationController
 before_action :admin, only: [:new, :create, :destroy, :show, :edit, :update]
  
  
  def index
    @activity = Activity.all
  end
  
  def new
    @activity = Activity.new
  end
  
  def edit
    @activity  = Activity.find(params[:id])
  end
  
  def update
  @activity = Activity.find(params[:id])
 
    if @activity .update(activity_params)
      redirect_to activities_path
      flash[:success] = "Thanks for the Update!"
    else
      render edit_activity_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to '/'
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to new_activity_path
      flash[:danger] = "Oops please enter something."
    end
  end
    
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_to '/'
  end





 private
  
  
  def activity_params
    params.require(:activity).permit(:biz_name, :tel, :tel2, :website, :email, :description)
  end
  
  def admin
    unless current_user && current_user.admin?
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to '/'
    end
  end
end

