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
  end
  
  def advertise
  end
  
  def about
  end
  
  def contact
  end
end