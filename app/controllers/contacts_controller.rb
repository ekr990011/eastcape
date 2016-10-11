class ContactsController < ApplicationController
  before_action :admin, only: [:index, :destroy, :show]
  invisible_captcha only: [:create], honeypot: :website
  
  def index
    @contact = Contact.all
    @advertise = Advertise.all
  end
  
  def show
    @contact = Contact.find(params[:id])
 
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      redirect_to '/'
      flash[:success] = "Thanks for the Input!"
    else
      redirect_to new_contact_path
      flash[:danger] = "Oops please enter something."
    end
  
     
  end
  
  # def destroy
  #   @contact = Contact.find(params[:id])
  #   @contact.destroy
  #   flash[:success] = "Successfully Deleted!"
  #   redirect_to contacts_path
  # end
  
  # def destroy_advertise 
  #   @advertise = Advertise.find(params[:id])
  #   @advertise.destroy
  #   flash[:success] = "Successfully Deleted!"
  #   redirect_to contacts_path 
  # end
  

  
  private
  
  
  def contact_params
    params.require(:contact).permit(:text, :email)
  end
  
  def admin
    unless current_user && current_user.admin?
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to '/'
    end
  end
  
  
end