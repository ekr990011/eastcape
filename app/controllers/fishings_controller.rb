class FishingsController < ApplicationController
    before_action :admin, only: [:new, :create, :destroy, :show, :edit, :update]
  
  
  def index
    @fishing = Fishing.all
  end
  
  def new
    @fishing = Fishing.new
  end
  
  def edit
    @fishing = Fishing.find(params[:id])
  end
  
  def update
  @fishing = Fishing.find(params[:id])
 
    if @fishing.update(fishing_params)
      redirect_to fishings_path
      flash[:success] = "Thanks for the Update!"
    else
      render edit_fishing_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def create
    @fishing = Fishing.new(fishing_params)
    
    if @fishing.save
      redirect_to '/'
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to new_fishing_path
      flash[:danger] = "Oops please enter something."
    end
  end
    
  def destroy
    @fishing = Fishing.find(params[:id])
    @fishing.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_to '/'
  end





 private
  
  
  def fishing_params
    params.require(:fishing).permit(:biz_name, :tel, :tel2, :website, :email, :description)
  end
  
  def admin
    unless current_user && current_user.admin?
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to '/'
    end
  end
end
