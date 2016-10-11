class AdvertisesController < ApplicationController
  invisible_captcha only: [:create], honeypot: :website
  
  def new
    @advertise = Advertise.new
  end
  
  def create
    @advertise = Advertise.new(advertise_params)
    
    if @advertise.save
      redirect_to '/'
      flash[:success] = "Thanks for the Update!"
    else
      redirect_to new_advertise_path
      flash[:danger] = "Oops something didn't quite work, check your email confirmation is the same."
    end
  end
  
  
  def show
    @advertise = Advertise.find(params[:id])
  end
  
  # def destroy
  #   @advertise = Advertise.find(params[:id])
  #   @advertise.destroy
  #   flash[:success] = "Successfully Deleted!"
  #   redirect_to contact_index_path
    
  # end
  
  
  
  private
  
  
  def advertise_params
    params.require(:advertise).permit(:text, :email, :email_confirmation)
  end
  
end
