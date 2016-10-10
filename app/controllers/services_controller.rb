class ServicesController < ApplicationController
before_action :admin, only: [:new, :create, :destroy, :show, :edit, :update]
  
  
  def index
    @service = Service.all
  end
  
  def new
    @service = Service.new
  end
  
  def edit
    @service = Service.find(params[:id])
  end
  
  def update
  @service = Service.find(params[:id])
 
    if @service.update(service_params)
      redirect_to services_path
      flash[:success] = "Thanks for the Update!"
    else
      render edit_service_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def create
    @service = Service.new(service_params)
    
    if @service.save
      redirect_to '/'
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to new_service_path
      flash[:danger] = "Oops please enter something."
    end
  end
    
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_to '/'
  end





 private
  
  
  def service_params
    params.require(:service).permit(:biz_name, :tel, :tel2, :website, :email, :description)
  end
  
  def admin
    unless current_user && current_user.admin?
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to '/'
    end
  end
end


