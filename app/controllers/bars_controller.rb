class BarsController < ApplicationController
  before_action :admin, only: [:new, :create, :destroy, :show, :edit, :update]
  
  
  def index
    @bar = Bar.all
  end
  
  def new
    @bar = Bar.new
  end
  
  def edit
    @bar = Bar.find(params[:id])
  end
  
  def update
  @bar = Bar.find(params[:id])
 
    if @bar.update(bar_params)
      redirect_to bars_path
      flash[:success] = "Thanks for the Update!"
    else
      render edit_bar_path
      flash[:alert] = "Please provide input!"
    end
  end
  
  def create
    @bar = Bar.new(bar_params)
    
    if @bar.save
      redirect_to '/'
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to new_bar_path
      flash[:danger] = "Oops please enter something."
    end
  end
    
  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_to '/'
  end





 private
  
  
  def bar_params
    params.require(:bar).permit(:biz_name, :tel, :tel2, :website, :email, :city, :description)
  end
  
  def admin
    unless current_user && current_user.admin?
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to '/'
    end
  end
end
