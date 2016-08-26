namespace :noko do
  task scrape: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @page = @a.get('http://www.hotelbuenavista.com/n/fish-report')
    @title = @page.search('p+ .blog-item a')
    @date = @page.search('p+ .blog-item i')
  
      News.create do |p|
          p.title = @title.text
          p.url   = @title.attribute('href').text
          p.date  = @date.text
          p.save
      end
      
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
    #@a = Mechanize.new
    #@a.user_agent_alias = 'Mac Safari 4'
    #@page = @a.get('http://www.rancholeonero.com/fishing_boat/fiishing_fish_report.html')
    #@title = @page.search('//p[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]//strong')
    

    @a = Mechanize.new
    @page = @a.get('https://news.google.com/')
    @newsf = @page.form_with(:action => "//www.google.com/search?cf=all&hl=en&pz=1&ned=us")
    @newsf.q = "east cape baja"
    @search_results = @a.submit(@newsf)
    @search = @search_results.links
    @google_list = ["Search", "Images", "Maps", "Play", "YouTube", "Gmail", "Drive", 
                    "More »", "Web History", "Settings", "Sign in", "", "All", "Images",
                    "Videos", "Shopping", "Maps", "Books", "Blogs", "Past hour", "Past 24 hours",
                    "Past week", "Past month", "Past year", "Archives", "Sorted by date",
                    "2", "3", "4", "5", "6", "7", "8", "9", "10", "Next", "Advanced search",
                    "RSS", "Search Help", "Send feedback", "Business Solutions", "Privacy", "Terms", "About Google", 
                    "Google Home", "Advertising Programs"]
  
    @search.each do |x|
      if @google_list.exclude?(x.text)
        Google.create do |y|
          y.title = x.text
          y.url = x.uri.to_s.slice(7..-1)
        end
      end
    end
  
  
end
end

    