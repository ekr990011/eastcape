class StaticPagesController < ApplicationController
  def home
  end
  
  def forum
  end
  
  def news
    @titlehb = News.last.title
    @linkhb = News.last
    
    @titlevm = Vm.last.title
    @linkvm  = Vm.last
    @datevm  = Vm.last.date
    
    @title_rancho = Rancho.last.title
    @date_rancho = Rancho.last.date
    
    @title_google = Google.all
    
    @title_pete = Pete.last.title
    @date_pete = Pete.last.date
    @url_pete = Pete.last.url
    
    @title_wunder = Wunderground.last.title
    @url_wunder = Wunderground.last.url
    
    
  end
  
  def advertise
  end
  
  def about
  end
  
  def contact
  end
end