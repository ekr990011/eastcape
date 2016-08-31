class StaticPagesController < ApplicationController
  def home
    @forum_homepage = Forum.last(5)
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
    
    @title_google = Google.where(created_at: Date.today..1.day.from_now).limit(5)
    
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