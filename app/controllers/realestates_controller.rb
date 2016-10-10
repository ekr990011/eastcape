class RealestatesController < ApplicationController
 before_action :admin, only: [:new, :create, :destroy, :show, :edit, :update]
  
  
  def index
    @realestate = Realestate.all
  end
  
  def new
    @realestate = Realestate.new
  end
  
  def edit
    @realestate = Realestate.find(params[:id])
  end
  
  def update
  @realestate = Realestate.find(params[:id])
 
    if @realestate.update(realestate_params)
      redirect_to realestates_path
      flash[:success] = "Thanks for the Update!"
    else
      render edit_realestate_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def create
    @realestate = Realestate.new(realestate_params)
    
    if @realestate.save
      redirect_to '/'
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to new_realestate_path
      flash[:danger] = "Oops please enter something."
    end
  end
    
  def destroy
    @realestate = Realestate.find(params[:id])
    @realestate.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_to '/'
  end





 private
  
  
  def realestate_params
    params.require(:realestate).permit(:biz_name, :tel, :tel2, :website, :email, :description)
  end
  
  def admin
    unless current_user && current_user.admin?
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to '/'
    end
  end
end

