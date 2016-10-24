class StaticPagesController < ApplicationController
  
  def home
    @random = rand(6)
    @forum_homepage = Forum.limit(3)
    @hb = News.last
    @vm = Vm.last
    @rancho = Rancho.last
    @google = Google.where("created_at >= ?", 1.day.ago).limit(8)
    @pete = Pete.last
    @wunder = Wunderground.last
    
    @image_iframe = "LB.Flag1.jpg"
    
    @count = @google.count
    @random_google = rand(@count)
    @random_google_entry = @google.offset(@random_google).first
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
  
  def about
  end
  
end