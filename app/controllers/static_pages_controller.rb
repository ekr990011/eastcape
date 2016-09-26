class StaticPagesController < ApplicationController
  def home
    @forum_homepage = Forum.limit(3)
    @news_homepage = News.last
    @news_vm = Vm.last
    @rancho = Rancho.last
  end
  
  def forum
  end
  
  def news
    @titlehb = News.last.title
    @linkhb = News.last
    @newsdate = News.last.date
    
    @titlevm = Vm.last.title
    @linkvm  = Vm.last
    @datevm  = Vm.last.date
    
    @title_rancho = Rancho.last.title
    @date_rancho = Rancho.last.date
    @url_rancho = Rancho.last.url
    
    @title_google = Google.where("created_at >= ?", 1.day.ago).limit(8)
    
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
  
  def fishing
  end
end