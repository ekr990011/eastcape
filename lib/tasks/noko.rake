namespace :noko do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @page = @a.get('http://www.hotelbuenavista.com/n/fish-report')
    @title = @page.search('p+ .blog-item a')
    @date = @page.search('p+ .blog-item i')
  
  #@titlehb.each do |x|
    #@datehb.each do |y|
      News.create do |p|
          p.title = @title.text
          p.url   = @title.attribute('href').text
          p.date  = @date.text
          p.save
      end
    #end
    @a = Mechanize.new
    @page = @a.get('https://vanwormerresorts.com/fishing-report')
    @title = @page.search('li:nth-child(1) .desc')
    @date = @page.search('li:nth-child(1) span')
    @url = @page.search('li:nth-child(1) .read_more')
      Vm.create do |p|
        p.title = @title.text
        p.url   = @url.attribute('href').text
        p.date  = @date.text
        p.save
      end
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('http://www.rancholeonero.com/fishing_boat/fiishing_fish_report.html')
    @title = @page.search('//p[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]//strong')
    pp @title.text
  end
end


    